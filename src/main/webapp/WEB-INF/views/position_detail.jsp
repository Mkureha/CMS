<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>職責情報詳細</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>職責情報詳細ページ</h2>
	</div>
	<div class="box-footer">
		<div class="inputArea">
			<button class="btn btn-primary"
				OnClick="location.href='/position?pagenum=1&contentnum=10&searchtype=position_code&keyword='">リスト</button>
			<button class="btn btn-warning"
				onclick="location.href='/position/update/${detail.position_code}/${detail.position_start}'">修正</button>
			<button class="btn btn-danger"
				onclick="location.href='/position/delete/${detail.position_code}/${detail.position_start}'">削除</button>
		</div>
	</div>
	<div class="container">
		<form action="position/detail/${detail.position_code }/${detail.position_start }" method="get">
			<div class="inputArea">
				<label for="position_code">職責コード</label>
				<p>${detail.position_code }</p>
			</div>
			<div class="inputArea">
				<label for="position_name">職責名</label>
				<p>${detail.position_name }</p>
			</div>
			<div class="inputArea">
				<label for="position_name_small">職責省略名</label>
				<p>${detail.position_name_small }</p>
			</div>
			<div class="inputArea">
				<label for="position_start">職責開始日</label>
				<p>${detail.position_start }</p>
			</div>
			<div class="inputArea">
				<label for="position_end">職責終了日</label>
				<p>${detail.position_end }</p>
			</div>
		</form>
	</div>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>