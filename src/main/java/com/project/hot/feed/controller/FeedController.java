package com.project.hot.feed.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.project.hot.community.model.service.CommunityService;
import com.project.hot.employee.model.dto.Employee;
import com.project.hot.feed.model.dto.Feed;
import com.project.hot.feed.model.dto.FeedComment;
import com.project.hot.feed.model.service.FeedService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/community/feed")
public class FeedController {

    private final FeedService service;
    private final CommunityService communityService;

    // 피드 목록 조회
    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getFeeds(@RequestParam Integer communityNo) {
        try {
            if (communityNo == null) {
                return createErrorResponse("커뮤니티 번호가 필요합니다", HttpStatus.BAD_REQUEST);
            }

            List<Feed> feeds = service.getFeeds(communityNo);
            log.info("Fetched {} feeds for community {}", feeds.size(), communityNo);

            return createSuccessResponse("feeds", feeds);
        } catch (Exception e) {
            return handleException("피드 목록 조회 중 오류 발생", e);
        }
    }

    // 피드 작성
    @PostMapping("/insert")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> insertFeed(
            @RequestParam("feedContent") String feedContent,
            @RequestParam("communityNo") int communityNo,
            @RequestParam(value = "file", required = false) MultipartFile file) {
        try {
            if (feedContent == null || feedContent.trim().isEmpty()) {
                return createErrorResponse("피드 내용은 필수입니다", HttpStatus.BAD_REQUEST);
            }

            Employee loginEmployee = getLoggedInEmployee();
            Feed feed = createFeed(feedContent, communityNo, loginEmployee.getEmployeeNo());

            int result = service.insertFeed(feed, file);
            if (result > 0) {
                log.info("Feed inserted successfully: {}", feed.getFeedNo());
                return createSuccessResponse("피드가 성공적으로 작성되었습니다");
            } else {
                log.warn("Failed to insert feed");
                return createErrorResponse("피드 작성에 실패했습니다", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return handleException("피드 생성 중 오류 발생", e);
        }
    }

    // 피드 수정
    @PutMapping("/update")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateFeed(@RequestBody Feed feed) {
        try {
            if (feed.getFeedContent() == null || feed.getFeedContent().trim().isEmpty()) {
                return createErrorResponse("수정할 피드 내용은 필수입니다", HttpStatus.BAD_REQUEST);
            }

            int result = service.updateFeed(feed);
            if (result > 0) {
                log.info("Feed updated successfully: {}", feed.getFeedNo());
                return createSuccessResponse("피드가 성공적으로 수정되었습니다");
            } else {
                log.warn("Failed to update feed: {}", feed.getFeedNo());
                return createErrorResponse("피드 수정에 실패했습니다", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return handleException("피드 수정 중 오류 발생", e);
        }
    }

    // 피드 삭제
    @DeleteMapping("/delete")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteFeed(@RequestBody Feed feed) {
        try {
            int result = service.deleteFeed(feed.getFeedNo());
            if (result > 0) {
                log.info("Feed deleted successfully: {}", feed.getFeedNo());
                return createSuccessResponse("피드가 성공적으로 삭제되었습니다");
            } else {
                log.warn("Failed to delete feed: {}", feed.getFeedNo());
                return createErrorResponse("피드 삭제에 실패했습니다", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return handleException("피드 삭제 중 오류 발생", e);
        }
    }

    // 커뮤니티 참석자 추가
    @PostMapping("/invite")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> inviteParticipants(@RequestBody Map<String, Object> requestBody) {
        try {
            int communityNo = (int) requestBody.get("communityNo");
            List<Map<String, Object>> participants = (List<Map<String, Object>>) requestBody.get("participants");

            int result = communityService.inviteParticipants(communityNo, participants);
            if (result > 0) {
                log.info("{} participants invited to community {}", participants.size(), communityNo);
                return createSuccessResponse(participants.size() + "명의 참석자가 성공적으로 초대되었습니다");
            } else {
                log.warn("Failed to invite participants to community {}", communityNo);
                return createErrorResponse("참석자 초대에 실패했습니다", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return handleException("참석자 초대 중 오류 발생", e);
        }
    }

    // 비참여 사원 목록 조회
    @GetMapping("/nonParticipants")
    public ResponseEntity<Map<String, Object>> getNonParticipants(@RequestParam int communityNo) {
        try {
            List<Employee> nonParticipants = communityService.getNonParticipants(communityNo);
            return createSuccessResponse("nonParticipants", nonParticipants);
        } catch (Exception e) {
            return handleException("비참여 사원 목록을 불러오는 중 오류 발생", e);
        }
    }

    // 커뮤니티 탈퇴
    @DeleteMapping("/withdrawCommunity")
    @ResponseBody
    public ResponseEntity<String> withdrawCommunity(@RequestBody Map<String, Integer> params) {
        try {
            int communityNo = params.get("id");
            Employee loginEmployee = getLoggedInEmployee();
            communityService.deleteCommunityUser(communityNo, loginEmployee.getEmployeeNo());
            return ResponseEntity.ok("커뮤니티 탈퇴 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("커뮤니티 탈퇴 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    // 피드 좋아요 토글
    @PostMapping("/like")
    public ResponseEntity<Map<String, Object>> toggleLike(@RequestBody Map<String, Integer> params) {
        try {
            int feedNo = params.get("feedNo");
            Employee loginEmployee = getLoggedInEmployee();
            boolean isLiked = service.toggleLike(feedNo, loginEmployee.getEmployeeNo());
            return createSuccessResponse("liked", isLiked);
        } catch (Exception e) {
            return handleException("피드 좋아요 처리 중 오류 발생", e);
        }
    }

    // 댓글 목록 조회
    @GetMapping("/comments")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getComments(@RequestParam int feedNo) {
        try {
            List<FeedComment> comments = service.getComments(feedNo);
            sortComments(comments);
            return createSuccessResponse("comments", comments);
        } catch (Exception e) {
            return handleException("댓글 목록 조회 중 오류 발생", e);
        }
    }

    // 댓글 추가
    @PostMapping("/comment/add")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addComment(@RequestBody FeedComment comment) {
        try {
            Employee loginEmployee = getLoggedInEmployee();
            comment.setEmployeeNo(loginEmployee.getEmployeeNo());

            int result = service.addComment(comment);
            if (result > 0) {
                return createSuccessResponse("댓글이 성공적으로 추가되었습니다");
            } else {
                return createErrorResponse("댓글 추가에 실패했습니다", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return handleException("댓글 추가 중 오류 발생", e);
        }
    }

    // 댓글 수정
    @PutMapping("/comment/update")
    public ResponseEntity<Map<String, Object>> updateComment(@RequestBody FeedComment comment) {
        try {
            int result = service.updateComment(comment);
            if (result > 0) {
                return createSuccessResponse("댓글이 성공적으로 수정되었습니다");
            } else {
                return createErrorResponse("댓글 수정에 실패했습니다", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return handleException("댓글 수정 중 오류 발생", e);
        }
    }

    // 댓글 삭제
    @DeleteMapping("/comment/delete")
    public ResponseEntity<Map<String, Object>> deleteComment(@RequestBody Map<String, Integer> params) {
        try {
            int feedCommentNo = params.get("feedCommentNo");
            int result = service.deleteComment(feedCommentNo);
            if (result > 0) {
                return createSuccessResponse("댓글이 성공적으로 삭제되었습니다");
            } else {
                return createErrorResponse("댓글 삭제에 실패했습니다", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return handleException("댓글 삭제 중 오류 발생", e);
        }
    }

    // 헬퍼 메서드: 로그인한 사용자 정보 가져오기
    private Employee getLoggedInEmployee() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return (Employee) auth.getPrincipal();
    }

    // 헬퍼 메서드: 피드 객체 생성
    private Feed createFeed(String content, int communityNo, int employeeNo) {
        Feed feed = new Feed();
        feed.setFeedContent(content);
        feed.setCommunityNo(communityNo);
        feed.setEmployeeNo(employeeNo);
        return feed;
    }

    // 헬퍼 메서드: 댓글 정렬
    private void sortComments(List<FeedComment> comments) {
        comments.sort((c1, c2) -> {
            if (c1.getFeedCommentParentNo() == 0 && c2.getFeedCommentParentNo() == 0) {
                return Integer.compare(c1.getFeedCommentNo(), c2.getFeedCommentNo());
            } else if (c1.getFeedCommentParentNo() == 0) {
                return -1;
            } else if (c2.getFeedCommentParentNo() == 0) {
                return 1;
            } else {
                return Integer.compare(c1.getFeedCommentNo(), c2.getFeedCommentNo());
            }
        });
    }

    // 헬퍼 메서드: 성공 응답 생성
    private ResponseEntity<Map<String, Object>> createSuccessResponse(String message) {
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", message);
        return ResponseEntity.ok(response);
    }

    // 헬퍼 메서드: 성공 응답 생성 (데이터 포함)
    private ResponseEntity<Map<String, Object>> createSuccessResponse(String key, Object value) {
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put(key, value);
        return ResponseEntity.ok(response);
    }

    // 헬퍼 메서드: 에러 응답 생성
    private ResponseEntity<Map<String, Object>> createErrorResponse(String message, HttpStatus status) {
        Map<String, Object> response = new HashMap<>();
        response.put("success", false);
        response.put("message", message);
        return ResponseEntity.status(status).body(response);
    }

    // 헬퍼 메서드: 예외 처리
    private ResponseEntity<Map<String, Object>> handleException(String logMessage, Exception e) {
        log.error(logMessage, e);
        return createErrorResponse(logMessage + ": " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
    }
}