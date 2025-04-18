<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />
<c:import url="/WEB-INF/views/common/sidebar.jsp" />
<c:import url="/WEB-INF/views/common/header.jsp" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="${path }/css/employee/profile.css" rel="stylesheet"
	type="text/css">
<section class="profile-section">
	<div class="profile-div shadow p-3 mb-5 bg-body rounded-4">
		<div class="photo-wrab">
			<div class="photo-div">
				<c:choose>
					<c:when test="${not empty loginEmployee.employeePhoto}">
						<img
							src="${path }/upload/employee/${loginEmployee.employeePhoto }"
							class="employee-photo">
					</c:when>
					<c:otherwise>
						<img src="${path }/images/undraw_profile.svg"
							class="employee-photo">
					</c:otherwise>
				</c:choose>
			</div>
			<input type="file" id="fileInput" name="upFile" accept="image/*"
				style="display: none;">
			<button type="submit" class="btn btn-primary photo-change-btn">이미지
				변경</button>
		</div>
		<div class="info-wrab">
			<div class="info-div">
				<div class="other-info">
					<img class="iconImg" src="https://i.imgur.com/OX1Cf9l.png" width=25px>
					<span class="info">이름 : ${loginEmployee.employeeName } ${loginEmployee.positionCode.positionTitle }</span>
				</div>
				<div class="other-info">
				<img class="iconImg" src="https://i.imgur.com/wUINSBv.png" width=25px>
					<span class="info">부서 : ${loginEmployee.departmentCode.departmentTitle }</span>
				</div>
				<div class="other-info">
				<img class="iconImg" src="https://i.imgur.com/nqt3Y3S.png" width=25px>
					<span class="info">입사날짜 : ${loginEmployee.employeeHireDate }</span>
				</div>
				<div class="other-info">
				<img class="iconImg" src="https://i.imgur.com/4f87269.png" width=25px>
					<span class="info">주소 : ${loginEmployee.employeeAddress }</span>
				</div>
				<div class="other-info">
				<img class="iconImg" src="https://i.imgur.com/Bb6wNYG.png" width=25px>
					<span class="info">생일 : ${loginEmployee.employeeBirthDay }</span>
				</div>
				<div class="other-info">
				<img class="iconImg" src="https://i.imgur.com/m2Pgzsv.png" width=25px>
					<span class="info">전화번호 : ${loginEmployee.employeePhone }</span>
				</div>
			</div>
			<button class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#update-modal">수정</button>
		</div>
	</div>
</section>


<!-- 수정 모달 창 -->
<div class="modal fade" tabindex="-1" id="update-modal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">사원 정보 수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<label for="password">비밀번호 수정</label><br> <input
					type="password" placeholder="비밀번호 입력" id="password"><br>
				<input type="password" placeholder="비밀번호 확인" id="passwordCheck">
				<p id="pwdCheckText"></p>
				주소 수정<br> <input type="button"
					onclick="sample2_execDaumPostcode()" value="주소 찾기"><br>
				<input type="text" id="address" placeholder="주소"><br> <input
					type="text" id="detailAddress" placeholder="상세주소"><br>
				<br> <label for="phone">핸드폰 번호 수정</label><br> <input
					type="text" placeholder="핸드폰번호 입력, '-'빼고 입력하세요 " id="phone">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary"
					onclick="updateEmployee()">수정하기</button>
			</div>
		</div>
	</div>
</div>
<!-- ################################################################# -->

<div id="layer"
	style="display: none; position: fixed; overflow: hidden; z-index: 2000; -webkit-overflow-scrolling: touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
		id="btnCloseLayer"
		style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
		onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
</div>
<script>
	const path = '${path}';
	const no = ${loginEmployee.employeeNo};
	const employeePhoto = '${loginEmployee.employeePhoto}';
</script>
<script src='${path }/js/employee/profile.js'></script>
<c:import url="/WEB-INF/views/common/footer.jsp" />