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
					<li class="active"><a
						href="/rankdai?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">大分類一覧</a></li>
					<li><a
						href="/rankcyu?pagenum=1&contentnum=10">中分類一覧</a></li>
					<li><a
						href="/ranksyou?pagenum=1&contentnum=10">小分類一覧</a></li>
				</ul></li>
			<li><a style="color: white;"
				href="/position?pagenum=1&contentnum=10">職責</a></li>
		</ul>
	</div>
	</nav>

	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-sm-2">
				<ul class="nav nav-pills nav-stacked" style="margin-bottom: 20px;">
					<li role="presentation" class="active"><a
						href="/rankdai?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">大部類一覧</a></li>
					<li role="presentation"><a
						href="/rankcyu?pagenum=1&contentnum=10">中分類一覧</a></li>
					<li role="presentation"><a
						href="/ranksyou?pagenum=1&contentnum=10">小分類一覧</a></li>
				</ul>
			</div>
			<div class="col-sm-10">
				<div 　class="pull-left">
					<h3 style="padding: 0; margin: 0; margin-bottom: 10px;">大分類一覧</h3>
					<ol class="breadcrumb">
						<li><a href="/index">ホーム</a></li>
						<li class="active">大分類一覧</li>
					</ol>
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
				<div class="form-inline">
					<form action="search" method="get">
						<div class="panel panel-success">
							<div class="panel-heading">部署検索</div>
							<div class="panel-body">
								<div>
									<div class="form-group">
										<select name="searchtype" id="searchtype"
											style="width: 100px; height: 35px; margin-left: auto; margin-right: auto;">
											<option class="active" value="busyo_dai_code">コード</option>
											<option value="busyo_name">名称</option>
											<option value="busyo_name_smail">略称</option>
										</select>
									</div>
									<div class="form-group">
										<input type="text" class="form-control form-control-sm"
											name="keyword" id="keyword" placeholder="検索 KeyWordを入力してください"
											value="${page.keyword}" onkeyup="characterCheck()"
											onkeydown="characterCheck()" autocomplete="off"
											style="width: 400px; height: 35px; margin-left: auto; margin-right: auto;" />
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary" name="btnSearch"
											id="btnSearch">検索</button>
									</div>
								</div>
							</div>
						</div>
					</form>
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
			var searchtype = $('#searchtype').val()
			var keyword = $('#keyword').val()
			var url = "${pageContext.request.contextPath}/rankdai?pagenum="
					+ pagenum + "&contentnum=" + contentnum;
			url = url + "&searchtype=" + searchtype;
			url = url + "&keyword=" + keyword;
			location.href = url;

		};
		
		<!-- Search -->
		$(document).on('click', '#btnSearch', function(e){
			e.preventDefault();
			var url = "${pageContext.request.contextPath}/rankdai?pagenum=1&contentnum=10";
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