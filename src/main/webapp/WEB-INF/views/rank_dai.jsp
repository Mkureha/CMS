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
<body style="padding-top: 60px;">
	<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="/index"
			style="font-size: 14px; font-weight: bold; color: white; height: 40px;">部署管理</a>
		<button type="button" class="navbar-toggle" data-toggle="offcanvas"
			data-target=".navbar-offcanvas" data-canvas="body">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
	</div>
	<div id="ie8_navbar" class="navbar-collapse collapse">
		<ul class="nav navbar-nav">
			<li class="active"><a style="color: white;"
				href="/rankdai?pagenum=1&contentnum=10">部署（大分類）</a></li>
			<li><a style='color: white;'
				href="/rankcyu?pagenum=1&contentnum=10">部署（中分類）</a></li>
			<li><a style="color: white;"
				href="/ranksyou?pagenum=1&contentnum=10">部署（小分類）</a></li>
			<li><a style="color: white;"
				href="/position?pagenum=1&contentnum=10">役職</a></li>
			<li><a style="color: white;"
				href="/type?pagenum=1&contentnum=10">職級</a></li>
		</ul>
	</div>
	</nav>

	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-sm-2">
				<ul class="nav nav-pills nav-stacked" style="margin-bottom: 20px;">
					<li role="presentation" class="active"><a
						href="/rankdai?pagenum=1&contentnum=10">大部類一覧</a></li>
					<li role="presentation"><a
						href="/rankcyu?pagenum=1&contentnum=10">中分類一覧</a></li>
					<li role="presentation"><a
						href="/ranksyou?pagenum=1&contentnum=10">小分類一覧</a></li>
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
										href="/rankdai/update/${cpn.busyo_dai_code}/${cpn.busyo_start}">${cpn.busyo_dai_code}</a></td>
									<td>${cpn.busyo_name}</td>
									<td>${cpn.busyo_name_small}</td>
									<td>${cpn.busyo_start}</td>
									<td>${cpn.busyo_end}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="pull-right">
					<button class="btn btn-danger"
						onclick="location.href='/rankdai/insert'">登録</button>
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
body,div {
	font-family: 'メイリオ', Meiryo, 'ヒラギノ角ゴ Pro W3', 'Hiragino Kaku Gothic Pro',
		'ＭＳ Ｐゴシック', sans-serif;
}
</style>

	<script type="text/javascript">
	<!-- Paging -->
		function page(idx) {
			var pagenum = idx;
			var contentnum = 10;
			var url = "${pageContext.request.contextPath}/rank?pagenum="
					+ pagenum + "&contentnum=" + contentnum;
			location.href = url;

		};
	</script>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>