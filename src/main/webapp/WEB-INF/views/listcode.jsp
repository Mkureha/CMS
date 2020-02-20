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

	<c:forEach var="list" items="${rank_dai}">
		<select class="form-control form-control-sm" name="busyo_dai_code"
			id="busyo_dai_code" style="width: 150px; height: auto; left: 10px;">
			<option value="${list.busyo_dai_code}">${list.busyo_dai_code}:代表取締役</option>
		</select>
	</c:forEach>

	<style>
body, div {
	font-family: 'メイリオ', Meiryo, 'ヒラギノ角ゴ Pro W3', 'Hiragino Kaku Gothic Pro',
		'ＭＳ Ｐゴシック', sans-serif;
}
</style>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>