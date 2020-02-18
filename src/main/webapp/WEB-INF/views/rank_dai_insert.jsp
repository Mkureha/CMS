<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>大分類入力 - 簡単</title>
</head>
<body>
	<div class="container centered text-center text-info"
		style="height: 200px; padding-top: 50px;">
		<h2>大分類 登録</h2>
	</div>

	<form role="form" action="/rankdai/insertProc" method="post"
		enctype="multipart/form-data" autocomplete="off">
		<table class="inputArea"
			style="margin: 10px 0; margin-left: auto; margin-right: auto;">
			<tr class="form-group">
				<td for="busyo_dai_code"
					style="width: 250px; padding: 10px; font-weight: bold; color: red;">*
					コード</td>
				<td><input type="text" class="form-control" id="busyo_dai_code"
					name="busyo_dai_code" placeholder="2桁の連番で入力してください"
					style="width: 250px; left: 5px;" /></td>
			</tr>
			<tr class="form-group">
				<td for="busyo_name"
					style="width: 250px; padding: 10px; font-weight: bold; color: red;">*
					名称</td>
				<td><input type="text" class="form-control" id="busyo_name"
					name="busyo_name" placeholder="名称(制限 50文字まで)"
					style="width: 250px; left: 5px;" /></td>
			</tr>
			<tr class="form-group">
				<td for="busyo_name_small" style="width: 250px; padding: 10px;">略称(3桁の文字)
				</td>
				<td><input type="text" class="form-control"
					id="busyo_name_small" name="busyo_name_small"
					placeholder="略称(制限10文字まで)" style="width: 250px; left: 5px;" /></td>
			</tr>
			<tr class="form-group">
				<td for="busyo_start"
					style="width: 250px; padding: 10px; font-weight: bold; color: red;">*
					開始日</td>
				<td style="position: relative"><input type="text"
					class="form-control" id="start_date" name="busyo_start" size="8"
					title="開始日" style="width: 250px; cursor: pointer; left: 5px;">
				</td>
			</tr>
			<tr class="form-group">
				<td for="busyo_end" style="width: 250px; padding: 10px;">終了日
				</td>
				<td style="position: relative"><input type="text"
					class="form-control" id="end_date" name="busyo_end" size="8"
					title="終了日" style="width: 250px; cursor: pointer; left: 5px;">
				</td>
			</tr>
		</table>
		<div style="position: relative; left: 50%;">
			<button type="submit"
				class="btn btn-primary btn-sm col-xs-2 col-xs-offset-1"
				style="width: 70px; height: 40px;">登録</button>
			<button type="reset" class="btn btn-primary btn-sm col-xs-2"
				style="width: 70px; height: 40px; margin-left: 5px;">Reset</button>
		</div>
	</form>

	<style type="text/css">
.ui-datepicker-trigger {
	position: absolute;
	top: 22px;
	left: 230px;
}

table {
	border: 4px solid black;
	width: 550px;
	height: 300px;
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
	text-align: left;
	background-color: white;
	text-align: left;
}

body {
	background-image: url('../image/background.jpg');
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

	<script type="text/javascript">
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
			$('#busyo_dai_code').on('keyup', function() {
				var busyo_dai_code = $("input[name='busyo_dai_code']");
				if ($(this).val().length > 2) {
					alert("数字数制限を超えました!(制限:2桁の連番)");
					$(this).val($(this).val().substring(0, 2));
				} else if (!/^[0-9]{0,2}$/.test(busyo_dai_code.val())) {
					alert("コードは2桁の連番で入力しでください");
					$('#busyo_dai_code').val('');
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
							dateFormat : 'yymmdd',
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
							dateFormat : 'yymmdd',
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