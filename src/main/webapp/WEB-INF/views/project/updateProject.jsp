<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<style>
	<c:import url="${path}/css/project/updateProject.css"/>
</style>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<body>
	<div id="project-update-main">
		<div id="project-update-title">������Ʈ ����</div>

		<div id="project-update-window"
			style="display: flex; flex-direction: row;">
			<div class="modal-body">
				<!-- ������Ʈ �̸� -->
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">������Ʈ
						�̸�</span> <input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" value="${projectNo}">
				</div>
				<!-- ������Ʈ ������ �̸� -->
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">�ۼ���</span>
					<input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" value="ȫ�浿" disabled>
				</div>
				<!-- ������Ʈ �߿䵵 üũ�ڽ�  -->
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">������Ʈ
						�߿䵵</span> <select class="form-select"
						aria-label="Default select example">
						<option selected>�����ϼ���.</option>
						<option value="1" style="color: red;">��</option>
						<option value="2" style="color: rgb(255, 132, 0);">��</option>
						<option value="3" style="color: green;">��</option>
					</select>
				</div>
				<!-- ������Ʈ ���� -->
				<p style="font-weight: bolder;">������Ʈ ����</p>
				<div class="form-floating">
					<textarea class="form-control" placeholder="Leave a comment here"
						id="floatingTextarea"></textarea>
					<label for="floatingTextarea">������Ʈ ����</label>
				</div>
				<!-- ������Ʈ ���� ������ -->
				<br>
				<div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">������Ʈ
							������</span> <select id="year" class="form-select" aria-label="Year"
							required>
							<option value="" selected>��</option>

						</select> <select id="month" class="form-select" aria-label="Month"
							required>
							<option value="" selected>��</option>
						</select> <select id="day" class="form-select" aria-label="Day" required>
							<option value="" selected>��</option>

						</select>
					</div>
				</div>
				<br>
				<!-- ������Ʈ ���� ���� -->
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">��������</span>
					<input type="text" id="project-budget" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" placeholder="�Է��ϼ���.">
				</div>


				<br>
				<!--  �ִ� ���� �ο�(��)-->
				<div id="member-list" style="display: flex; flex-direction: row;">
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">��
							�ο�</span> <input id="totalMember" type="text" class="form-control"
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default" value="1" disabled>
					</div>

					<div class="input-group mb-3" style="margin-left: 20px;">
						<span class="input-group-text" id="inputGroup-sizing-default">�μ�</span>
						<select id="select-dept" class="form-select"
							aria-label="Default select example">
							<option selected>�����ϼ���.</option>
							<option value="����1��">����1��</option>
							<option value="����2��">����2��</option>
							<option value="����3��">����3��</option>
							<option value="ȫ����">ȫ����</option>
							<option value="������1��">������1��</option>
							<option value="������2��">������2��</option>
						</select>
					</div>
				</div>
				<!-- üũ�� ��� �߰� div -->
				<div id="saved-members">
					<div id="checked-member-wrab" class="saved-item">
						����3��: ȫ�浿 ��� / 512341234
						<button class="btn-close" type="button"></button>
					</div>
					<div id="checked-member-wrab" class="saved-item">
						����3��: ȫ�浿 ��� / 112341234
						<button class="btn-close" type="button"></button>
					</div>
					<div id="checked-member-wrab" class="saved-item">
						����3��: ȫ�浿 ��� / 212341234
						<button class="btn-close" type="button"></button>
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; align-items: center; margin-top: 30px;">
					<button type="button" class="btn btn-primary">������Ʈ ����</button>
				</div>

			</div>
			<!-- ��� ��ȸ ���� -->
			<div id="input-member"></div>

		</div>

	</div>
</body>
<script type="text/javascript" src="${path }/js/project/updateProject.js"></script>
</html>