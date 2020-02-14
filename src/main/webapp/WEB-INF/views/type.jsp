<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<title>役職リスト</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>役職リスト</h2>
	</div>
	<button class="btn btn-danger"
		onclick="location.href='/index'">メニュー</button>
	<button class="btn btn-warning"
		onclick="location.href='/type/insert'">役職登録</button>
	<br>

	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">役職コード</th>
					<th scope="col">役職名</th>
					<th scope="col">役職省略名</th>
					<th scope="col">役職開始日</th>
					<th scope="col">役職終了日</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cpn" items="${list}">
					<tr>
						<td scope="row"><a href="/type/detail/${cpn.type_code}">${cpn.type_code}</a></td>
						<td>${cpn.type_name}</td>
						<td>${cpn.type_name_small}</td>
						<td>${cpn.type_start}</td>
						<td>${cpn.type_end}</td>
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
				<option value="type_code">役職コード</option>
				<option value="type_name">役職名</option>
				<option value="type_name_small">役職省略名</option>
				<option value="type_start">役職開始日</option>
				<option value="type_end">役職終了日</option>
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
		var url = "${pageContext.request.contextPath}/type?pagenum=" + pagenum + "&contentnum=" + contentnum;
		url = url + "&searchtype=" + searchtype;
		url = url + "&keyword=" + keyword;
		location.href = url;
		
	};
	
<!-- Search -->
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/type?pagenum=1&contentnum=10";
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