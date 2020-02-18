<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大分類部署情報修正</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>大分類部署情報修正</h2>
	</div>

	<div class="container">
		<form action="/rankdai/updateProc" method="post">
			<div class="form-group">
				<label for="busyo_dai_code" style="width: 500px; padding: 15px;">大分類コード<br>(01:経営支援部
					/ 02:SI事業部)
				</label> <input type="text" class="form-control" id="busyo_dai_code"
					name="busyo_dai_code" value="${detail.busyo_dai_code }">
			</div>
				<label for="busyo_name">部署名</label> <input type="text"
					class="form-control" id="busyo_name" name="busyo_name"
					value="${detail.busyo_name }">
			</div>
			<div class="form-group">
				<label for="busyo_name_small">部署省略名</label> <input type="text"
					class="form-control" id="busyo_name_small" name="busyo_name_small"
					value="${detail.busyo_name_small }">
			</div>
			<div class="form-group">
				<label for="busyo_start">部署開始日</label> <input type="text"
					class="form-control" id="busyo_start" name="busyo_start"
					value="${detail.busyo_start }">
			</div>
			<div class="form-group">
				<label for="busyo_end">部署終了日</label> <input type="text"
					class="form-control" id="busyo_end" name="busyo_end"
					value="${detail.busyo_end }">
			</div>
			<button type="submit" class="btn btn-primary">修正</button>
			<input type="button" value="戻る" class="btn btn-primary"
				OnClick="javascript:history.back(-1)">
			<%@ include file="bootstrap.jsp"%>
</body>
</html>