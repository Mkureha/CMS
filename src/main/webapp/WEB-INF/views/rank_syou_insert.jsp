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
<title>部署登録</title>
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
					<li class="active"><a
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
					<li role="presentation"><a
						href="/rankdai?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">大部類一覧</a></li>
					<li role="presentation"><a
						href="/rankcyu?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">小分類一覧</a></li>
					<li role="presentation" class="active"><a
						href="/ranksyou?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">小分類一覧</a></li>
				</ul>
			</div>
			<div class="col-sm-10">
				<div class="pull-left">
					<h3 style="padding: 0; margin: 0; margin-bottom: 10px;">部署（小分類）登録</h3>
					<ol class="breadcrumb">
						<li><a href="/index">ホーム</a></li>
						<li><a
							href="/ranksyou?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">小分類一覧</a></li>
						<li class="active">部署登録</li>
					</ol>
					<div>
						<h5 class="pull-right"
							style="padding: 0; margin: 0; margin-bottom: 10px; 　color: red; font-weight: bold; color: red;">
							* は必ず入力してください</h5>
						<form role="form" action="/ranksyou/insertProc" id="SinsertForm"
							method="post" enctype="multipart/form-data" autocomplete="off">
							<table class="table table-bordered table-condensed"
								style="margin-top: 35px;">
								<tr class="form-group">
									<td class="text-center warning" for="busyo_dai_code"
										style="width: 200px; height: auto; text-align: right; font-weight: bold; color: red;">*
										大分類コード</td>
									<td style="width: 140px;"><input type="text"
										class="form-control" id="busyo_dai_code" name="busyo_dai_code"
										placeholder="大分類" readonly="true"
										style="width: 150px; height: auto; left: 10px;" /></td>
									<td style="width: 700px;"><input type="text"
										class="form-control" id="busyo_dai_name" placeholder="大分類名"
										readonly="true"
										style="width: 400px; height: auto; left: 10px;" /></td>
								</tr>
								<tr>
									<td class="text-center warning" for="busyo_cyu_code"
										style="width: 200px; height: auto; text-align: right; font-weight: bold; color: red;">*
										中分類コード</td>
									<td style="width: 140px;"><input type="text"
										class="form-control" id="busyo_cyu_code" name="busyo_cyu_code"
										placeholder="中分類" readonly="true"
										style="width: 150px; height: auto; left: 10px;" /></td>
									<td style="width: 700px;"><input type="text"
										class="form-control" id="busyo_cyu_name" placeholder="中分類名"
										readonly="true"
										style="width: 400px; height: auto; left: 10px;" /></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_syou_code"
										style="width: 200px; height: auto; text-align: right; font-weight: bold; color: red;">*
										小分類コード</td>
									<td colspan="2" style="width: 1000px; position: relative"><div>
											<input type="button" class="btn btn-danger" value="分類選択"
												onclick="openchild()"
												style="width: 100px; height: auto; left: 10px;"><input
												type="text" class="form-control" id="busyo_syou_code"
												name="busyo_syou_code" placeholder="2桁の連番"
												style="width: 150px; height: auto; bottom: 4px; left: 110px; position: absolute" />
										</div></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_name"
										style="width: 200px; height: auto; text-align: right; font-weight: bold; color: red;">*
										名称</td>
									<td colspan="2" style="width: 1000px;"><input type="text"
										class="form-control" id="busyo_name" name="busyo_name"
										placeholder="大分類名/中分類名/小分類名(制限 30文字まで)"
										style="width: 550px; height: auto; left: 10px;" /></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_name_small"
										style="width: 200px; height: auto; text-align: right;">略称</td>
									<td colspan="2" style="width: 1000px;"><input type="text"
										class="form-control" id="busyo_name_small"
										name="busyo_name_small" placeholder="略称(制限5文字まで)"
										style="width: 400px; height: auto; left: 10px;" /></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_start"
										style="width: 200px; height: auto; text-align: right; font-weight: bold; color: red;">*
										開始日</td>
									<td colspan="2" style="width: 1000px; position: relative"><input
										type="text" class="form-control" id="start_date"
										name="busyo_start" size="8" title="開始日"
										style="width: 200px; height: auto; cursor: pointer; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_end"
										style="width: 200px; height: auto; text-align: right;">終了日</td>
									<td colspan="2" style="width: 1000px; position: relative"><input
										type="text" class="form-control" id="end_date"
										name="busyo_end" size="8" title="終了日"
										style="width: 200px; height: auto; cursor: pointer; left: 10px;">
									</td>
								</tr>
							</table>
							<div class="text-right" style="position: relative;">
								<input type="button" id="subend"
									class="btn btn-warning form-controll" value="登録"
									　style="width: 70px; height: 30px;" /> <a type="button"
									class="btn btn-primary"
									href="/ranksyou?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword="
									style="width: 70px; height: 30px;">戻る</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<style>
.ui-datepicker-trigger {
	position: absolute;
	top: 13px;
	left: 180px;
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

body,div {
	font-family: 'メイリオ', Meiryo, 'ヒラギノ角ゴ Pro W3', 'Hiragino Kaku Gothic Pro',
		'ＭＳ Ｐゴシック', sans-serif;
}
</style>

	<script type="text/javascript">
		//Form検査
		$(document)
				.ready(
						function() {
							$("#subend")
									.click(
											function() {
												if ($("#busyo_dai_code").val() == "") {
													alert("部署分類コード（大、中）を選択してください");
												} else if ($("#busyo_syou_code")
														.val().length != 2) {
													alert("小分類コードを入力してください（* 2桁の連番）");
												} else if ($("#busyo_name")
														.val() == "") {
													alert("部署名を入力してください（* 制限:文字-30桁、英語-60桁）");
												} else if ($("#busyo_start")
														.val() == "") {
													alert("開始日を選択してください");
												} else {
													$("#SinsertForm")
															.attr("action",
																	"<c:url value='/ranksyou/insertProc'/>");
													$("#SinsertForm").submit();
												}
											});
						});
		//popupイベント
		function openchild() {
			window.open('child', '分類',
					'width=700, height=450, resizeable=no, left=10 top=10');
		}
		//文字数制限
		//Small_name제한
		$(document).ready(function() {
			$('#busyo_name_small').on('keyup', function() {
				if ($(this).val().length > 10) {
					alert("文字数制限を超えました!(制限:文字-5桁、英語-10桁)");
					$(this).val($(this).val().substring(0, 10));
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
				if ($(this).val().length > 60) {
					alert("文字数制限を超えました!(制限:文字-30桁、英語-60桁)");
					$(this).val($(this).val().substring(0, 60));
				}
			});
		});
							//日付設定(start)
							$("#start_date")
									.datepicker(
											{
												dateFormat : "yy-mm-dd",
												changeYear : true,
												changeMonth : true,
												showOn : "both",
												buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
												buttonImageOnly : true,
												minDate : 0
											});

							//日付設定(end)
							$("#end_date")
									.datepicker(
											{
												dateFormat : "yy-mm-dd",
												changeYear : true,
												changeMonth : true,
												showOn : "both",
												buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
												buttonImageOnly : true,
												minDate : 0
											})
	</script>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>