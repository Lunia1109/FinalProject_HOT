<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!DOCTYPE html>
<html>
<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

body{
    font-family: 'Pretendard-Regular';
    /* position: relative; */
    background-image: url("https://images.unsplash.com/photo-1558591710-4b4a1ae0f04d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
    background-size: 100%;
    z-index: 500;
}

header{
    position: relative;
    z-index:1000;
}

th{
    white-space: nowrap;
}
/* ���� ��� css */
.sideHeader {
    margin: 15px;
    width: 80px;     /*������ ���� ī�װ� left�� �����������. */
    height: 96.5vh;
    overflow: hidden;
    transition: width 0.3s;
    position: fixed;
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
}

#sideHeader-sub {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 80%; /* ��ü ���� �� �޴����� �����ϴ� ���� */
}
#sideHeader > div {
    margin: 10px 0; /* �� �޴� ������ ���� */
    text-decoration: none;


    color: white;
}

#sideHeader1 {
    background-color: rgb(0, 57, 100);
    left: 0;

}

.headerContent{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    color: white;
    opacity: 0.5;
    transition: all 0.3s ease-in-out;
}
.headerContent:hover{
    opacity: 1;
    transform: scale(1.2);
}

/* ���� ��� ȣ���� ���� ī�װ� ������ â */
.sideHeader-sub {
    z-index:1000;
    width: 65px;
    margin-left: 15px;
    height: 96.5vh;
    overflow: hidden;
    position: fixed;
    border-radius: 20px;
    background-color: rgba(255, 255, 255, 0.387);
    backdrop-filter: blur(10px);
    left: 80px;
    top:15px;
}
/* ���� ī�װ� css */

#mail-category:hover +#mailWrap{
    display: block;
    width: 400px;
}
#mailWrap:hover{
    /* display: block; */
    width: 400px;
}

#mailWrap{
    /* display: none; */
    width: 0px;
    transition: width 0.3s ease-in-out;
}

#mailContent{
    font-family: 'Pretendard-Regular';
    font-size: 20px;
    text-align: center;
}

/* ������Ʈ ī�װ� css */
#project-category:hover +#projectWrap{
    display: block;
    width: 400px;
}
#projectWrap:hover{
    /* display: block; */
    width: 400px;
}

#projectWrap{
    /* display: none; */
    width: 0px;
    transition: width 0.3s ease-in-out;
}

#projectContent{
    font-family: 'Pretendard-Regular';
    font-size: 20px;
    text-align: center;
}

/* ���ڰ��� ī�װ� css */
#approval-category:hover +#approvalWrap{
    display: block;
    width: 400px;
}
#approvalWrap:hover{
    /* display: block; */
    width: 400px;
}

#approvalWrap{
    /* display: none; */
    width: 0px;
    transition: width 0.3s ease-in-out;
}

#approvalContent{
    font-family: 'Pretendard-Regular';
    font-size: 20px;
    text-align: center;
}

/* �̸��� ī�װ� css */
#calender-category:hover +#calenderWrap{
    display: block;
    width: 400px;
}
#calenderWrap:hover{
    /* display: block; */
    width: 400px;
}

#calenderWrap{
    /* display: none; */
    width: 0px;
    transition: width 0.3s ease-in-out;
}

#calenderContent{
    font-family: 'Pretendard-Regular';
    font-size: 20px;
    text-align: center;
}

/* Ŀ�´�Ƽ ī�װ� css */
#community-category:hover +#communityWrap{
    display: block;
    width: 400px;
}
#communityWrap:hover{
    /* display: block; */
    width: 400px;
}

#communityWrap{
    /* display: none; */
    width: 0px;
    transition: width 0.3s ease-in-out;
}

#communityContent{
    font-family: 'Pretendard-Regular';
    font-size: 20px;
    text-align: center;
}

/* ä�� ī�װ� css */
#chat-category:hover +#chatWrap{
    display: block;
    width: 400px;
}
#chatWrap:hover{
    /* display: block; */
    width: 400px;
}

#chatWrap{
    /* display: none; */
    width: 0px;
    transition: width 0.3s ease-in-out;
}

#chatContent{
    font-family: 'Pretendard-Regular';
    font-size: 20px;
    text-align: center;
}


/* �λ� ī�װ� css */
#insa-category:hover +#insaWrap{
    display: block;
    width: 400px;
}
#insaWrap:hover{
    /* display: block; */
    width: 400px;
}

#insaWrap{
    /* display: none; */
    width: 0px;
    transition: width 0.3s ease-in-out;
}

#insaContent{
    font-family: 'Pretendard-Regular';
    font-size: 20px;
    text-align: center;
}


/* index css ------------------------------------------------------------------------------ */
#main-wrap{
    position: fixed;
    left: 110px;
    width: 93.5%;
    margin: 15px 0;
    height: 96.5vh;
    background-color: rgba(255, 255, 255, 0.511);
    backdrop-filter: blur(10px);
    display: flex;
    border-radius: 20px;

}

/* ù��° �� css */
#first-wrap{
    display: flex;
    flex-direction: column;
    width: 15%;
    padding: 10px;
}
/* ȣ���� ũŰ Ŀ���� css */
#first-wrap>div{
    transition: all 0.3s
}
#first-wrap>div:hover{
    transform: scale(1.05);
}
/* 1-1 */
#member-card{
    position: relative;
    width: 100%;
    height: 40%;
    border-radius: 15px;
    background-color: rgb(0, 57, 100);
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    color: white;
}
/* ������ ���� */
#member-card-profile{
    background-image: url("https://i.imgur.com/WDQ52RE.png");
    background-size: 100% 100%;
    border-radius: 1000px;
    width: 150px;
    height: 150px;
}

/* ������ ü���� ��ư */
#changeBtn{
    position: absolute;
   top:15px;
   right: 15px;
   cursor: pointer;
}
#changeBtn:hover{
    animation: rotate 4s linear infinite;
}
@keyframes rotate {
    from {
        transform: rotate(0deg); /* �ʱ� ���� */
    }
    to {
        transform: rotate(360deg); /* ���� ���� */
    }
}


/* ������ �ϴ� ��ư �ڽ� */
#member-card-mail{
 display: flex;
 width: 50%;
 justify-content: center;
 align-items: center;
 justify-content: space-between;
 margin-top: 30px;
}
#member-card-mail>div{
opacity: 0.5;
}
#member-card-mail>div:hover{
opacity: 1;
}

/* 1-2 */
#approval-card{
    margin-top:10px ;
    width: 100%;
    height: 15%;
    border-radius: 15px;
    background-color: white;
}
/* 1-3 */
#search-card{
    margin-top:10px ;
    width: 100%;
    height: 15%;
    border-radius: 15px;
    border: 3px solid rgb(0, 57, 100);
}
/* 1-4 */
#mail-card{
    margin-top:10px ;
    width: 100%;
    height: 27%;
    border-radius: 15px;
    background-color: white;
}

/* �ι�° �� css */
#second-wrap{
    width: 50%;
    display: flex;
    flex-direction: column;
    padding: 10px;
}

/* ȣ���� ũŰ Ŀ���� css */
#second-wrap>div{
    transition: all 0.3s
}
#second-wrap>div:hover{
    transform: scale(1.03);
}

/* 2-1 */
#board-card{
    width: 100%;
    height: 35%;
    border-radius: 15px;
    background-color: rgba(255, 255, 255, 0.387);
    backdrop-filter: blur(10px);
}

/* 2-2 */
#project-card{
    margin-top: 10px;
    width: 100%;
    height: 40%;
    border-radius: 15px;
    background-color: rgba(255, 255, 255, 0.387);
    backdrop-filter: blur(10px);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 15px;
}

/* 2-2-* */
#project-card>div{
    margin: 10px;
    width: 48%;
    height: 100%;
    border: 1px solid red;
    transition: all 0.3s
}

#project-card>div:hover{
    transform: scale(1.07);
}

#agenda-card{
    margin-top: 10px;
    width: 100%;
    height: 25%;
    border-radius: 15px;
    background-color: rgba(255, 255, 255, 0.387);
    backdrop-filter: blur(10px);
}




/* ����° �� css */
#third-wrap{
    width: 35%;
    display: flex;
    flex-direction: column;
    padding: 10px;
}

/* ȣ���� ũŰ Ŀ���� css */
#third-wrap>div{
    transition: all 0.3s
}
#third-wrap>div:hover{
    transform: scale(1.03);
}

/* 3-1 */
#calender-card{
    width: 100%;
    height: 30%;
    border-radius: 15px;
    background-color: rgba(255, 255, 255, 0.387);
    backdrop-filter: blur(10px);
}

/* 3-2 */
#today-work-card{
    margin-top: 10px;
    width: 100%;
    height: 15%;
    border-radius: 15px;
    background-color: rgba(255, 255, 255, 0.387);
    backdrop-filter: blur(10px);
}

/* 3-3 */
#banner-card{
    margin-top: 10px;
    width: 100%;
    height: 25%;
    border-radius: 15px;
    background-color: rgba(255, 255, 255, 0.387);
    backdrop-filter: blur(10px);
}

/* 3-4 */
#menu-card{
    margin-top: 10px;
    width: 100%;
    height: 30%;
    border-radius: 15px;
    background-color: rgba(255, 255, 255, 0.387);
    backdrop-filter: blur(10px);
}

/* ������Ʈ ���� ���â css */

/* ��� ��ȸ div */
#input-member-title{
    margin-top: 15px;
    margin-right: 15px;
    width: 300px;
    max-height: 200px;

}

#input-member-title>div{
    display: block;
}

#input-member-list{
    display: flex;
    flex-direction: column;
    height: 300px;
    overflow: scroll;
}

/* ���� ��µ� ��� div */
#checked-member-wrab{
    display: flex;
    align-items: center;
    font-weight: bolder;
    justify-content: center;
    justify-content: space-evenly;
    margin-top: 5px;
    height: 30px;
    width: 300px;
    background-color: rgb(222, 222, 222);
    border-radius: 100px;
}

#member-save-btn{
    margin-top: 10px;
}

.project-choice{
    cursor: pointer;
}

/* ������Ʈ ���� ��� css */
#projectListTable{
    width: 90%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0;
}
#modal-size1{
    display: flex;
    justify-content: center;
    align-items: center;
}
/* �׷��� ǥ�� */
.graph-container {
    width: 100%;
    display: flex;

}

.bar {
    width: 0;
    background-color: #1b35ffe3;
    margin: 10px 0;
    border-radius: 100px;
    overflow: hidden;
    height: 15px;
    transition: width 2s ease-in-out;
}


/* �۾� ���  css */
#work-contents{
    display: flex;
    flex-direction: column;
    justify-content: end;
}

#project-contents{
    display: flex;
    flex-direction: column;
    justify-content: end;
}
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
            <script>
                // ����  text ũ�� ī��Ʈ
                $('#floatingTextarea-project').on('input', function() {
                    let textLength = $(this).val().length;
                    $('#project-contents-count').text(textLength + '/1000');
                });
            </script>
            <!-- ������Ʈ ���� ������ -->
             <br>
            <div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="inputGroup-sizing-default">������Ʈ ������</span>
                    <select id="year" class="form-select" aria-label="Year" required>
                        <option value="" selected>��</option>
                        <!-- ���� �ɼ� �߰�  ���ؿ� ���⸸ ��µǰ� ����-->
                        <script>
                               const currentYear = new Date().getFullYear();
                                const nextYear = currentYear + 1;

                                for (let year = currentYear; year <= nextYear; year++) {
                                    $('#year').append('<option value="' + year + '">' + year + '</option>');
                                };
                        </script>
                    </select>
                    <select id="month" class="form-select" aria-label="Month" required>
                        <option value="" selected>��</option>
                        <!-- �� �ɼ� �߰� -->
                        <script>
                            for (let month = 1; month <= 12; month++) {
                                $('#month').append('<option value="' + month + '">' + month + '</option>');
                            }
                        </script>
                    </select>
                    <select id="day" class="form-select" aria-label="Day" required>
                        <option value="" selected>��</option>
                        <!-- �� �ɼ� �߰� -->
                        <script>
                            for (let day = 1; day <= 31; day++) {
                                $('#day').append('<option value="' + day + '">' + day + '</option>');
                            }
                        </script>
                    </select>
                </div>
            </div>
            <br>
            <!-- ������Ʈ ���� ���� -->
            <div class="input-group mb-3">
                <span class="input-group-text" id="inputGroup-sizing-default">��������</span>
                <input type="text" id="project-budget" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="�Է��ϼ���.">
                </div>
            <script>
                $('#project-budget').keyup(e=>{
                    let value = e.target.value;
                    let value1 = value.replace(/,/g,'');
                    let result = Number(value1).toLocaleString('ko-KR');
                    e.target.value=result;
                });

            </script>

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


        <script>
            $(document).ready(function() {
                let checkedTotalCount = 1;

            $('#select-dept').on('change', function() {
                const selectedText = $("#select-dept option:selected").val();
                const inputMember = $("#input-member");
                //�����ϼ��� ���ý� �ɹ� ����ֱ�
                if(selectedText === '�����ϼ���.'){
                    inputMember.text('');
                }else{
                    inputMember.empty();

                    const inputDept = $('<div>', { id:'input-member-title'});
                    const inputMemberList = $('<div>', { id: 'input-member-list' });
                    const inputMemberTitle = $('<div>', { text: selectedText, class: 'input-group-text' });
                    const memberSaveBtn = $('<button>', {id:'member-save-btn', class:'btn btn-primary', text:"����"})

                    // �μ� ���ý� ���â ������ �þ�� �ڵ�
                    $("#modal-size").addClass('modal-lg');

                    inputDept.append(inputMemberTitle);
                    inputMember.append(inputDept);
                    inputMember.append(inputMemberList);
                    inputMember.append(memberSaveBtn);

                    for (let i = 0; i < 10; i++) {
                        const checkboxId = 'flexCheckDefault' + i;
                        const inputMemberWrab = $('<div>');
                        const inputMemberDetail = $('<input>', { class: 'form-check-input', type: 'checkbox', id: checkboxId });
                        const inputMemberDetailText = $('<label>', { class: 'form-check-label', for: checkboxId, text:selectedText + ': ȫ�浿 ��� / ' +i+"12341234"});

                        // �̹� ���õ� �׸����� Ȯ��
                        if($('#saved-members').find('.saved-item:contains("' + inputMemberDetailText.text() + '")').length > 0) {
                            inputMemberDetail.prop('checked', true);
                        }

                        inputMemberWrab.append(inputMemberDetail);
                        inputMemberWrab.append(inputMemberDetailText);
                        inputMemberList.append(inputMemberWrab);
                    }
                }

                // �����ư ������ üũ�� ������ �߰�

                $('#member-save-btn').on('click', function() {
                    const checkedItems = $('#input-member-list input:checked');
                    const savedMembers = $('#saved-members');

                    checkedItems.each(function() {
                        const label = $(this).next('label').text();
                        const totalMember = 0;
                        checkedTotalCount++;
                        // �̹� �����ϴ� �׸����� Ȯ��
                        if(savedMembers.find('.saved-item:contains("' + label + '")').length > 0) {
                            checkedTotalCount--;
                            return true; // continue to next iteration
                        }
                        $("#totalMember").val(checkedTotalCount);


                        const checkedMembersDel = $('<button>', {class:'btn-close', type:'button'});
                        const savedItem = $('<div>', { text: label, id:'checked-member-wrab', class:'saved-item' });
                        savedItem.append(checkedMembersDel);
                        savedMembers.append(savedItem);
                    });
                });
            });
            // debugger;
            // x ��ư Ŭ�� �� �ش� �׸� ����

            $(document).on('click', '.btn-close', function() {
                $(this).closest('.saved-item').remove();
                // �� �ο��� ���� ���
                checkedTotalCount--;
                $("#totalMember").val(checkedTotalCount);
                // ������ �׸��� üũ�ڽ� ����
                const removedText = $(this).parent().text();
                $('#input-member-list input:checkbox').each(function() {
                    if($(this).next('label').text() === removedText) {
                        $(this).prop('checked', false);

                    }
                });
            });
        });
            </script>

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
                    <script>
                        $(".project-choice").click(e=>{
                            const projectNo = e.target.parentElement.children[1].textContent;
                            console.log(projectNo); // ������Ʈ ������ȣ �Ѱܼ� ������Ʈ ������������ �̵�
                            location.assign("/final/projectupdate.html?projectNo="+projectNo);

                        });
                        $(document).ready(function() {
                        $("#updateProject").click(e=>{
                        // ���൵ �ִϸ��̼�
                            const bars = document.querySelectorAll('.bar');
                            bars.forEach(bar => {
                                const percentage = bar.getAttribute('data-percentage');
                                setTimeout(() => {
                                    bar.style.width = `${percentage}%`;
                                }, 300);// �ӵ� ����
                            });
                        });
                    });
                    </script>
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

                        <script>
                            // ����  text ũ�� ī��Ʈ
                            $('#floatingTextarea-work').on('input', function() {
                                let textLength = $(this).val().length;
                                $('#work-contents-count').text(textLength + '/1000');
                            });
                        </script>
                        <!-- �۾� ���� ������ -->
                        <br>
                        <div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-default">�۾� ������</span>
                                <select id="year" class="form-select" aria-label="Year" required>
                                    <option value="" selected>��</option>
                                    <!-- ���� �ɼ� �߰� ���ؿ� ���⸸ ��µǰ� ����-->
                                    <script>
                                        const currentYear1 = new Date().getFullYear();
                                        const nextYear1 = currentYear + 1;

                                        for (let year = currentYear; year <= nextYear; year++) {
                                            $('#year').append('<option value="' + year + '">' + year + '</option>');
                                        };
                                    </script>
                                </select>
                                <select id="month" class="form-select" aria-label="Month" required>
                                    <option value="" selected>��</option>
                                    <!-- �� �ɼ� �߰� -->
                                    <script>
                                        for (let month = 1; month <= 12; month++) {
                                            $('#month').append('<option value="' + month + '">' + month + '</option>');
                                        }
                                    </script>
                                </select>
                                <select id="day" class="form-select" aria-label="Day" required>
                                    <option value="" selected>��</option>
                                    <!-- �� �ɼ� �߰� -->
                                    <script>
                                        for (let day = 1; day <= 31; day++) {
                                            $('#day').append('<option value="' + day + '">' + day + '</option>');
                                        }
                                    </script>
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
            <!-- ���� ��� ������ ��û -->
             <script>
                $("#hottalk-list").click(e=>{
                    location.assign("");
                })
             </script>



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

        </div>

    </header>