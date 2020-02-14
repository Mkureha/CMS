<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<title>社員リスト</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>社員リスト</h2>
	</div>
	<button class="btn btn-danger"
		onclick="location.href='/index'">メニュー</button>
	<button class="btn btn-warning"
		onclick="location.href='/employee/insert'">社員登録</button>
	<br>

	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">社員コード</th>
					<th scope="col">部署コード</th>
					<th scope="col">職責コード</th>
					<th scope="col">社員名</th>
					<th scope="col">区分コード</th>
					<th scope="col">性別</th>
					<th scope="col">生年月日</th>
					<th scope="col">郵便番号</th>
					<th scope="col">住所1</th>
					<th scope="col">住所2</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cpn" items="${list}">
					<tr>
						<td scope="row"><a href="/employee/detail/${cpn.employee_no}">${cpn.employee_no}</a></td>
						<td>${cpn.rank_code}</td>
						<td>${cpn.position_code}</td>
						<td>${cpn.employee_name}</td>
						<td>${cpn.type_code}</td>
						<td>${cpn.gender}</td>
						<td>${cpn.birthday}</td>
						<td>${cpn.postal_code}</td>
						<td>${cpn.address_1}</td>
						<td>${cpn.address_2}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item ">
						<td colspan="2"><c:if test="${page.prev}">
								<a style="text-decoration: none;"
									href="javascript:page(${page.getstartpage()-1});">&laquo;</a>
							</c:if> <c:forEach begin="${page.getstartpage()}"
								end="${page.getendpage()}" var="idx">
								<a style="text-decoration: none;"
									href="javascript:page(${idx});">${idx}</a>
							</c:forEach> <c:if test="${page.next}">
								<a style="text-decoration: none;"
									href="javascript:page(${page.getendpage()+1});">&raquo;</a>
							</c:if></td>
						</li>
					</ul>
					</nav>
				</tr>
			</tfoot>
		</table>
	</div>
	<form class="form-inline" action="search" method="get">
		<div>
			<select class="form-control form-control-sm" name="searchtype"
				id="searchtype"
				style="width: 350px; height: 35px; margin-left: auto; margin-right: auto;">
				<option value="employee_no">社員コード</option>
				<option value="rank_code">部署コード</option>
				<option value="position_code">職責コード</option>
				<option value="employee_name">社員名</option>
				<option value="type_code">区分コード</option>
				<option value="gender">性別</option>
				<option value="birthday">生年月日</option>
				<option value="postal_code">郵便番号</option>
				<option value="address_1">住所1</option>
				<option value="address_2">住所2</option>
			</select>
		</div>
		<div>
			<input type="text" class="form-control form-control-sm"
				name="keyword" id="keyword" placeholder="Keywordを入力してください"
				value="${page.keyword}" onkeyup="characterCheck()"
				onkeydown="characterCheck()"
				style="width: 400px; height: 35px; margin-left: auto; margin-right: auto;" />
		</div>
		<button type="button" class="btn btn-primary" name="btnSearch"
			id="btnSearch">検索</button>
	</form>

	<script type="text/javascript">
	
	<!-- Paging -->
	function page(idx) {
		var pagenum = idx;
		var contentnum = 10;
		var searchtype = $('#searchtype').val()
		var keyword = $('#keyword').val()
		var url = "${pageContext.request.contextPath}/employee?pagenum=" + pagenum + "&contentnum=" + contentnum;
		url = url + "&searchtype=" + searchtype;
		url = url + "&keyword=" + keyword;
		location.href = url;
		
	};
	
<!-- Search -->
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/employee?pagenum=1&contentnum=10";
		url = url + "&searchtype=" + $('#searchtype').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});	
	
<!-- Input Limit -->
function characterCheck() {
    var RegExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
    var obj = document.getElementsByName("keyword")[0]
    if (RegExp.test(obj.value)) {
        alert("特集文字は使うことができません。");
        obj.value = obj.value.substring(0, obj.value.length - 1);
    }
}
	
<!-- Hold Select Option(Searchtype) -->
var searchtype="${param.searchtype}";

$("#searchtype").val(searchtype);
</script>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>