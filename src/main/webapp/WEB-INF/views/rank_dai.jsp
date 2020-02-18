<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<title>大分類一覧</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>大分類一覧</h2>
	</div>
	<button class="btn btn-warning"
		onclick="location.href='/rankdai/insert'">登録</button>
	<br>

	<div class="container">
		<table class="table table-striped" style="width: 900px;">
			<thead>
				<tr>
					<th scope="col">コード</th>
					<th scope="col">名称</th>
					<th scope="col">略称</th>
					<th scope="col">開始日</th>
					<th scope="col">終了日</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cpn" items="${list}">
					<tr>
						<td scope="row"><a
							href="/rankdai/update/${cpn.busyo_dai_code}/${cpn.busyo_start}">${cpn.busyo_dai_code}</a></td>
						<td>${cpn.busyo_name}</td>
						<td>${cpn.busyo_name_small}</td>
						<td>${cpn.busyo_start}</td>
						<td>${cpn.busyo_end}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
	</div>

	<style>
body {
	background-image: url('../image/background.jpg');
	background-size: cover;
	background-repeat: no-repeat;
}

table, tr, td, th {
	border: 1px solid black;
}
</style>

	<script type="text/javascript">
	<!-- Paging -->
		function page(idx) {
			var pagenum = idx;
			var contentnum = 10;
			var searchtype = $('#searchtype').val()
			var keyword = $('#keyword').val()
			var url = "${pageContext.request.contextPath}/rank?pagenum="
					+ pagenum + "&contentnum=" + contentnum;
			url = url + "&searchtype=" + searchtype;
			url = url + "&keyword=" + keyword;
			location.href = url;

		};
	</script>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>