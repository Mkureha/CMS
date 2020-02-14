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

	<form role="form" action="/rank/insertProc" method="post"
		enctype="multipart/form-data" autocomplete="off">
		<div class="inputArea" style="margin: 10px 0;">
			<div class="form-group">
				<label for="rank_code" style="width: 500px; padding: 10px;">部署コード
				</label> <select class="form-control form-control-sm" name="rank_code"
					id="rank_code" style="width: 250px;">
					<option value="99" selected="selected">未配置</option>
					<option value="00">本社</option>
					<option value="01">第1グループ</option>
					<option value="02">第2グループ</option>
				</select>
			</div>
			<div class="form-group">
				<label for="rank_name" style="width: 500px; padding: 10px;">部署名
				</label> <input type="text" class="form-control" id="rank_name"
					name="rank_name" placeholder="部署名を入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="rank_name_small" style="width: 500px; padding: 10px;">部署省略名<br>(3桁の文字)
				</label> <input type="text" class="form-control" id="rank_name_small"
					name="rank_name_small" placeholder="部署省略名を入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="rank_start" style="width: 500px; padding: 10px;">部署開始日<br>('-'なしで入力してください)
				</label> <input type="text" class="form-control" id="rank_start"
					name="rank_start" placeholder="部署開始日を入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="rank_end" style="width: 500px; padding: 10px;">部署終了日<br>('-'なしで入力してください)
				</label> <input type="text" class="form-control" id="rank_end"
					name="rank_end" placeholder="部署終了日を入力してください"
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