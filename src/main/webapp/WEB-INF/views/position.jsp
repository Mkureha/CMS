<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<title>職責一覧</title>
</head>
<body style="padding-top: 60px;">
	<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="/index"
			style="font-size: 14px; font-weight: bold; color: white; height: 40px;">COMPANY
			MANAGEMENT SYSTEM</a>
		<button type="button" class="navbar-toggle" data-toggle="offcanvas"
			data-target=".navbar-offcanvas" data-canvas="body">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
	</div>
	<div id="ie8_navbar" class="navbar-collapse collapse">
		<ul class="nav navbar-nav">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">部署 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a
						href="/rankdai?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">大分類一覧</a></li>
					<li><a
						href="/rankcyu?pagenum=1&contentnum=10&searchtype=busyo_cyu_code&keyword=">中分類一覧</a></li>
					<li><a
						href="/ranksyou?pagenum=1&contentnum=10&searchtype=busyo_syou_code&keyword=">小分類一覧</a></li>
				</ul></li>
			<li class="active"><a style="color: white;"
				href="/position?pagenum=1&contentnum=10">職責</a></li>
		</ul>
	</div>
	</nav>

	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-sm-2">
				<ul class="nav nav-pills nav-stacked" style="margin-bottom: 20px;">
					<li role="presentation" class="active"><a
						href="/position?pagenum=1&contentnum=10">職責一覧</a></li>
				</ul>
			</div>
			<div class="col-sm-10">
				<div 　class="pull-left">
					<h3 style="padding: 0; margin: 0; margin-bottom: 10px;">大分類一覧</h3>
					<table class="table table-bordered table-condensed"
						style="margin-top: 20px;">
						<tbody>
							<tr class="text-center warning">
								<th class="text-center">コード</th>
								<th class="text-center">名称</th>
								<th class="text-center">略称</th>
								<th class="text-center">開始日</th>
								<th class="text-center">終了日</th>
							</tr>
							<c:forEach var="cpn" items="${list}">
								<tr>
									<td scope="row"><a
										href="/position/update/${cpn.position_code}/${cpn.position_start}">${cpn.position_code}</a></td>
									<td>${cpn.position_name}</td>
									<td>${cpn.position_name_small}</td>
									<td>${cpn.position_start}</td>
									<td>${cpn.position_end}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="pull-right">
					<button class="btn btn-danger"
						onclick="location.href='/position/insert'">登録</button>
				</div>
				<br />
				<div style="margin-top: -18px; margin-bottom: -10px;">
					<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm">
						<li class="page-item">
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
				</div>
			</div>
		</div>
	</div>

	<style>
body, div {
	font-family: 'メイリオ', Meiryo, 'ヒラギノ角ゴ Pro W3', 'Hiragino Kaku Gothic Pro',
		'ＭＳ Ｐゴシック', sans-serif;
}
</style>

	<script type="text/javascript">
	<!-- Paging -->
		function page(idx) {
			var pagenum = idx;
			var contentnum = 10;
			var url = "${pageContext.request.contextPath}/position?pagenum="
					+ pagenum + "&contentnum=" + contentnum;
			location.href = url;

		};
	</script>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>