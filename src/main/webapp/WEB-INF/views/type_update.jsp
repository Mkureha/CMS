<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>情報修正</title>
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
			<li><a style="color: white;"
				href="/employee?pagenum=1&contentnum=10&searchtype=employee_no&keyword=">社員一覧</a></li>
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
				href="/type?pagenum=1&contentnum=10&searchtype=type_code&keyword=">職責一覧</a></li>
			<li class="active"><a style="color: white;"
				href="/type?pagenum=1&contentnum=10&searchtype=type_code&keyword=">役職一覧</a></li>
		</ul>
	</div>
	</nav>

	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-sm-2">
				<ul class="nav nav-pills nav-stacked" style="margin-bottom: 20px;">
					<li class="active" role="presentation"><a
						href="/type?pagenum=1&contentnum=10&searchtype=type_code&keyword=">役職一覧</a></li>
				</ul>
			</div>
			<div class="col-sm-10">
				<div class="pull-left">
					<h3 style="padding: 0; margin: 0; margin-bottom: 10px;">情報修正</h3>
					<ol class="breadcrumb">
						<li><a href="/index">ホーム</a></li>
						<li><a href="/type?pagenum=1&contentnum=10&searchtype=type_code&keyword=">役職一覧</a></li>
						<li class="active">情報修正</li>
					</ol>
					<div>
						<h5 class="pull-left"
							style="padding: 0; margin: 0; margin-bottom: 10px; 　color: red; font-weight: bold;">基本情報</h5>
						<form action="/type/updateProc" method="post"
							autocomplete="off">
							<table class="table table-bordered table-condensed"
								style="margin-top: 35px;">
								<tr class="form-group">
									<td class="text-center warning" for="type_code"
										style="width: 250px; text-align: right;">コード</td>
									<td style="width: 1000px;"><input type="text"
										class="form-control" id="type_code" name="type_code"
										value="${detail.type_code }" readonly="ture" 
										style="width: 150px; height: auto; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="type_name"
										style="width: 250px; text-align: right;">名称</td>
									<td style="width: 1000px;"><input type="text"
										class="form-control" id="type_name" name="type_name"
										value="${detail.type_name }" readonly="ture" 
										style="width: 550px; height: auto; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="type_name_small"
										style="width: 250px; text-align: right;">略称</td>
									<td style="width: 1000px;"><input type="text"
										class="form-control" id="type_name_small"
										name="type_name_small"
										value="${detail.type_name_small }" readonly="ture" 
										style="width: 400px; height: auto; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="type_start"
										style="width: 250px; text-align: right;">開始日</td>
									<td style="width: 1000px;"><input
										type="text" class="form-control" id="start_date"
										name="type_start" size="8"
										value="${detail.type_start }" readonly="ture" 
										style="width: 200px; height: auto; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="type_end"
										style="width: 250px; text-align: right;">終了日</td>
									<td style="width: 1000px; position: relative"><input
										type="text" class="form-control" id="end_date"
										name="type_end" size="8" value="${detail.type_end }"
										style="width: 200px; height: auto; cursor: pointer; left: 10px;">
									</td>
								</tr>
							</table>
							<div class="text-right" style="type: relative;">
								<input type="button" value="削除" class="btn btn-danger"
									OnClick="location.href='/type/delete/${detail.type_code}/${detail.type_start}'">
								<button type="submit" class="btn btn-warning">修正</button>
								<input type="button" value="戻る" class="btn btn-primary"
									OnClick="javascript:history.back(-1)">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<style>
body,div {
	font-family: 'メイリオ', Meiryo, 'ヒラギノ角ゴ Pro W3', 'Hiragino Kaku Gothic Pro',
		'ＭＳ Ｐゴシック', sans-serif;
}

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

.ui-datepicker-trigger {
	position: absolute;
	top: 13px;
	left: 180px;
}
</style>

	<script>
		//日付設定(end)
		$("#end_date")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd',
							changeYear : true,
							changeMonth : true,
							showOn : "both",
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
							buttonImageOnly : true
						});
	</script>

	<%@ include file="bootstrap.jsp"%>
</body>
</html>