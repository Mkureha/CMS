<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>社員登録</title>
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
			<li class="active"><a style="color: white;"
				href="/employee?pagenum=1&contentnum=10&searchtype=employee_code&keyword=">社員一覧</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">部署 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a
						href="/rankdai?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">大分類一覧</a></li>
					<li><a
						href="/rankcyu?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">中分類一覧</a></li>
					<li><a
						href="/ranksyou?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">小分類一覧</a></li>
				</ul></li>
			<li><a style="color: white;"
				href="/position?pagenum=1&contentnum=10&searchtype=position_code&keyword=">職責一覧</a></li>
			<li><a style="color: white;"
				href="/type?pagenum=1&contentnum=10&searchtype=type_code&keyword=">役職一覧</a></li>
		</ul>
	</div>
	</nav>

	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-sm-2">
				<ul class="nav nav-pills nav-stacked" style="margin-bottom: 20px;">
					<li role="presentation" class="active"><a
						href="/employee?pagenum=1&contentnum=10&searchtype=employee_no&keyword=">社員一覧</a></li>
				</ul>
			</div>
			<div class="col-sm-10">
				<div class="pull-left">
					<h3 style="padding: 0; margin: 0; margin-bottom: 10px;">部署登録</h3>
					<ol class="breadcrumb">
						<li><a href="/index">ホーム</a></li>
						<li><a
							href="/employee?pagenum=1&contentnum=10&searchtype=employee_no&keyword=">社員一覧</a></li>
						<li class="active">社員登録</li>
					</ol>
					<div>
						<h5 class="pull-right"
							style="padding: 0; margin: 0; margin-bottom: 10px; 　color: red; font-weight: bold; color: red;">
							* 部署コード(小)を選択してください *<br>選択したらページが移動します
						</h5>
						<form role="form" action="/employee/insertProc" method="post"
							enctype="multipart/form-data" autocomplete="off">
							<table class="table table-bordered table-condensed"
								style="margin-top: 35px;">
								<tr class="form-group">
									<td class="text-center warning" for="busyo_dai_code"
										style="width: 250px; height: auto; text-align: right; font-weight: bold; color: red;">*
										部署コード(大)</td>
									<td style="width: 1000px;"><select
										class="form-control form-control-sm" name="busyo_dai_code"
										id="busyo_dai_code"
										style="width: 150px; height: auto; left: 10px;">
											<c:forEach var="lc" items="${listcode}">
												<c:if test="${lc.busyo_dai_code eq busyo_dai_code}">
													<option value="${lc.busyo_dai_code}" selected="selected">
														${lc.busyo_dai_code }:${lc.busyo_name }</option>
												</c:if>
												<c:if test="${lc.busyo_dai_code ne busyo_dai_code}">
													<option value="${lc.busyo_dai_code}">
														${lc.busyo_dai_code }:${lc.busyo_name }</option>
												</c:if>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_cyu_code"
										style="width: 250px; height: auto; text-align: right; font-weight: bold; color: red;">*
										部署コード(中)</td>
									<td style="width: 1000px;"><select
										class="form-control form-control-sm" name="busyo_cyu_code"
										id="busyo_cyu_code"
										style="width: 150px; height: auto; left: 10px;">
											<c:forEach var="lcc" items="${listcyucode}">
												<c:if test="${lcc.busyo_cyu_code eq busyo_cyu_code}">
													<option value="${lcc.busyo_cyu_code}" selected="selected">
														${lcc.busyo_cyu_code }:${lcc.busyo_name }</option>
												</c:if>
												<c:if test="${lcc.busyo_cyu_code ne busyo_cyu_code}">
													<option value="${lcc.busyo_cyu_code}">
														${lcc.busyo_cyu_code }:${lcc.busyo_name }</option>
												</c:if>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_syou_code"
										style="width: 250px; height: auto; text-align: right; font-weight: bold; color: red;">*
										部署コード(小)</td>
									<td style="width: 1000px;"><select
										class="form-control form-control-sm" name="busyo_syou_code"
										id="busyo_syou_code"
										style="width: 150px; height: auto; left: 10px;">
											<option value="99">小分類コード</option>
											<c:forEach var="lccc" items="${listsyoucode}">
												<option value="${lccc.busyo_syou_code }">${lccc.busyo_syou_code }:${lccc.busyo_name }</option>
											</c:forEach>
									</select></td>
								</tr>
							</table>
							<div class="text-right" style="position: relative;">
								<button type="submit" class="btn btn-warning"
									style="width: 70px; height: 30px;">登録</button>
								<a type="button" class="btn btn-primary"
									href="javascript:history.back(-1)"
									style="width: 70px; height: 30px;">戻る</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<style>
table {
	width: auto;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
	text-align: left;
	background-color: white;
	text-align: left;
}

body, div {
	font-family: 'メイリオ', Meiryo, 'ヒラギノ角ゴ Pro W3', 'Hiragino Kaku Gothic Pro',
		'ＭＳ Ｐゴシック', sans-serif;
}
</style>

	<script type="text/javascript">
		//大分類イベント
		$(document)
				.ready(
						function() {
							$('#busyo_dai_code')
									.on(
											'change',
											function() {
												var daicodeVal = $(
														'#busyo_dai_code')
														.val();
												if (daicodeVal => 0) {
													location.href = "http://localhost:8080/employee/insert/"
															+ daicodeVal;
												} else {
													alert("大分類を選択してください！")
													$("#busyo_dai_code")
															.focus();
												}
											});
						});

		//中分類イベント
		$(document)
				.ready(
						function() {
							$('#busyo_cyu_code')
									.on(
											'change',
											function() {
												var daicodeVal = $(
														'#busyo_dai_code')
														.val();
												var cyucodeVal = $(
														'#busyo_cyu_code')
														.val();
												if (cyucodeVal => 0) {
													location.href = "http://localhost:8080/employee/insert/"
															+ daicodeVal
															+ "/"
															+ cyucodeVal;
												} else {
													alert("中分類を選択してください！")
													$("#busyo_cyu_code")
															.focus();
												}
											});
						});
		//小分類イベント
		$(document)
				.ready(
						function() {
							$('#busyo_syou_code')
									.on(
											'change',
											function() {
												var daicodeVal = $(
														'#busyo_dai_code')
														.val();
												var cyucodeVal = $(
														'#busyo_cyu_code')
														.val();
												var syoucodeVal = $(
														'#busyo_syou_code')
														.val();
												if (syoucodeVal => 0) {
													location.href = "http://localhost:8080/employee/insert/"
															+ daicodeVal + "/" +
													cyucodeVal + "/" +
													syoucodeVal;
												} else {
													alert("小分類を選択してください！")
													$("#busyo_syou_code")
															.focus();
												}
											});
						});
	</script>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>