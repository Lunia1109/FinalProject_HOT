<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:import url="/WEB-INF/views/common/sidebar.jsp"/>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
<link href="${path}/css/project/insertWorkDetail.css" rel="stylesheet" type="text/css">

<section>
	<div id="project-first-wrap">
		<div>
			<div id="project-insert-title">프로젝트 작업 생성</div>
		</div>
		<div style="display: flex; flex-direction: column; align-items:center;">
			<div style="display: flex; flex-direction: row; justify-content: center; margin-top: 30px;">
				<div id="project-insert-body">
				<!-- 프로젝트 번호 -->
				<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">프로젝트 번호</span>
					<c:choose>
						<c:when test="${not empty project}">
							<input type="text" class="form-control"  name="projectNo" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default" value="${project.projectNo}" disabled>
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control"  name="projectTitle" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default" value="선택된 프로젝트가 없습니다." disabled>
						</c:otherwise>
					</c:choose>
					</div>
					<!-- 프로젝트 이름 -->
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">프로젝트 이름</span>
					<c:choose>
						<c:when test="${not empty project}">
							<input type="text" class="form-control"  name="projectTitle" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default" value="${project.projectTitle}" disabled>
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control"  name="projectTitle" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default" value="선택된 프로젝트가 없습니다." disabled>
						</c:otherwise>
					</c:choose>
					</div>
					<!-- 작업 이름 -->
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">작업 이름</span>
						<input type="text" class="form-control"  name="workTitle" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">
					</div>
					<!-- 작업 생성자 이름 -->
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
						<input type="text" class="form-control" name="writer"
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default"  value="${loginEmployee.employeeName }" disabled>
					</div>
					<!-- 작업 중요도 체크박스  -->
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">작업 중요도</span>
						<select class="form-select" name="importance" aria-label="Default select example">
							<option selected>선택하세요.</option>
							<option value="1" style="color: red;">상</option>
							<option value="2" style="color: rgb(255, 132, 0);">중</option>
							<option value="3" style="color: green;">하</option>
						</select>
					</div>
					<!-- 작업 설명 -->
					<p style="font-weight: bolder;">작업 설명</p>
					<div id="project-contents" class="form-floating">
						<textarea class="form-control" name="workContent" placeholder="Leave a comment here"
							id="floatingTextarea"></textarea>
						<label for="floatingTextarea">프로젝트 설명</label>
						<span id="project-contents-count" style="margin-left: auto;">0/1000</span>
					</div>

					<br>
					<div>
						<div class="input-group mb-3">
								<label for="date">마감 날짜:
								  <input style="width:150px; text-align:center;" type="date" id="project-end-date">
								</label>
							</div>
					</div>
					<p style="font-weight: bolder;">첨부파일</p>
					<div id="project-work-file" class="form-floating">
						<img id="dragFile" src="https://i.imgur.com/skjgqb0.png" height="100%" width="100%" />
						<button id="fileUploadBtn" type="button" class="btn btn-dark" onclick="document.getElementById('fileInput').click()">파일 업로드</button>
						 <input type="file" id="fileInput"  multiple>
					</div>
					<!-- 가져온 파일 값 출력 -->
					<div id="fileListContainer">
					</div>

				</div>
			</div>
			<div>
			<button style="margin-bottom: 40px; margin-top:50px;" type="button"
				class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#updateSelectModal">작업 등록</button>
				</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="updateSelectModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">등록하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="insertWorktBtn">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</div>
<script>
const path="${path}"
const empNo = "${loginEmployee.employeeNo}"
</script>
<script src="${path }/js/project/insertWorkDetail.js"></script>
<c:import url="/WEB-INF/views/common/footer.jsp"/>