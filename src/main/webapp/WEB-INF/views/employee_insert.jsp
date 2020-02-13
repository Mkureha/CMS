<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<title>社員情報入力 - 簡単</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>社員 登録</h2>
	</div>

	<form role="form" action="/insertProc" method="post"
		enctype="multipart/form-data" autocomplete="off">
		<div class="inputArea" style="margin: 10px 0;">
			<div class="form-group">
				<label for="employee_no" style="width: 150px; padding: 15px;">社員コード<br>(1桁のアルファベット連番+3桁の連番)
				</label> <input type="text" class="form-control" id="employee_no"
					name="employee_no" placeholder="社員番号を入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="employee_rank_code" style="width: 150px; padding: 15px;">部署コード<br>(00：本社、01：第1グループ、02：第2グループ、99：未配置)
				</label> <input type="text" class="form-control" id="employee_rank_code"
					name="employee_rank_code" placeholder="社員名を入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="employee_position_code"
					style="width: 150px; padding: 20px;">職責コード<br>(01：部長、02：課長、03：主任、04：社員、99：未配置)
				</label> <input type="text" class="form-control" id="employee_position_code"
					name="employee_position_code" placeholder="職責コードを入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="employee_name" style="width: 150px; padding: 5px;">社員名</label>
				<input type="text" class="form-control" id="employee_name"
					name="employee_name" placeholder="社員名を入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="employee_type_code" style="width: 150px; padding: 15px;">区分コード<br>(1：役員、2：正社員、3：契約社員、4：パート)
				</label> <input type="text" class="form-control" id="employee_type_code"
					name="employee_type_code" placeholder="区分コードを入力してください"
					style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="gender" style="width: 150px; padding: 5px;">性別</label> <input
					type="text" class="form-control" id="gender" name="gender"
					placeholder="性別を入力してください(男、女)" style="width: 250px;">
			</div>
			<div class="form-group">
				<label for="birthday" style="width: 150px; padding: 5px;">誕生日</label>
				<input type="text" class="form-control" id="birthday"
					name="birthday" placeholder="誕生日を入力してください" style="width: 250px;">
			</div>
			<div class="inputArea">
				<label for="postal_code" style="width: 150px; padding: 5px;">郵便番号</label>
				<input type="text" class="form-control" id="postal_code"
					name="postal_code" placeholder="郵便番号を入力してください"
					style="width: 150px;">
			</div>
			<div class="inputArea">
				<label for="address_1" style="width: 150px; padding: 5px;">郵便番号_詳細1</label>
				<input type="text" class="form-control" id="address_1"
					name="address_1" placeholder="都、市、区を入力してください" style="width: 150px;">
			</div>
			<div class="inputArea">
				<label for="address_2" style="width: 150px; padding: 5px;">郵便番号_詳細2</label>
				<input type="text" class="form-control" id="address_2"
					name="address_2" placeholder="建物の名前、号を入力してください"
					style="width: 150px;">
			</div>
			<div class="inputArea">
				<label for="employee_memo" style="width: 150px; padding: 5px;">特異事項</label>
				<input type="text" class="form-control" id="employee_memo"
					name="employee_memo" placeholder="特異事項を入力してください"
					style="width: 450px; padding: 150px">
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