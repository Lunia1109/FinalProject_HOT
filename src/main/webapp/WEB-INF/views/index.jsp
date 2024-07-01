<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<body>
    <!-- ���� ����Ʈ ���� -->
        <div id="main-wrap">
            <!-- ù��° �� wrap (�������, ����, ���ڰ��� Ȯ�� ��) -->
             <div id="first-wrap">
                <div id="member-card">
                    <div id="changeBtn"><img src="https://i.imgur.com/tTdzHN7.png" width="25px"></div>
                    <div id="member-card-profile"></div>
                    <h4 style="margin-top: 30px; font-weight: bolder;">ȫ �� ��</h3>
                    <a>���� �μ�/��</a>
                    <div id="member-card-mail">
                        <div><a href=""><img src="https://i.imgur.com/LIHIxyI.png" width="40px" style="margin-bottom: 3px;"></a></div>
                        <div><a href=""><img src="https://i.imgur.com/JjYn69Q.png" width="40px"></a></div>
                    </div>

                </div>
                <div id="approval-card">���ڰ���</div>
                <div id="search-card">���� ��ȸ</div>
                <div id="mail-card">��������</div>
             </div>
             <!-- �ι�° �� wrap (�Խ���, ������Ʈ/�۾���Ȳ, ȸ�ǾȰ�) -->
             <div id="second-wrap">
                <div id="board-card">�Խ���</div>
                <div id="project-card">
                    <div>������Ʈ ��Ȳ</div>
                    <div>�۾� ��Ȳ</div>
                </div>
            <div id="agenda-card">ȸ�ǾȰ�</div>

             </div>
            <!-- ����° �� wrap (�̸���, ������ ����, ȫ�����, ȸ�����ɽĴ�ǥ) -->
             <div id="third-wrap">
                <div id="calender-card">�̸���</div>
                <div id="today-work-card">������ ����</div>
                <div id="banner-card">ȫ�����</div>
                <div id="menu-card">ȸ�����ɽĴ�ǥ</div>
             </div>


        </div>

</body>
</html>