<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部署情報修正</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>部署情報修正</h2>
	</div>

	<div class="container">
		<form action="/type/updateProc" method="post">
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
				<label for="type_name">部署名</label> <input type="text"
					class="form-control" id="type_name" name="type_name"
					value="${detail.type_name }">
			</div>
			<div class="form-group">
				<label for="type_name_small">部署省略名</label> <input type="text"
					class="form-control" id="type_name_small" name="type_name_small"
					value="${detail.type_name_small }">
			</div>
			<div class="form-group">
				<label for="type_start">部署開始日</label> <input type="text"
					class="form-control" id="type_start" name="type_start"
					value="${detail.type_start }">
			</div>
			<div class="form-group">
				<label for="type_end">部署終了日</label> <input type="text"
					class="form-control" id="type_end" name="type_end"
					value="${detail.type_end }">
			</div>
			<button type="submit" class="btn btn-primary">修正</button>
			<input type="button" value="戻る" class="btn btn-primary"
				OnClick="javascript:history.back(-1)">
			<%@ include file="bootstrap.jsp"%>
</body>
</html>