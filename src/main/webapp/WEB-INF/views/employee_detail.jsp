<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>社員情報詳細</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>社員情報詳細ページ</h2>
	</div>
	<div class="box-footer">
		<div class="inputArea">
			<input type="button" value="リスト" class="btn btn-primary"
				OnClick="/GS/employee?pagenum=1&contentnum=10&searchtyp=tosyo_num&keyword=">
			<button class="btn btn-warning"
				onclick="location.href='/employee/update/${detail.employee_no}'">修正</button>
			<button class="btn btn-danger"
				onclick="location.href='/employee/delete/${detail.employee_no}'">削除</button>
		</div>
	</div>
	<div class="container">
		<form action="employee/detail/${detail.employee_no }" method="get">
			<div class="inputArea">
				<label for="employee_no">社員コード</label>
				<p>${detail.employee_no }</p>
			</div>
			<div class="inputArea">
				<label for="rank_code">部署コード</label>
				<p>${detail.rank_code }</p>
			</div>
			<div class="inputArea">
				<label for="position_code">職責コード</label>
				<p>${detail.position_code }</p>
			</div>
			<div class="inputArea">
				<label for="employee_name">社員名</label>
				<p>${detail.employee_name }</p>
			</div>
			<div class="inputArea">
				<label for="type_code">区分コード</label>
				<p>${detail.type_code }</p>
			</div>
			<div class="inputArea">
				<label for="gender">性別</label>
				<p>${detail.gender }</p>
			</div>
			<div class="inputArea">
				<label for="birthday">誕生日</label>
				<p>${detail.birthday }</p>
			</div>
			<div class="inputArea">
				<label for="postal_code">郵便番号</label>
				<p>${detail.postal_code }</p>
			</div>
			<div class="inputArea">
				<label for="address_1">住所1</label>
				<p>${detail.address_1 }</p>
			</div>
			<div class="inputArea">
				<label for="address_2">住所2</label>
				<p>${detail.address_2 }</p>
			</div>
			<div class="inputArea">
				<label for="employee_memo">特異事項</label>
				<p>${detail.employee_memo }</p>
			</div>
		</form>
	</div>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>