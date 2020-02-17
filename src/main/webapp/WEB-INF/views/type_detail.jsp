<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部署情報詳細</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>部署情報詳細ページ</h2>
	</div>
	<div class="box-footer">
		<div class="inputArea">
			<input type="button" value="リスト" class="btn btn-primary"
				OnClick="/GS/type?pagenum=1&contentnum=10&searchtyp=tosyo_num&keyword=">
			<button class="btn btn-warning"
				onclick="location.href='/type/update/${detail.type_code}/${detail.type_start}'">修正</button>
			<button class="btn btn-danger"
				onclick="location.href='/type/delete/${detail.type_code}/${detail.type_start}'">削除</button>
		</div>
	</div>
	<div class="container">
		<form action="type/detail/${detail.type_code }/${detail.type_start }" method="get">
			<div class="inputArea">
				<label for="type_code">部署コード</label>
				<p>${detail.type_code }</p>
			</div>
			<div class="inputArea">
				<label for="type_name">部署名</label>
				<p>${detail.type_name }</p>
			</div>
			<div class="inputArea">
				<label for="type_name_small">部署省略名</label>
				<p>${detail.type_name_small }</p>
			</div>
			<div class="inputArea">
				<label for="type_start">部署開始日</label>
				<p>${detail.type_start }</p>
			</div>
			<div class="inputArea">
				<label for="type_end">部署終了日</label>
				<p>${detail.type_end }</p>
			</div>
		</form>
	</div>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>