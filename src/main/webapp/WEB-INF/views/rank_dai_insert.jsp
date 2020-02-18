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
<title>部署情報入力(大分類) - 簡単</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>部署(大分類) 登録</h2>
	</div>

	<form role="form" action="/rankdai/insertProc" method="post"
		enctype="multipart/form-data" autocomplete="off">
		<div class="inputArea" style="margin: 10px 0;">
			<div class="form-group">
				<label for="busyo_dai_code" style="width: 500px; padding: 15px;">大分類コード
				</label> <input type="text" class="form-control" id="busyo_dai_code"
					name="busyo_dai_code" placeholder="大分類コードを入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="busyo_name" style="width: 500px; padding: 10px;">部署名
				</label> <input type="text" class="form-control" id="busyo_name"
					name="busyo_name" placeholder="部署名を入力してください" style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="busyo_name_small" style="width: 500px; padding: 10px;">部署省略名<br>(3桁の文字)
				</label> <input type="text" class="form-control" id="busyo_name_small"
					name="busyo_name_small" placeholder="部署省略名を入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="busyo_start" style="width: 500px; padding: 10px;">部署開始日<br>('-'なしで入力してください
					/ 8桁の連番)
				</label>
				<div style="position: relative">
					<input type="text" class="form-control" id="start_date"
						name="busyo_start" size="8" title="YYYYMMDD"
						style="width: 250px; cursor: pointer">
				</div>
			</div>
			<div class="form-group">
				<label for="busyo_end" style="width: 500px; padding: 10px;">部署終了日<br>('-'なしで入力してください
					/ 8桁の連番)
				</label>
				<div style="position: relative">
					<input type="text" class="form-control" id="end_date"
						name="busyo_end" size="8" title="YYYYMMDD"
						style="width: 250px; cursor: pointer">
				</div>
			</div>

			<button type="submit" class="btn btn-primary">登録</button>
			<input type="reset" class="btn btn-primary" value="reset" />
		</div>
	</form>

	<style>
.ui-datepicker-trigger {
	position: absolute;
	top: 10px;
	left: 230px;
}
</style>

	<script type="text/javascript">
		//文字数制限
		//Small_name제한
		$(document).ready(function() {
			$('#busyo_name_small').on('keyup', function() {
				if ($(this).val().length > 3) {
					alert("文字数制限を超えました!(制限:3桁)");
					$(this).val($(this).val().substring(0, 3));
				}
			});
		});

		//code 제한
		$(document).ready(function() {
			$('#busyo_dai_code').on('keyup', function() {
				if ($(this).val().length > 2) {
					alert("数字数制限を超えました!(制限:2桁)");
					$(this).val($(this).val().substring(0, 2));
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