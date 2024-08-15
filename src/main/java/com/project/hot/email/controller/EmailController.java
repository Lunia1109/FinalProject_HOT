package com.project.hot.email.controller;

import com.project.hot.email.model.dto.Email;
import com.project.hot.email.model.dto.EmailAtt;
import com.project.hot.email.model.dto.EmailReceiver;
import com.project.hot.email.model.service.EmailService;
import com.project.hot.employee.model.dto.Employee;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.*;

/**
 * 이메일 관련 기능을 처리하는 컨트롤러
 */
@Slf4j
@Controller
@RequestMapping("/email")
@RequiredArgsConstructor // Lombok을 사용하여 생성자 주입을 간소화
public class EmailController {

    private final EmailService emailService;

    @Value("${image.upload.path}")
    private String fileUploadPath;

    /**
     * 이메일 메인 페이지를 보여줍니다.
     */
    @GetMapping("/")
    public String showEmail() {
        return "email/email";
    }

    /**
     * 특정 메일함의 내용을 보여줍니다.
     */
    @GetMapping("/{mailbox}")
    public String getMailboxContent(@PathVariable String mailbox,
                                    @RequestParam(defaultValue = "1") int page,
                                    @RequestParam(defaultValue = "10") int size,
                                    Model model) {
        Employee loginEmployee = getLoggedInEmployee();
        Map<String, Object> result = emailService.getEmailsByMailbox(mailbox, loginEmployee.getEmployeeNo(), page, size);

        model.addAttribute("emails", result.get("emails"));
        model.addAttribute("currentPage", result.get("currentPage"));
        model.addAttribute("totalPages", result.get("totalPages"));
        model.addAttribute("mailbox", mailbox);
        return "email/" + mailbox;
    }

    /**
     * 특정 이메일의 상세 내용을 보여줍니다.
     */
    @GetMapping("/view/{emailNo}")
    public String viewEmail(@PathVariable int emailNo, Model model) {
        Email email = emailService.getEmailByNo(emailNo);
        List<EmailAtt> attachments = email.hasAttachment() ? emailService.getEmailAttachments(emailNo) : new ArrayList<>();

        model.addAttribute("email", email);
        model.addAttribute("attachments", attachments);

        return "email/view";
    }

    /**
     * 이메일 작성 폼을 보여줍니다.
     */
    @GetMapping("/write")
    public String showWriteForm(@RequestParam(required = false) String action,
                                @RequestParam(required = false) Integer emailNo,
                                Model model) {
        Email email = new Email();

        if (emailNo != null) {
            Email originalEmail = emailService.getEmailByNo(emailNo);
            email = prepareEmailForAction(action, originalEmail);
        }

        model.addAttribute("email", email);
        model.addAttribute("mailbox", "write");
        return "email/email";
    }

    /**
     * 이메일을 전송합니다.
     */
    @PostMapping("/send")
    public ResponseEntity<?> saveEmail(@RequestParam("receivers") String receivers,
                                       @RequestParam("emailTitle") String emailTitle,
                                       @RequestParam("emailContent") String emailContent,
                                       @RequestParam(value = "attachments", required = false) MultipartFile[] attachments) {
        if (receivers.trim().isEmpty()) {
            return ResponseEntity.badRequest().body("수신자가 지정되지 않았습니다.");
        }

        try {
            Employee sender = getLoggedInEmployee();
            Email email = createEmail(sender, emailTitle, emailContent, attachments);
            List<EmailReceiver> emailReceivers = processReceivers(receivers);

            if (emailReceivers.isEmpty()) {
                log.warn("수신자 없음: {}", receivers);
                return ResponseEntity.badRequest().body("유효한 수신자가 없습니다.");
            }

            email.setReceivers(emailReceivers);
            emailService.saveEmail(email, attachments);

            return ResponseEntity.ok().body("이메일 전송 성공");
        } catch (IOException e) {
            log.error("이메일 전송 실패", e);
            return ResponseEntity.badRequest().body("이메일 전송 실패 : " + e.getMessage());
        }
    }

    /**
     * 직원을 검색합니다.
     */
    @GetMapping("/search-employees")
    public ResponseEntity<List<Map<String, String>>> searchEmployees(@RequestParam String keyword) {
        try {
            List<Employee> employees = emailService.searchEmployees(keyword);
            List<Map<String, String>> result = employees.stream()
                .filter(Objects::nonNull)
                .map(this::mapEmployeeToSearchResult)
                .toList();

            return ResponseEntity.ok(result);
        } catch (Exception e) {
            log.error("직원 검색 중 오류 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    /**
     * 이메일을 검색합니다.
     */
    @GetMapping("/search")
    public String searchEmails(@RequestParam String keyword,
                               @RequestParam(defaultValue = "1") int page,
                               @RequestParam(defaultValue = "10") int size,
                               Model model) {
        Employee loginEmployee = getLoggedInEmployee();
        Map<String, Object> result = emailService.searchEmails(loginEmployee.getEmployeeNo(), keyword, page, size);

        model.addAttribute("emails", result.get("emails"));
        model.addAttribute("currentPage", result.get("currentPage"));
        model.addAttribute("totalPages", result.get("totalPages"));

        return "email/inbox-list";
    }

    /**
     * 읽지 않은 이메일 수를 가져옵니다.
     */
    @GetMapping("/unread-counts")
    @ResponseBody
    public Map<String, Integer> getUnreadCounts() {
        Employee loginEmployee = getLoggedInEmployee();
        return emailService.getUnreadCounts(loginEmployee.getEmployeeNo());
    }

    /**
     * 이메일을 읽음 처리합니다.
     */
    @PostMapping("/mark-as-read")
    @ResponseBody
    public ResponseEntity<?> markAsRead(@RequestBody List<Integer> emailNos,
                                        @RequestParam(defaultValue = "1") int page,
                                        @RequestParam(defaultValue = "10") int size) {
        return processEmailAction(emailNos, page, size,
            (nos, empNo, p, s) -> emailService.markEmailsAsRead(nos, empNo, p, s));
    }

    /**
     * 이메일을 중요 표시 토글합니다.
     */
    @PostMapping("/toggle-important")
    @ResponseBody
    public ResponseEntity<?> toggleImportant(@RequestBody List<Integer> emailNos,
                                             @RequestParam(defaultValue = "1") int page,
                                             @RequestParam(defaultValue = "10") int size) {
        return processEmailAction(emailNos, page, size,
            (nos, empNo, p, s) -> emailService.toggleImportantEmails(nos, empNo, p, s));
    }

    /**
     * 이메일을 휴지통으로 이동합니다.
     */
    @PostMapping("/move-to-trash")
    @ResponseBody
    public ResponseEntity<?> moveEmailsToTrash(@RequestBody List<Integer> emailNos,
                                               @RequestParam(defaultValue = "1") int page,
                                               @RequestParam(defaultValue = "10") int size) {
        return processEmailAction(emailNos, page, size,
            (nos, empNo, p, s) -> emailService.moveEmailsToTrash(nos, empNo, p, s));
    }

    /**
     * 이메일을 영구 삭제합니다.
     */
    @PostMapping("/trash/delete-permanently")
    @ResponseBody
    public ResponseEntity<?> deletePermanently(@RequestBody List<Integer> emailNos) {
        if (emailNos == null || emailNos.isEmpty()) {
            return ResponseEntity.badRequest().body("삭제할 메일을 선택하세요.");
        }

        try {
            Employee loginEmployee = getLoggedInEmployee();
            int deletedCount = emailService.deletePermanently(emailNos, loginEmployee.getEmployeeNo());
            return ResponseEntity.ok("성공적으로 " + deletedCount + "개의 이메일을 영구 삭제했습니다.");
        } catch (Exception e) {
            log.error("이메일 영구 삭제 중 오류 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("영구 삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    /**
     * 휴지통에서 이메일을 복구합니다.
     */
    @PostMapping("/trash/restore")
    @ResponseBody
    public ResponseEntity<?> restoreFromTrash(@RequestBody List<Integer> emailNos) {
        Employee loginEmployee = getLoggedInEmployee();
        try {
            int restoredCount = emailService.restoreFromTrash(emailNos, loginEmployee.getEmployeeNo());
            return ResponseEntity.ok("성공적으로 " + restoredCount + "개의 이메일을 복구했습니다.");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("복구 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    /**
     * 첨부 파일을 다운로드합니다.
     */
    @GetMapping("/download/{attachmentId}")
    public ResponseEntity<Resource> downloadAttachment(@PathVariable int attachmentId) throws IOException {
        EmailAtt attachment = emailService.getAttachment(attachmentId);
        Path filePath = Paths.get(fileUploadPath, attachment.getEmailAttRenamedFilename());
        Resource resource = new UrlResource(filePath.toUri());

        log.info("파일 다운로드 시도: {}", filePath);

        if (resource.exists() && resource.isReadable()) {
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + attachment.getEmailAttOriginalFilename() + "\"")
                    .body(resource);
        } else {
            log.error("파일을 찾을 수 없거나 읽을 수 없음: {}", filePath);
            throw new IOException("파일을 찾을 수 없거나 읽을 수 없음: " + attachment.getEmailAttRenamedFilename());
        }
    }

    /**
     * 이메일의 첨부 파일 목록을 가져옵니다.
     */
    @GetMapping("/attachments/{emailNo}")
    @ResponseBody
    public List<EmailAtt> getEmailAttachments(@PathVariable int emailNo) {
        return emailService.getEmailAttachments(emailNo);
    }

    // 헬퍼 메소드

    /**
     * 현재 로그인한 직원 정보를 가져옵니다.
     */
    private Employee getLoggedInEmployee() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return (Employee) auth.getPrincipal();
    }

    /**
     * 이메일 액션(답장, 전달)에 따라 이메일을 준비합니다.
     */
    private Email prepareEmailForAction(String action, Email originalEmail) {
        Email email = new Email();
        if ("reply".equals(action)) {
            email.setEmailTitle("Re: " + originalEmail.getEmailTitle());
            email.setReceivers(List.of(createEmailReceiver(originalEmail.getSender())));
            email.setEmailContent(createQuotedContent(originalEmail));
        } else if ("forward".equals(action)) {
            email.setEmailTitle("Fwd: " + originalEmail.getEmailTitle());
            email.setEmailContent(createForwardedContent(originalEmail));
            email.setHasAttachment(originalEmail.hasAttachment());
        }
        return email;
    }

    /**
     * 이메일 수신자 객체를 생성합니다.
     */
    private EmailReceiver createEmailReceiver(Employee employee) {
        return EmailReceiver.builder()
            .employee(employee)
            .emailReceiverCategory(1)
            .emailReceiverIsRead("N")
            .emailReceiverIsDelete("N")
            .emailReceiverIsImportant("N")
            .build();
    }

    /**
     * 인용된 내용을 생성합니다 (답장용).
     */
    private String createQuotedContent(Email originalEmail) {
        return String.format("\n\n-------- 원본 메시지 --------\n" +
                             "보낸사람: %s\n" +
                             "날짜: %s\n" +
                             "제목: %s\n\n" +
                             "%s",
                             originalEmail.getSender().getEmployeeName(),
                             originalEmail.getEmailSendDate(),
                             originalEmail.getEmailTitle(),
                             originalEmail.getEmailContent());
    }

    /**
     * 전달된 내용을 생성합니다 (전달용).
     */
    private String createForwardedContent(Email originalEmail) {
        return String.format("\n\n-------- 전달된 메시지 --------\n" +
                             "보낸사람: %s\n" +