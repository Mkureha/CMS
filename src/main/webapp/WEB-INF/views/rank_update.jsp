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
		<form action="/rank/updateProc" method="post">
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
				<label for="rank_name">部署名</label> <input type="text"
					class="form-control" id="rank_name" name="rank_name"
					value="${detail.rank_name }">
			</div>
			<div class="form-group">
				<label for="rank_name_small">部署省略名</label> <input type="text"
					class="form-control" id="rank_name_small" name="rank_name_small"
					value="${detail.rank_name_small }">
			</div>
			<div class="form-group">
				<label for="rank_start">部署開始日</label> <input type="text"
					class="form-control" id="rank_start" name="rank_start"
					value="${detail.rank_start }">
			</div>
			<div class="form-group">
				<label for="rank_end">部署終了日</label> <input type="text"
					class="form-control" id="rank_end" name="rank_end"
					value="${detail.rank_end }">
			</div>
			<button type="submit" class="btn btn-primary">修正</button>
			<input type="button" value="戻る" class="btn btn-primary"
				OnClick="javascript:history.back(-1)">
			<%@ include file="bootstrap.jsp"%>
</body>
</html>