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
		<form action="/employee/updateProc" method="post">
			<div class="form-group">
				<label for="employee_no">社員コード</label> <input type="text"
					class="form-control" id="employee_no" name="employee_no"
					value="${detail.employee_no }">
			</div>
			<div class="form-group">
				<label for="rank_code">部署</label> <select
					class="form-control form-control-sm" name="rank_code"
					id="rank_code" style="width: 250px;">
					<option value="${detail.rank_code }" selected="selected">${detail.rank_code }</option>
					<option value="010001">経営支援チーム</option>
					<option value="010002">技術支援チーム</option>
					<option value="020101">第1グループ 第1開発ユニット</option>
					<option value="020102">第1グループ 第2開発ユニット</option>
					<option value="020103">第1グループ 第3開発ユニット</option>
					<option value="020104">第1グループ 第4開発ユニット</option>
					<option value="020201">第2グループ 第1開発ユニット</option>
					<option value="020202">第2グループ 第2開発ユニット</option>
					<option value="020203">第2グループ 第3開発ユニット</option>
					<option value="020204">第2グループ 第4開発ユニット</option>
				</select>
			</div>
			<div class="form-group">
				<label for="position_code">職責</label> <select
					class="form-control form-control-sm" name="position_code"
					id="position_code" style="width: 250px;">
					<option value="${detail.position_code }" selected="selected">${detail.position_code }</option>
					<option value="99">未配置</option>
					<option value="01">部長</option>
					<option value="02">課長</option>
					<option value="03">主任</option>
					<option value="04">社員</option>
				</select>
			</div>
			<div class="form-group">
				<label for="employee_name">社員名</label> <input type="text"
					class="form-control" id="employee_name" name="employee_name"
					value="${detail.employee_name }">
			</div>
			<div class="form-group">
				<label for="type_code">社員区分</label> <select
					class="form-control form-control-sm" name="type_code"
					id="type_code" style="width: 250px;">
					<option value="${detail.type_code }" selected="selected">${detail.type_code }</option>
					<option value="0">未配置</option>
					<option value="1">役員</option>
					<option value="2">正社員</option>
					<option value="3">契約社員</option>
					<option value="4">パート</option>
				</select>
			</div>
			<div class="form-group">
				<label for="gender">性別</label> <select
					class="form-control form-control-sm" name="gender" id="gender"
					style="width: 250px;">
					<option value="${detail.gender }" selected="selected">${detail.gender }</option>
					<option value="不明">不明</option>
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</div>
			<div class="form-group">
				<label for="birthday">誕生日</label> <input type="text"
					class="form-control" id="birthday" name="birthday"
					value="${detail.birthday }">
			</div>
			<div class="form-group">
				<label for="postal_code">郵便番号<br>('-'なしで入力してください)
				</label> <input type="text" class="form-control" id="postal_code"
					name="postal_code" value="${detail.postal_code }">
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