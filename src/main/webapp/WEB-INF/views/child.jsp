<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分類選択</title>
<script type="text/javascript">
function setParentText(){
	opener.document.getElementById("busyo_syou_code").value = document.getElementById("cInput").value
}
</script>
</head>
<body>
<br>
    <b><font size="5" color="gray">分類</font></b>
    <br><br>
 
    <input type="text" id="cInput"> <input type="button" value="送る" onclick="getParentText()">
    <br><br>
    <input type="button" value="閉じる" onclick="window.close()">
</body>
</html>