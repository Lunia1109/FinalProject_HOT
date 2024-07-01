<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
	<c:import url="${path}/css/common/header.css"/>
</style>

<head>
<meta charset="EUC-KR">
<title>H.O.T �׷����</title>
</head>
<!-- ������Ʈ ���� ��� â -->
    <!-- create Modal -->
    <div class="modal fade" id="createModal" tabindex="-1" aria-labelledby="createModalLabel" aria-hidden="true">
    <div id="modal-size" class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <h1 class="modal-title fs-5" id="createModalLabel">������Ʈ ����</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
    <div style="display: flex; flex-direction: row;">
    <div class="modal-body">
    </div>
        <!-- ������Ʈ �̸� -->
     <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">������Ʈ �̸�</span>
            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
     </div>
            <!-- ������Ʈ ������ �̸� -->
     <div class="input-group mb-3">
	        <span class="input-group-text" id="inputGroup-sizing-default">�ۼ���</span>
	        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="ȫ�浿" disabled>
     </div>
            <!-- ������Ʈ �߿䵵 üũ�ڽ�  -->
     <div class="input-group mb-3">
	      <span class="input-group-text" id="inputGroup-sizing-default">������Ʈ �߿䵵</span>
	      <select class="form-select" aria-label="Default select example">
	          <option selected>�����ϼ���.</option>
	          <option value="1" style="color: red;">��</option>
	          <option value="2" style="color: rgb(255, 132, 0);">��</option>
	          <option value="3" style="color: green;">��</option>
	        </select>
	</div>
     <!-- ������Ʈ ���� -->
     <p style="font-weight: bolder;">������Ʈ ����</p>
     <div id="project-contents" class="form-floating">
     <textarea id="floatingTextarea-project" class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
     <label for="floatingTextarea">������Ʈ ����</label>
     <span id="project-contents-count" style="margin-left: auto;">0/1000</span>
     </div>

     <!-- ������Ʈ ���� ������ -->
     <br>
	 <div>
	     <div class="input-group mb-3">
	         <span class="input-group-text" id="inputGroup-sizing-default">������Ʈ ������</span>
	         <select id="year" class="form-select" aria-label="Year" required>
	             <option value="" selected>��</option>
	               <!-- ���� �ɼ� �߰�  ���ؿ� ���⸸ ��µǰ� ����-->

	         </select>
	         <select id="month" class="form-select" aria-label="Month" required>
	             <option value="" selected>��</option>
	             <!-- �� �ɼ� �߰� -->

	         </select>
	         <select id="day" class="form-select" aria-label="Day" required>
	             <option value="" selected>��</option>
	             <!-- �� �ɼ� �߰� -->

	         </select>
	     </div>
	 </div>
	 <br>
    <!-- ������Ʈ ���� ���� -->
    <div class="input-group mb-3">
        <span class="input-group-text" id="inputGroup-sizing-default">��������</span>
        <input type="text" id="project-budget" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="�Է��ϼ���.">
    </div>

	<br>
    <!--  �ִ� ���� �ο�(��)-->
    <div id="member-list" style="display: flex; flex-direction: row;">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="inputGroup-sizing-default">�� �ο�</span>
                    <input id="totalMember" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="1" disabled>
                    </div>

                <div class="input-group mb-3" style="margin-left: 20px;">
                    <span class="input-group-text" id="inputGroup-sizing-default">�μ�</span>
                    <select id="select-dept" class="form-select" aria-label="Default select example">
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
            <div id="saved-members"></div>

        </div>
                <!-- ��� ��ȸ ���� -->
        <div id="input-member"></div>
    </div>

     <div class="modal-footer">
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">���</button>
             <button type="button" class="btn btn-primary">������Ʈ ����</button>
             </div>
         </div>
         </div>
     </div>
     <!-- ------------------ -->

     <!-- ������Ʈ ���� ��� â -->
            <!-- Modal -->
    <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div id="modal-size" class="modal-dialog modal-lg">
            <div class="modal-content align-items-center justify-content-center">

                    <p style="font-weight: bolder; font-size: 20px; margin-top: 20px;">������Ʈ ���</p>

                <div id="projectListTable" class="table-responsive">
                    <div>

                        <table class="table text-start align-middle table-bordered table-hover mb-0"  style="text-align: center;">
                            <thead>
                                <tr class="text-dark">
                                    <th scope="col">��¥</th>
                                    <th scope="col">��ȣ</th>
                                    <th scope="col">�����</th>
                                    <th scope="col">������Ʈ ����</th>
                                    <th scope="col" style="width: 300px;">�����</th>
                                    <th scope="col">����</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="project-choice">
                                    <td>01 Jan 2045</td>
                                    <td>1</td>
                                    <td>�赿��</td>
                                    <td>������Ʈ ���� 01</td>
                                    <td>
                                        <div class="graph-container">
                                            <div class="bar" data-percentage="55"></div>
                                            <div style="margin-top: 5px;"> 55%</div>
                                        </div>
                                    </td>
                                    <td><a class="btn btn-sm btn-danger" href="">����</a></td>
                                </tr>
                                <tr class="project-choice">
                                    <td>01 Jan 2045</td>
                                    <td>2</td>
                                    <td>�����</td>
                                    <td>������Ʈ ���� 02</td>
                                    <td>
                                        <div class="graph-container">
                                            <div class="bar" data-percentage="30"></div>
                                            <div style="margin-top: 5px;"> 30%</div>
                                        </div>
                                    </td>
                                    <td><a class="btn btn-sm btn-danger" href="">����</a></td>
                                </tr>
                                <tr class="project-choice">
                                    <td>01 Jan 2045</td>
                                    <td>3</td>
                                    <td>�ּ���</td>
                                    <td>������Ʈ ���� 03</td>
                                    <td>
                                        <div class="graph-container">
                                            <div class="bar" data-percentage="80"></div>
                                            <div style="margin-top: 5px;"> 80%</div>
                                        </div>
                                    </td>
                                    <td><a class="btn btn-sm btn-danger" href="">����</a></td>
                                </tr>
                                <tr class="project-choice">
                                    <td>01 Jan 2045</td>
                                    <td>4</td>
                                    <td>�Ӽ���</td>
                                    <td>������Ʈ ���� 04</td>
                                    <td>
                                        <div class="graph-container">
                                            <div class="bar" data-percentage="50"></div>
                                            <div style="margin-top: 5px;"> 50%</div>
                                        </div>
                                    </td>
                                    <td><a class="btn btn-sm btn-danger" href="">����</a></td>
                                </tr>
                                <tr class="project-choice">
                                    <td>01 Jan 2045</td>
                                    <td>5</td>
                                    <td>������</td>
                                    <td>������Ʈ ���� 05</td>
                                    <td>
                                        <div class="graph-container">
                                            <div class="bar" data-percentage="90"></div>
                                            <div style="margin-top: 5px;">90%</div>
                                        </div>
                                    </td>
                                    <td><a class="btn btn-sm btn-danger" href="">����</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <br>
                    <!-- ����¡ ó�� ���� -->
                    <div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups" style="display: flex; justify-content: center;">
                        <div class="btn-group me-2" role="group" aria-label="First group">
                            <button type="button" class="btn btn-secondary">prev</button>
                            <button type="button" class="btn btn-outline-secondary">1</button>
                            <button type="button" class="btn btn-outline-secondary">2</button>
                            <button type="button" class="btn btn-outline-secondary">3</button>
                            <button type="button" class="btn btn-outline-secondary">4</button>
                            <button type="button" class="btn btn-secondary">next</button>
                        </div>
                        </div>

            </div>
        </div>
    </div>
	<!-- ------------------------------------------------------------------------------- -->




	<!-- ������Ʈ -- �۾� ���� ��� â -->
    <!-- create Modal -->
    <div class="modal fade" id="createWorkModal" tabindex="-1" aria-labelledby="createWorkModalLabel" aria-hidden="true">
        <div id="modal-size" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="createWorkModalLabel">�۾� ����</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div style="display: flex; flex-direction: row;">
                    <div class="modal-body">
                        <!-- ������Ʈ �̸� -->
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="inputGroup-sizing-default">������Ʈ �̸�</span>
                            <input type="text" class="form-control" aria-label="Sizing example input"
                                aria-describedby="inputGroup-sizing-default" disabled>
                        </div>
                        <!-- ������Ʈ ������ �̸� -->
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="inputGroup-sizing-default">������Ʈ �����</span>
                            <input type="text" class="form-control" aria-label="Sizing example input"
                                aria-describedby="inputGroup-sizing-default" value="ȫ�浿" disabled>
                        </div>
                        <hr style="border: 1.5px solid rgb(9, 9, 87);">
                        <!-- �۾� �̸� -->
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="inputGroup-sizing-default">�۾� �̸�</span>
                            <input type="text" class="form-control" aria-label="Sizing example input"
                                aria-describedby="inputGroup-sizing-default">
                        </div>
                        <!-- �۾� ������ �̸� -->
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="inputGroup-sizing-default">�۾� �����</span>
                            <input type="text" class="form-control" aria-label="Sizing example input"
                                aria-describedby="inputGroup-sizing-default" value="�����" disabled>
                        </div>

                        <!-- �۾� ���� -->
                        <p style="font-weight: bolder;">�۾� ����</p>
                        <div id="work-contents" class="form-floating">
                            <textarea class="form-control" placeholder="Leave a comment here"
                                id="floatingTextarea-work"></textarea>
                            <label for="floatingTextarea">�۾� ����</label>
                            <span id="work-contents-count" style="margin-left: auto;">0/1000</span>
                        </div>


                        <!-- �۾� ���� ������ -->
                        <br>
                        <div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-default">�۾� ������</span>
                                <select id="year" class="form-select" aria-label="Year" required>
                                    <option value="" selected>��</option>
                                    <!-- ���� �ɼ� �߰� ���ؿ� ���⸸ ��µǰ� ����-->

                                </select>
                                <select id="month" class="form-select" aria-label="Month" required>
                                    <option value="" selected>��</option>
                                    <!-- �� �ɼ� �߰� -->

                                </select>
                                <select id="day" class="form-select" aria-label="Day" required>
                                    <option value="" selected>��</option>
                                    <!-- �� �ɼ� �߰� -->

                                </select>
                            </div>
                        </div>
                        <br>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">���</button>
                    <button type="button" class="btn btn-primary">������Ʈ ����</button>
                </div>
            </div>
        </div>
    </div>
<header>
    <!-- ���� ī�װ� -->
    <div id="sideHeader1" class="sideHeader">
        <div id="sideHeader-sub">
            <!-- ���� == ���� ī�װ� -->
            <div id="mail-category" class="headerContent"><a href=""><img src="https://i.imgur.com/c0Ze4Y2.png" width="30px"></a><div style="margin-top: 6px;"></div></div>
                <div id="mailWrap" class="sideHeader-sub">
                        <table id="mailContent" class="table table-dark table-hover">
                            <tr><th style="white-space: nowrap;">���� ������</th></tr>
                            <tr><th>���� ������</th></tr>
                            <tr><th>�߽� ������</th></tr>
                            <tr><th>���� ������</th></tr>
                            <tr><th>������</th></tr>
                        </table>
                </div>
            <!-- ���� == ������Ʈ ī�װ� -->
                <div id="project-category" class="headerContent"><a href=""><img src="https://i.imgur.com/8yHARRe.png" width="30px"></a><div style="margin-top: 6px;"></div></div>
                <div id="projectWrap" class="sideHeader-sub">
                    <table id="projectContent" class="table table-dark table-hover">
                        <tr><th>��ü ������Ʈ ��ȸ</th></tr>
                        <tr><th id="createProject" style="cursor: pointer;"data-bs-toggle="modal" data-bs-target="#createModal">������Ʈ ����</th></tr>
                        <tr><th id="updateProject" style="cursor: pointer;"data-bs-toggle="modal" data-bs-target="#updateModal">������Ʈ ����</th></tr>
                        <tr><th id="createProjectWork" style="cursor: pointer;"data-bs-toggle="modal" data-bs-target="#createWorkModal">������Ʈ-�۾� ����</th></tr>
                        <tr><th id="updateProjectWork" style="cursor: pointer;"data-bs-toggle="modal" data-bs-target="#updateProjectWork">������Ʈ-�۾� ����</th></tr>
                    </table>


            </div>
            <!-- ���� == ���ڰ��� ī�װ� -->
                <div id="approval-category" class="headerContent"><a href=""><img src="https://i.imgur.com/Nn5TmVd.png" width="30px"></a><div style="margin-top: 6px;"></div></div>
                <div id="approvalWrap" class="sideHeader-sub">
                    <table id="approvalContent" class="table table-dark table-hover">
                        <tr><th>���ڰ��� �޴�1</th></tr>
                        <tr><th>���ڰ��� �޴�2</th></tr>
                        <tr><th>���ڰ��� �޴�3</th></tr>
                        <tr><th>���ڰ��� �޴�4</th></tr>
                        <tr><th>���ڰ��� �޴�5</th></tr>
                        <tr><th>���ڰ��� �޴�6</th></tr>
                        <tr><th>���ڰ��� �޴�7</th></tr>
                        <tr><th>���ڰ��� �޴�8</th></tr>
                    </table>
                </div>
            <!-- ���� == �̸��� ī�װ� -->
            <div id="calender-category" class="headerContent"><a href=""><img src="https://i.imgur.com/8yHARRe.png" width="30px"></a><div style="margin-top: 6px;"></div></div>
            <div id="calenderWrap" class="sideHeader-sub">
                <table id="calenderContent" class="table table-dark table-hover">
                    <tr><th>�̸��� �޴�1</th></tr>
                    <tr><th>�̸��� �޴�2</th></tr>
                    <tr><th>�̸��� �޴�3</th></tr>
                    <tr><th>�̸��� �޴�4</th></tr>
                    <tr><th>�̸��� �޴�5</th></tr>
                </table>
            </div>

            <!-- ���� == Ŀ�´�Ƽ ī�װ� -->
            <div id="community-category" class="headerContent"><a href=""><img src="https://i.imgur.com/c0Ze4Y2.png" width="30px"></a><div style="margin-top: 6px;"></div></div>
            <div id="communityWrap" class="sideHeader-sub">
                <table id="communityContent" class="table table-dark table-hover">
                    <tr><th>Ŀ�´�Ƽ �޴�1</th></tr>
                    <tr><th>Ŀ�´�Ƽ �޴�2</th></tr>
                    <tr><th>Ŀ�´�Ƽ �޴�3</th></tr>
                    <tr><th>Ŀ�´�Ƽ �޴�4</th></tr>
                    <tr><th>Ŀ�´�Ƽ �޴�5</th></tr>
                </table>
            </div>

            <!-- ���� == ä�� ī�װ� -->
            <div id="chat-category" class="headerContent"><a href=""><img src="https://i.imgur.com/Nn5TmVd.png" width="30px"></a><div style="margin-top: 6px;"></div></div>
            <div id="chatWrap" class="sideHeader-sub">
                <table id="chatContent" class="table table-dark table-hover" style="cursor: pointer;">
                    <tr><th>HOT���</th></tr>
                    <tr><th id="hottalk-list">������</th></tr>
                    <tr><th>ȯ���Ȱ</th></tr>
                </table>
            </div>

                <!-- ���� == �λ� ī�װ� -->
                <div id="insa-category" class="headerContent"><a href=""><img src="https://i.imgur.com/8yHARRe.png" width="30px"></a><div style="margin-top: 6px;"></div></div>
                <div id="insaWrap" class="sideHeader-sub">
                    <table id="insaContent" class="table table-dark table-hover">
                        <tr><th>�λ� �޴�1</th></tr>
                        <tr><th>�λ� �޴�2</th></tr>
                        <tr><th>�λ� �޴�3</th></tr>
                        <tr><th>�λ� �޴�4</th></tr>
                        <tr><th>�λ� �޴�5</th></tr>
                    </table>
                </div>
        </div>
</div>
<div>
</div>
</header>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

