<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<title></title>
</head>
<body style="padding-top: 60px;">

	<div class="container">
		<form action="/listcode" method="get">
			<c:forEach var="listcodeA" items="${listcode}">
				<div class="inputArea">
					<label for="busyo_name">名称</label>
					<p>${listcodeA.busyo_name }</p>
				</div>
			</c:forEach>
		</form>
	</div>

	<style>
body,div {
	font-family: 'メイリオ', Meiryo, 'ヒラギノ角ゴ Pro W3', 'Hiragino Kaku Gothic Pro',
		'ＭＳ Ｐゴシック', sans-serif;
}
</style>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>