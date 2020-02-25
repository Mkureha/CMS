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
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">部署 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a
						href="/rankdai?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">大分類一覧</a></li>
					<li><a
						href="/rankcyu?pagenum=1&contentnum=10&searchtype=busyo_cyu_code&keyword=">中分類一覧</a></li>
					<li class="active"><a
						href="/ranksyou?pagenum=1&contentnum=10&searchtype=busyo_syou_code&keyword=">小分類一覧</a></li>
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
					<li role="presentation"><a
						href="/rankdai?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">大部類一覧</a></li>
					<li role="presentation"><a
						href="/rankcyu?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">中分類一覧</a></li>
					<li role="presentation" class="active"><a
						href="/ranksyou?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">小分類一覧</a></li>
				</ul>
			</div>
			<div class="col-sm-10">
				<div class="pull-left">
					<h3 style="padding: 0; margin: 0; margin-bottom: 10px;">情報修正</h3>
					<ol class="breadcrumb">
						<li><a href="/index">ホーム</a></li>
						<li><a href="/ranksyou?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">小分類一覧</a></li>
						<li class="active">情報修正</li>
					</ol>
					<div>
						<h5 class="pull-left"
							style="padding: 0; margin: 0; margin-bottom: 10px; 　color: red; font-weight: bold;">基本情報</h5>
						<form action="/ranksyou/updateProc" method="post"
							autocomplete="off">
							<table class="table table-bordered table-condensed"
								style="margin-top: 35px;">
								<tr class="form-group">
									<td class="text-center warning" for="busyo_dai_code"
										style="width: 250px; height: auto; text-align: right; font-weight: bold; color: red;">*
										大分類コード</td>
									<td style="width: 1000px;"><select
										class="form-control form-control-sm" name="busyo_dai_code"
										id="busyo_dai_code"
										style="width: 150px; height: auto; left: 10px;">
											<c:forEach var="lc" items="${listcode}">
												<c:if test="${detail.busyo_dai_code eq lc.busyo_dai_code}">
													<option value="${lc.busyo_dai_code}" selected="selected">
														${lc.busyo_dai_code }:${lc.busyo_name }</option>
												</c:if>
												<c:if test="${detail.busyo_dai_code ne lc.busyo_dai_code}">
													<option value="${lc.busyo_dai_code}">
														${lc.busyo_dai_code }:${lc.busyo_name }</option>
												</c:if>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_cyu_code"
										style="width: 250px; height: auto; text-align: right; font-weight: bold; color: red;">*
										中分類コード</td>
									<td style="width: 1000px;"><select
										class="form-control form-control-sm" name="busyo_cyu_code"
										id="busyo_cyu_code"
										style="width: 150px; height: auto; left: 10px;">
											<c:forEach var="lcc" items="${listcyucode}">
												<c:if test="${detail.busyo_cyu_code eq lcc.busyo_cyu_code}">
													<option value="${lcc.busyo_cyu_code}" selected="selected">
														${lcc.busyo_cyu_code }:${lcc.busyo_name }</option>
												</c:if>
												<c:if test="${detail.busyo_cyu_code ne lcc.busyo_cyu_code}">
													<option value="${lc.busyo_cyu_code}">
														${lcc.busyo_cyu_code }:${lcc.busyo_name }</option>
												</c:if>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_syou_code"
										style="width: 250px; height: auto; text-align: right; font-weight: bold; color: red;">*
										小分類コード</td>
									<td style="width: 1000px;"><input type="text"
										class="form-control" id="busyo_syou_code"
										name="busyo_syou_code" value="${detail.busyo_syou_code }"
										style="width: 150px; height: auto; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_name"
										style="width: 250px; text-align: right;">名称</td>
									<td style="width: 1000px;"><input type="text"
										class="form-control" id="busyo_name" name="busyo_name"
										value="${detail.busyo_name }"
										style="width: 550px; height: auto; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_name_small"
										style="width: 250px; text-align: right;">略称</td>
									<td style="width: 1000px;"><input type="text"
										class="form-control" id="busyo_name_small"
										name="busyo_name_small" value="${detail.busyo_name_small }"
										style="width: 400px; height: auto; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_start"
										style="width: 250px; height: auto; text-align: right; font-weight: bold; color: red;">*
										開始日</td>
									<td style="width: 1000px; position: relative"><input
										type="text" class="form-control" id="start_date"
										name="busyo_start" size="8" value="${detail.busyo_start }"
										style="width: 200px; height: auto; cursor: pointer; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_end"
										style="width: 250px; text-align: right;">終了日</td>
									<td style="width: 1000px; position: relative"><input
										type="text" class="form-control" id="end_date"
										name="busyo_end" size="8" value="${detail.busyo_end }"
										style="width: 200px; height: auto; cursor: pointer; left: 10px;">
									</td>
								</tr>
							</table>
							<div class="text-right" style="position: relative;">
								<input type="button" value="削除" class="btn btn-danger"
									OnClick="location.href='/ranksyou/delete/${detail.busyo_dai_code}/${detail.busyo_cyu_code}/${detail.busyo_syou_code}/${detail.busyo_start}'">
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
		//文字数制限
		//Small_name제한
		$(document).ready(function() {
			$('#busyo_name_small').on('keyup', function() {
				if ($(this).val().length > 3) {
					alert("文字数制限を超えました!(制限:3桁の英語)");
					$(this).val($(this).val().substring(0, 3));
				}
			});
		});

		//code 제한
		$(document).ready(function() {
			$('#busyo_syou_code').on('keyup', function() {
				var busyo_syou_code = $("input[name='busyo_syou_code']");
				if ($(this).val().length > 2) {
					alert("数字数制限を超えました!(制限:2桁の連番)");
					$(this).val($(this).val().substring(0, 2));
				} else if (!/^[0-9]{0,2}$/.test(busyo_syou_code.val())) {
					alert("コードは2桁の連番で入力しでください");
					$('#busyo_syou_code').val('');
				}
			});
		});

		//name 제한
		$(document).ready(function() {
			$('#busyo_name').on('keyup', function() {
				if ($(this).val().length > 100) {
					alert("文字数制限を超えました!(制限:文字-50桁、英語-100桁)");
					$(this).val($(this).val().substring(0, 100));
				}
			});
		});
		//日付設定(start)
		$("#start_date")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd',
							changeYear : true,
							changeMonth : true,
							showOn : "both",
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
							buttonImageOnly : true
						});

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