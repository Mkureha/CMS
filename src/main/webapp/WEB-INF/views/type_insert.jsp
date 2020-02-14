<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<title>部署情報入力 - 簡単</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>部署 登録</h2>
	</div>

	<form role="form" action="/type/insertProc" method="post"
		enctype="multipart/form-data" autocomplete="off">
		<div class="inputArea" style="margin: 10px 0;">
			<div class="form-group">
				<label for="type_code" style="width: 500px; padding: 10px;">区分コード
				</label> <select class="form-control form-control-sm" name="type_code"
					id="type_code" style="width: 250px;">
					<option value="0" selected="selected">未配置</option>
					<option value="1">役員</option>
					<option value="2">正社員</option>
					<option value="3">契約社員</option>
					<option value="4">パート</option>
				</select>
			</div>
			<div class="form-group">
				<label for="type_name" style="width: 500px; padding: 10px;">部署名
				</label> <input type="text" class="form-control" id="type_name"
					name="type_name" placeholder="部署名を入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="type_name_small" style="width: 500px; padding: 10px;">部署省略名<br>(3桁の文字)
				</label> <input type="text" class="form-control" id="type_name_small"
					name="type_name_small" placeholder="部署省略名を入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="type_start" style="width: 500px; padding: 10px;">部署開始日<br>('-'なしで入力してください)
				</label> <input type="text" class="form-control" id="type_start"
					name="type_start" placeholder="部署開始日を入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="type_end" style="width: 500px; padding: 10px;">部署終了日<br>('-'なしで入力してください)
				</label> <input type="text" class="form-control" id="type_end"
					name="type_end" placeholder="部署終了日を入力してください"
					style="width: 250px;">
			</div>

			<button type="submit" class="btn btn-primary">登録</button>
			<input type="reset" class="btn btn-primary" value="reset" />
		</div>
	</form>

	<style>
</style>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>