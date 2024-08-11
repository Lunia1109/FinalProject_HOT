package com.project.hot.email.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.hot.email.model.dto.Email;
import com.project.hot.email.model.dto.EmailAtt;
import com.project.hot.email.model.dto.EmailReceiver;
import com.project.hot.email.model.service.EmailService;
import com.project.hot.employee.model.dto.Employee;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/email")
public class EmailController {

	//왜 final로?
    private final EmailService service;
    private final String fileUploadPath;

    @Autowired
    public EmailController(EmailService service, @Value("${image.upload.path}") String fileUploadPath) {
        this.service = service;
        this.fileUploadPath = fileUploadPath;
    }

    @GetMapping("/")
    public String showEmail() {
        return "email/email";
    }

    @GetMapping
    public String showEmailMain(@RequestParam(required = false, defaultValue = "inbox") String mailbox, Model model) {
        model.addAttribute("currentMailbox", mailbox);
        return "email/email";
    }

    @GetMapping("/{mailbox}")
    public String getMailboxContent(@PathVariable String mailbox,
                                    @RequestParam(defaultValue = "1") int page,
                                    @RequestParam(defaultValue = "10") int size,
                                    Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        Map<String, Object> result;

        switch (mailbox) {
            case "inbox":
                result = service.getInboxEmails(loginEmployee.getEmployeeNo(), page, size);
                break;
            case "sent":
                result = service.getSentEmails(loginEmployee.getEmployeeNo(), page, size);
                break;
            case "important":
                result = service.getImportantEmails(loginEmployee.getEmployeeNo(), page, size);
                break;
            case "self":
                result = service.getSelfEmails(loginEmployee.getEmployeeNo(), page, size);
                break;
            case "trash":
                result = service.getTrashEmails(loginEmployee.getEmployeeNo(), page, size);
                break;
            default:
                return "redirect:/email/inbox";
        }

        model.addAttribute("emails", result.get("emails"));
        model.addAttribute("currentPage", result.get("currentPage"));
        model.addAttribute("totalPages", result.get("totalPages"));
        model.addAttribute("mailbox", mailbox);
        return "email/" + mailbox;
    }

    @GetMapping("/inbox")
    public String inbox(@RequestParam(defaultValue = "1") int page,
                        @RequestParam(defaultValue = "10") int size,
                        Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        Map<String, Object> result = service.getInboxEmails(loginEmployee.getEmployeeNo(), page, size);

        model.addAttribute("emails", result.get("emails"));
        model.addAttribute("currentPage", result.get("currentPage"));
        model.addAttribute("totalPages", result.get("totalPages"));
        model.addAttribute("mailbox", "inbox");

        return "email/email";
    }

    @GetMapping("/sent")
    public String sent(@RequestParam(defaultValue = "1") int page,
                       @RequestParam(defaultValue = "10") int size,
                       Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        Map<String, Object> result = service.getSentEmails(loginEmployee.getEmployeeNo(), page, size);

        model.addAttribute("emails", result.get("emails"));
        model.addAttribute("currentPage", result.get("currentPage"));
        model.addAttribute("totalPages", result.get("totalPages"));
        model.addAttribute("mailbox", "sent");

        return "email/email";
    }

    @GetMapping("/self")
    public String self(@RequestParam(defaultValue = "1") int page,
                       @RequestParam(defaultValue = "10") int size,
                       Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        Map<String, Object> result = service.getSelfEmails(loginEmployee.getEmployeeNo(), page, size);

        model.addAttribute("emails", result.get("emails"));
        model.addAttribute("currentPage", result.get("currentPage"));
        model.addAttribute("totalPages", result.get("totalPages"));
        model.addAttribute("mailbox", "self");

        return "email/email";
    }

    @GetMapping("/important")
    public String important(@RequestParam(defaultValue = "1") int page,
                            @RequestParam(defaultValue = "10") int size,
                            Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        Map<String, Object> result = service.getImportantEmails(loginEmployee.getEmployeeNo(), page, size);

        model.addAttribute("emails", result.get("emails"));
        model.addAttribute("currentPage", result.get("currentPage"));
        model.addAttribute("totalPages", result.get("totalPages"));
        model.addAttribute("mailbox", "important");

        return "email/email";
    }

    @GetMapping("/trash")
    public String trash(@RequestParam(defaultValue = "1") int page,
                        @RequestParam(defaultValue = "10") int size,
                        Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        Map<String, Object> result = service.getTrashEmails(loginEmployee.getEmployeeNo(), page, size);

        model.addAttribute("emails", result.get("emails"));
        model.addAttribute("currentPage", result.get("currentPage"));
        model.addAttribute("totalPages", result.get("totalPages"));
        model.addAttribute("mailbox", "trash");

        return "email/email";
    }

    @GetMapping("/view/{emailNo}")
    public String viewEmail(@PathVariable int emailNo, Model model) {
        Email email = service.getEmailByNo(emailNo);
        List<EmailAtt> attachments = new ArrayList<>();

        if (email.hasAttachment()) {
            attachments = service.getEmailAttachments(emailNo);
        }

        log.info("Email: {}", email);
        log.info("Attachments: {}", attachments);

        model.addAttribute("email", email);
        model.addAttribute("attachments", attachments);

        return "email/view";
    }

    @GetMapping("/write")
    public String showWriteForm(@RequestParam(required = false) String action,
                                @RequestParam(required = false) Integer emailNo,
                                Model model) {
        Email email = new Email();

        if (emailNo != null) {
            Email originalEmail = service.getEmailByNo(emailNo);

            if ("reply".equals(action)) {
                email.setEmailTitle("Re: " + originalEmail.getEmailTitle());
                EmailReceiver receiver = EmailReceiver.builder()
                    .employee(originalEmail.getSender())
                    .emailReceiverCategory(1)
                    .emailReceiverIsRead("N")
                    .emailReceiverIsDelete("N")
                    .emailReceiverIsImportant("N")
                    .build();
                email.setReceivers(Arrays.asList(receiver));

                String quotedContent = "\n\n-------- 원본 메시지 --------\n" +
                                       "보낸사람: " + originalEmail.getSender().getEmployeeName() + "\n" +
                                       "날짜: " + originalEmail.getEmailSendDate() + "\n" +
                                       "제목: " + originalEmail.getEmailTitle() + "\n\n" +
                                       "\n" +
                                       originalEmail.getEmailContent();
                email.setEmailContent(quotedContent);

                model.addAttribute("receiverEmail", originalEmail.getSender().getEmployeeId() + "@hot.com");
            } else if ("forward".equals(action)) {
                email.setEmailTitle("Fwd: " + originalEmail.getEmailTitle());
                String forwardedContent = "\n\n-------- 전달된 메시지 --------\n" +
                                          "보낸사람: " + originalEmail.getSender().getEmployeeName() + "\n" +
                                          "날짜: " + originalEmail.getEmailSendDate() + "\n" +
                                          "제목: " + originalEmail.getEmailTitle() + "\n\n" +
                                          "\n" +
                                          originalEmail.getEmailContent();
                email.setEmailContent(forwardedContent);
                email.setHasAttachment(originalEmail.hasAttachment());
            }
        }

        model.addAttribute("email", email);
        model.addAttribute("mailbox", "write");
        return "email/email";
    }

    @GetMapping("/write-self")
    public String showWriteSelfForm(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        model.addAttribute("email", new Email());
        model.addAttribute("loginEmployee", loginEmployee);
        model.addAttribute("mailbox", "write-self");
        return "email/email";
    }

    @PostMapping("/send")
    public ResponseEntity<?> saveEmail(
            @RequestParam("receivers") String receivers,
            @RequestParam("emailTitle") String emailTitle,
            @RequestParam("emailContent") String emailContent,
            @RequestParam(value = "attachments", required = false) MultipartFile[] attachments) {

        if (receivers == null || receivers.trim().isEmpty()) {
            return ResponseEntity.badRequest().body("수신자가 지정되지 않았습니다.");
        }

        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Employee sender = (Employee) auth.getPrincipal();

            Email email = Email.builder()
                    .sender(sender)
                    .emailTitle(emailTitle)
                    .emailContent(emailContent)
                    .emailSendDate(new Date(System.currentTimeMillis()))
                    .emailIsDelete("N")
                    .hasAttachment(attachments != null && attachments.length > 0)
                    .build();

            List<EmailReceiver> emailReceivers = new ArrayList<>();
            String[] receiverEmails = receivers.split(",");

            for (String receiverEmail : receiverEmails) {
                String trimmedEmail = receiverEmail.trim();
                String employeeId = trimmedEmail.split("@")[0];

                if (!employeeId.isEmpty()) {
                    Employee receiver = service.findEmployeeByEmployeeId(employeeId);
                    if (receiver != null) {
                        EmailReceiver emailReceiver = EmailReceiver.builder().employee(receiver).build();
                        if (!emailReceivers.contains(emailReceiver)) {
                            emailReceivers.add(emailReceiver);
                        }
                    }
                }
            }

            if (emailReceivers.isEmpty()) {
                log.warn("수신자 없음: {}", receivers);
                return ResponseEntity.badRequest().body("유효한 수신자가 없습니다.");
            }

            log.info("Processed receivers: {}", emailReceivers);
            email.setReceivers(emailReceivers);

            service.saveEmail(email, attachments);

            return ResponseEntity.ok().body("이메일 전송 성공");

        } catch (IOException e) {
            log.error("이메일 전송 실패", e);
            return ResponseEntity.badRequest().body("이메일 전송 실패 : " + e.getMessage());
        }
    }

    @GetMapping("/search-employees")
    public ResponseEntity<List<Map<String, String>>> searchEmployees(@RequestParam String keyword) {
        try {
            List<Employee> employees = service.searchEmployees(keyword);
            List<Map<String, String>> result = new ArrayList<>();

            for (Employee employee : employees) {
                if (employee != null) {
                    Map<String, String> employeeMap = new HashMap<>();
                    employeeMap.put("name", employee.getEmployeeName() != null ? employee.getEmployeeName() : "");
                    employeeMap.put("email", employee.getEmployeeId() != null ? employee.getEmployeeId() + "@hot.com" : "");
                    result.add(employeeMap);
                } else {
                    log.warn("Null employee object found in search results for keyword: {}", keyword);
                }
            }

            return ResponseEntity.ok(result);
        } catch (Exception e) {
            log.error("Error occurred while searching employees", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }



    @GetMapping("/search")
    public String searchEmails(@RequestParam String keyword,
                               @RequestParam(defaultValue = "1") int page,
                               @RequestParam(defaultValue = "10") int size,
                               Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        int employeeNo = loginEmployee.getEmployeeNo();

        Map<String, Object> result = service.searchEmails(employeeNo, keyword, page, size);
        model.addAttribute("emails", result.get("emails"));
        model.addAttribute("currentPage", result.get("currentPage"));
        model.addAttribute("totalPages", result.get("totalPages"));

        return "email/inbox-list";
    }

    @GetMapping("/unread-counts")
    @ResponseBody
    public Map<String, Integer> getUnreadCounts() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        int employeeNo = loginEmployee.getEmployeeNo();

        Map<String, Integer> counts = new HashMap<>();
        counts.put("inboxUnreadCount", service.getInboxUnreadCount(employeeNo));
        counts.put("selfUnreadCount", service.getSelfUnreadCount(employeeNo));
        counts.put("importantUnreadCount", service.getImportantUnreadCount(employeeNo));
        counts.put("trashCount", service.getTrashCount(employeeNo));

        return counts;
    }

    @PostMapping("/mark-as-read")
    @ResponseBody
    public ResponseEntity<?> markAsRead(@RequestBody List<Integer> emailNos,
                                        @RequestParam(defaultValue = "1") int page,
                                        @RequestParam(defaultValue = "10") int size) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        int employeeNo = loginEmployee.getEmployeeNo();

        try {
            Map<String, Object> result = service.markEmailsAsRead(emailNos, employeeNo, page, size);
            return ResponseEntity.ok(result);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("상태 변경 실패: " + e.getMessage());
        }
    }

    @PostMapping("/toggle-important")
    @ResponseBody
    public ResponseEntity<?> toggleImportant(@RequestBody List<Integer> emailNos,
                                             @RequestParam(defaultValue = "1") int page,
                                             @RequestParam(defaultValue = "10") int size) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        int employeeNo = loginEmployee.getEmployeeNo();

        try {
            Map<String, Object> result = service.toggleImportantEmails(emailNos, employeeNo, page, size);
            return ResponseEntity.ok(result);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("중요 표시 변경 실패: " + e.getMessage());
        }
    }

    @PostMapping("/move-to-trash")
    @ResponseBody
    public ResponseEntity<?> moveEmailsToTrash(@RequestBody List<Integer> emailNos,
                                               @RequestParam(defaultValue = "1") int page,
                                               @RequestParam(defaultValue = "10") int size) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        int employeeNo = loginEmployee.getEmployeeNo();

        try {
            Map<String, Object> result = service.moveEmailsToTrash(emailNos, employeeNo, page, size);
            return ResponseEntity.ok(result);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("이메일 이동 실패: " + e.getMessage());
        }
    }

    @PostMapping("/trash/delete-permanently")
    @ResponseBody
    public ResponseEntity<?> deletePermanently(@RequestBody List<Integer> emailNos) {
        if (emailNos == null || emailNos.isEmpty()) {
            return ResponseEntity.badRequest().body("삭제할 메일을 선택하세요.");
        }

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        int employeeNo = loginEmployee.getEmployeeNo();

        try {
            int deletedCount = service.deletePermanently(emailNos, employeeNo);
            return ResponseEntity.ok("성공적으로 " + deletedCount + "개의 이메일을 영구 삭제했습니다.");
        } catch (Exception e) {
            log.error("이메일 영구 삭제 중 오류 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("영구 삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    @PostMapping("/trash/restore")
    @ResponseBody
    public ResponseEntity<?> restoreFromTrash(@RequestBody List<Integer> emailNos) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Employee loginEmployee = (Employee) auth.getPrincipal();
        int employeeNo = loginEmployee.getEmployeeNo();

        try {
            int restoredCount = service.restoreFromTrash(emailNos, employeeNo);
            return ResponseEntity.ok("성공적으로 " + restoredCount + "개의 이메일을 복구했습니다.");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("복구 중 오류가 발생했습니다: " + e.getMessage());
        }
    }
    @GetMapping("/download/{attachmentId}")
    public ResponseEntity<Resource> downloadAttachment(@PathVariable int attachmentId) throws IOException {
        EmailAtt attachment = service.getAttachment(attachmentId);
        Path filePath = Paths.get(fileUploadPath, attachment.getEmailAttRenamedFilename());
        Resource resource = new UrlResource(filePath.toUri());

        log.info("Attempting to download file: {}", filePath.toString());

        if (resource.exists() && resource.isReadable()) {
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + attachment.getEmailAttOriginalFilename() + "\"")
                    .body(resource);
        } else {
            log.error("File not found or not readable: {}", filePath.toString());
            throw new FileNotFoundException("File not found or not readable: " + attachment.getEmailAttRenamedFilename());
        }
    }

    @GetMapping("/attachments/{emailNo}")
    @ResponseBody
    public List<EmailAtt> getEmailAttachments(@PathVariable int emailNo) {
        return service.getEmailAttachments(emailNo);
    }

    @GetMapping("/reply/{emailNo}")
    public String showReplyForm(@PathVariable int emailNo, Model model) {
        Email originalEmail = service.getEmailByNo(emailNo);
        Email replyEmail = new Email();

        // 원본 이메일의 발신자를 수신자로 설정
        EmailReceiver receiver = EmailReceiver.builder()
            .employee(originalEmail.getSender())
            .emailReceiverCategory(1) // 예: 1은 '받는 사람'을 의미한다고 가정
            .emailReceiverIsRead("N")
            .emailReceiverIsDelete("N")
            .emailReceiverIsImportant("N")
            .build();
        replyEmail.setReceivers(Arrays.asList(receiver));

        // 제목에 "Re: " 추가
        replyEmail.setEmailTitle("Re: " + originalEmail.getEmailTitle());

        // 원본 이메일 내용을 인용 형식으로 본문에 추가
        String quotedContent = "\n\n-------- 원본 메시지 --------\n" +
                               "보낸사람: " + originalEmail.getSender().getEmployeeName() + "\n" +
                               "날짜: " + originalEmail.getEmailSendDate() + "\n" +
                               "제목: " + originalEmail.getEmailTitle() + "\n\n" +
                               originalEmail.getEmailContent();
        replyEmail.setEmailContent(quotedContent);

//        String forwardedContent = "\n\n-------- 전달된 메시지 --------\n" +
//                "보낸사람: " + originalEmail.getSender().getEmployeeName() + "\n" +
//                "날짜: " + originalEmail.getEmailSendDate() + "\n" +
//                "제목: " + originalEmail.getEmailTitle() + "\n\n" +
//                originalEmail.getEmailContent();
//forwardEmail.setEmailContent(forwardedContent);

        model.addAttribute("email", replyEmail);
        return "email/write";
    }

    @GetMapping("/forward/{emailNo}")
    public String showForwardForm(@PathVariable int emailNo, Model model) {
        Email originalEmail = service.getEmailByNo(emailNo);
        Email forwardEmail = new Email();


        forwardEmail.setEmailTitle("Fwd: " + originalEmail.getEmailTitle());

        // 원본 이메일 내용을 포워딩 형식으로 본문에 추가
        String forwardedContent = "\n\n-------- 전달된 메시지 --------\n" +
                                  "보낸사람: " + originalEmail.getSender().getEmployeeName() + "\n" +
                                  "날짜: " + originalEmail.getEmailSendDate() + "\n" +
                                  "제목: " + originalEmail.getEmailTitle() + "\n\n" +
                                  originalEmail.getEmailContent();
        forwardEmail.setEmailContent(forwardedContent);

        // 첨부 파일 정보 복사
        forwardEmail.setHasAttachment(originalEmail.hasAttachment());

        model.addAttribute("email", forwardEmail);
        return "email/write";
    }

    // 알림
//    @GetMapping("/subscribe")
//    public SseEmitter subscribe() {
//        SseEmitter emitter = new SseEmitter(Long.MAX_VALUE);
//        this.emitters.add(emitter);
//
//        emitter.onCompletion(() -> this.emitters.remove(emitter));
//        emitter.onTimeout(() -> this.emitters.remove(emitter));
//
//        return emitter;
//    }
//
//    private void sendNotification(String message) {
//        List<SseEmitter> deadEmitters = new ArrayList<>();
//        this.emitters.forEach(emitter -> {
//            try {
//                emitter.send(SseEmitter.event()
//                        .name("emailNotification")
//                        .data(message));
//            } catch (IOException e) {
//                deadEmitters.add(emitter);
//            }
//        });
//        this.emitters.removeAll(deadEmitters);
//    }


}