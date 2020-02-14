<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<title>職責情報入力 - 簡単</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>職責 登録</h2>
	</div>

	<form role="form" action="/position/insertProc" method="post"
		enctype="multipart/form-data" autocomplete="off">
		<div class="inputArea" style="margin: 10px 0;">
			<div class="form-group">
				<label for="position_code" style="width: 500px; padding: 10px;">職責コード
				</label> <select class="form-control form-control-sm" name="position_code"
					id="position_code" style="width: 250px;">
					<option value="99" selected="selected">未配置</option>
					<option value="01">部長</option>
					<option value="02">課長</option>
					<option value="03">主任</option>
					<option value="04">社員</option>
				</select>
			</div>
			<div class="form-group">
				<label for="position_name" style="width: 500px; padding: 10px;">職責名
				</label> <input type="text" class="form-control" id="position_name"
					name="position_name" placeholder="職責名を入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="position_name_small" style="width: 500px; padding: 10px;">職責省略名<br>(3桁の文字)
				</label> <input type="text" class="form-control" id="position_name_small"
					name="position_name_small" placeholder="職責省略名を入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="position_start" style="width: 500px; padding: 10px;">職責開始日<br>('-'なしで入力してください)
				</label> <input type="text" class="form-control" id="position_start"
					name="position_start" placeholder="職責開始日を入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="position_end" style="width: 500px; padding: 10px;">職責終了日<br>('-'なしで入力してください)
				</label> <input type="text" class="form-control" id="position_end"
					name="position_end" placeholder="職責終了日を入力してください"
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