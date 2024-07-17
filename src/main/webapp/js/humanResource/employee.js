/*
	사원 관리 페이지용 js~
*/

$(document).ready(()=>{

	searchEmployee(1);
	getDepartmentList();
})

//사원 검색 데이터 가져오는 함수
function searchEmployee(cPage){

	const $form=$('#searchForm').get(0);
	const fd=new FormData($form);
	const query=new URLSearchParams();

	const keyword=$('#keyword').val();
	if(keyword == '1'){
		//사번 검색
		const no=$('#keywordValue').val();
		if(no != null && no != ''){
			query.append("no", no);
		}
	}else{
		//이름 검색
		const name=$('#keywordValue').val();
		if(name != null && name != ''){
			query.append("name", name);
		}
	}
	const title=$('.department-menu-title').text();
	query.append("title",title);

	query.append("cPage", cPage);
	for(const pair of fd.entries()){
		if(pair[1]!=null&&pair[1]!=''){
			query.append(pair[0], pair[1]);
		}
	}

	const reqPath='/api/hr/getEmployeeList';
	const url = new URL(reqPath, window.location.origin);
	url.search = query.toString();


	fetch(url)
		.then(response => response.json())
		.then(data => {
			makeEmployeeTable(data.employees);
			const $pagebar=createPagination(cPage, data.totalPage, 'searchEmployee');
			$('.pagebar-div').html('').append($pagebar);
		})
		.catch(error => {
			console.error('요청 실패: ', error); // 요청 실패 시 에러 처리
		});
}

// 사원 테이블 만드는 함수
function makeEmployeeTable(employees){
	$('.emp-table tbody').html('');
	employees.forEach(e=>{
		const $tr=$('<tr>');
		const $empNo=$('<td>').text(e.employeeNo);
		const $empDept=$('<td>').text(e.departmentCode.departmentTitle);
		const $empPosition=$('<td>').text(e.positionCode.positionTitle);
		const $empName=$('<td>').text(e.employeeName);
		const $empId=$('<td>').text(e.employeeId);
		const $empPhone=$('<td>').text(e.employeePhone);
		const $empAddress=$('<td>').text(e.employeeAddress);
		const $empBirth=$('<td>').text(e.employeeBirthDay);
		const $empSalary=$('<td>').text(e.employeeSalary);
		const $empHire=$('<td>').text(e.employeeHireDate);
		const $empResign=$('<td>').text(e.employeeResignationDay);
		const $empTotalVacation=$('<td>').text(e.employeeTotalVacation);
		const $btnTd=$('<td>');
		const $updateBtn=$('<button>').text('수정').addClass('btn btn-primary');
		const $deleteBtn=$('<button>').text('삭제').addClass('btn btn-danger');
		$btnTd.append($updateBtn).append($deleteBtn);
		$tr.append($empNo).append($empDept).append($empPosition).append($empName).append($empId).append($empPhone)
			.append($empAddress).append($empBirth).append($empSalary).append($empHire).append($empResign).append($empTotalVacation)
			.append($btnTd);
		$('.emp-table tbody').append($tr);
	})
}

//부서 데이터 가져오는 함수
function getDepartmentList() {
	fetch(path + '/api/employee/departmentList')
		.then(response => response.json())
		.then(data => {
			const $target=$('.department-menu');
			$target.append($('<span>').addClass('dropdown-item').text('부서전체').click(changeTitle));
			data.forEach(d=>{
				const $departmentTitle=$('<span>').addClass('dropdown-item')
				.text(d.departmentHighCode<=1?d.departmentTitle:`--${d.departmentTitle}`)
				.click(changeTitle);
				$target.append($departmentTitle);
			});
		})
		.catch(error => {
			console.error('요청 실패: ', error); // 요청 실패 시 에러 처리
		});
}

//부서 드롭다운 메뉴 선택 시 드롭다운 text내용 바꾸는 함수
function changeTitle(e){
	let title=$(e.target).text();
	if(title[0] == '-') title=title.substring(2);
	$('.department-menu-title').text(title);
}