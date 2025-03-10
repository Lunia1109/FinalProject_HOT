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
<link href="${path}/css/project/projectListAll.css" rel="stylesheet" type="text/css">
<link href="${path}/css/project/project.scss" rel="stylesheet" type="cscc">

<section>
	<div id="btnWrap">
		<a href="#" id="allProjectSearch" class="button">
	        <div class="main-txt">
	            <span>프</span>
	            <span>로</span>
	            <span>젝</span>
	            <span>트</span>
	            <span>&nbsp;</span>
	            <span>전</span>
	            <span>체</span>
	            <span>조</span>
	            <span>회</span>
	        </div>
    	</a>
	    <a href="#" id="joinProjectSearch" class="button reverse" style="background:rgb(0, 128, 192);">
	        <div class="main-txt">
	            <span>참</span>
	            <span>여</span>
	            <span>&nbsp;</span>
	            <span>프</span>
	            <span>로</span>
	            <span>젝</span>
	            <span>트</span>
	            <span>&nbsp;</span>
	            <span>조</span>
	            <span>회</span>
	        </div>
	    </a>
	    <a href="#" id="requestProjectSearch" class="button">
	        <div class="main-txt">
	            <span>요</span>
	            <span>청</span>
	            <span>한</span>
	            <span>&nbsp;</span>
	            <span>프</span>
	            <span>로</span>
	            <span>젝</span>
	            <span>트</span>
	        </div>
    	</a>
	    <a href="#" id="responseProjectSearch" class="button reverse" style="background:rgb(0, 128, 192);">
	        <div class="main-txt">
	            <span>프</span>
	            <span>로</span>
	            <span>젝</span>
	            <span>트</span>
	            <span>&nbsp;</span>
	            <span>요</span>
	            <span>청</span>
	            <span>함</span>
	        </div>
	    </a>
	</div>
		<div style="height:auto; min-height:600px; margin:0 100px;">
			<div class="conteudo__geral">
				<!-- 프로젝트 목록 div -->
				<div class="conteudo__cartoes-grid">

				</div>
			</div>
		</div>
		<div class="pagebar-div">페이지 바</div>

		<!-- 참여 요청 Modal -->
			<div class="modal fade" id="joinModal" tabindex="-1" aria-labelledby="joinModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">참여 요청</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        해당 프로젝트에 참여 요청 하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" id="projectRequestBtn" class="btn btn-primary">요청</button>
			      </div>
			    </div>
			  </div>
			</div>

		<!-- 프로젝트 응답 Modal -->
		<div class="modal fade" id="projectResponseModal" tabindex="-1" aria-labelledby="joinModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">참여 요청 응답</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        해당 사원의 프로젝트 참여를 허용하시겠습니까?
		      </div>
		        	<textarea id="refuseTextarea"></textarea>
		      <div class="modal-footer">
		        <button type="button" id="requestRefuseBtn" class="btn btn-danger">거절</button>
		        <button type="button" id="requestApprovalBtn" class="btn btn-primary">승인</button>
		        <button type="button" id="requestRefuseResultBtn" class="btn btn-danger">거절</button>
		        <button type="button" id="requestRefuseCancleBtn" class="btn btn-secondary">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 프로젝트 참여 거절됨 버튼 모달 -->
		<div class="modal fade" id="refusedModal" tabindex="-1" aria-labelledby="joinModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">프로젝트 거절 사유</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div id="refuseComent" class="modal-body">
		      </div>
		      <div class="modal-footer">
		         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" id="refusedCheckBtn" class="btn btn-primary">확인 후 삭제</button>
		      </div>
		    </div>
		  </div>
		</div>

</section>
</div>
<script>
	const path="${path}";
	const empNo ="${loginEmployee.employeeNo }";
</script>
<script src="${path }/js/project/projectListAll.js"></script>
<script src='${path }/js/common/pagebar.js'></script>
<c:import url="/WEB-INF/views/common/footer.jsp"/>