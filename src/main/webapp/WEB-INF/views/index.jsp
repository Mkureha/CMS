<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Comapany Management System</title>
</head>
<body>

	<div class="text-center" style="float: none; margin: 0 auto;">
		<h2>COMPANY MANAGEMENT SYSTEM</h2>
	</div>

	<div>
		<a role="button" class="btn btn-primary"
			href="/employee?pagenum=1&contentnum=10&searchtype=employee_no&keyword=">社員リストへ</a>
		<a role="button" class="btn btn-info" href="/rank">部署リストへ</a> <a
			role="button" class="btn btn-light" href="/position">職責リストへ</a>
	</div>

	<div class="text-center" style="float: none; margin: 0 auto;">
		<h1>
			ここはメインページでございます。<br> <br> 上のメニューを選択してください
		</h1>
	</div>

	<%@ include file="bootstrap.jsp"%>
</body>
</html>