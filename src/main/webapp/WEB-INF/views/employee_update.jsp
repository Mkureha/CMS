<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>図書情報修正</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>図書情報修正</h2>
	</div>

	<div class="container">
		<form action="/updateProc" method="post">
			<div class="form-group">
				<label for="employee_no">社員コード</label> <input type="text"
					class="form-control" id="employee_no" name="employee_no"
					value="${detail.employee_no }">
			</div>
			<div class="form-group">
				<label for="employee_rank_code">部署コード</label> <input type="text"
					class="form-control" id="employee_rank_code"
					name="employee_rank_code" value="${detail.employee_no }">
			</div>
			<div class="form-group">
				<label for="employee_position_code">職責コード</label> <input type="text"
					class="form-control" id="employee_position_code"
					name="employee_position_code" value="${detail.employee_no }">
			</div>
			<div class="form-group">
				<label for="employee_name">社員名</label> <input type="text"
					class="form-control" id="employee_name" name="employee_name"
					value="${detail.employee_name }">
			</div>
			<div class="form-group">
				<label for="employee_type_code">区分コード</label> <input type="text"
					class="form-control" id="employee_type_code"
					name="employee_type_code" value="${detail.employee_no }">
			</div>
			<div class="form-group">
				<label for="gender">性別</label> <input type="text"
					class="form-control" id="gender" name="gender"
					value="${detail.gender }">
			</div>
			<div class="form-group">
				<label for="birthday">誕生日</label> <input type="text"
					class="form-control" id="birthday" name="birthday"
					value="${detail.birthday }">
			</div>
			<div class="form-group">
				<label for="postal_code">郵便番号</label> <input type="text"
					class="form-control" id="postal_code" name="postal_code"
					value="${detail.postal_code }">
			</div>
			<div class="form-group">
				<label for="address_1">住所1</label> <input type="text"
					class="form-control" id="address_1" name="address_1"
					value="${detail.address_1 }">
			</div>
			<div class="form-group">
				<label for="address_2">住所2</label> <input type="text"
					class="form-control" id="address_2" name="address_2"
					value="${detail.address_2 }">
			</div>
			<div class="form-group">
				<label for="employee_memo">特異事項</label> <input type="text"
					class="form-control" id="employee_memo" name="employee_memo"
					value="${detail.employee_memo }">
			</div>
			<button type="submit" class="btn btn-primary">修正</button>
			<input type="button" value="戻る" class="btn btn-primary"
				OnClick="javascript:history.back(-1)">
			<%@ include file="bootstrap.jsp"%>
</body>
</html>