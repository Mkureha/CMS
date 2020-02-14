<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>職責情報修正</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>職責情報修正</h2>
	</div>

	<div class="container">
		<form action="/position/updateProc" method="post">
			<div class="form-group">
				<label for="position_code">職責コード</label> <select
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
				<label for="position_name">職責名</label> <input type="text"
					class="form-control" id="position_name" name="position_name"
					value="${detail.position_name }">
			</div>
			<div class="form-group">
				<label for="position_name_small">職責省略名</label> <input type="text"
					class="form-control" id="position_name_small" name="position_name_small"
					value="${detail.position_name_small }">
			</div>
			<div class="form-group">
				<label for="position_start">職責開始日</label> <input type="text"
					class="form-control" id="position_start" name="position_start"
					value="${detail.position_start }">
			</div>
			<div class="form-group">
				<label for="position_end">職責終了日</label> <input type="text"
					class="form-control" id="position_end" name="position_end"
					value="${detail.position_end }">
			</div>
			<button type="submit" class="btn btn-primary">修正</button>
			<input type="button" value="戻る" class="btn btn-primary"
				OnClick="javascript:history.back(-1)">
			<%@ include file="bootstrap.jsp"%>
</body>
</html>