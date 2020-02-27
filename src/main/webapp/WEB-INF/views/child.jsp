<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>分類選択</title>
<script type="text/javascript">
	//大分類イベント
	$(document)
			.ready(
					function() {
						$('#Dcodeinput')
								.on(
										'change',
										function() {
											var daicodeVal = $('#Dcodeinput')
													.val();
											if (daicodeVal => 0) {
												location.href = "http://localhost:8080/ranksyou/child/"
														+ daicodeVal;
											} else {
												alert("大分類を選択してください！")
												$("#Dcodeinput").focus();
											}
										});
					});
</script>
</head>
<body style="padding-top: 30px;">
	<div class="col-sm-10">
		<div class="pull-left">
			<h3
				style="padding: 0; margin: 0; margin-bottom: 10px; margin-top: 20px">分類選択</h3>
			<div class="pull-right"
				style="padding: 0; margin: 0; margin-bottom: 10px; 　color: red; font-weight: bold; color: red;">
				<table class="table table-bordered table-condensed"
					style="margin-top: 15px;">
					<tr class="form-group">
						<td class="text-center warning" for="busyo_dai_code"
							style="width: 150px; height: auto; text-align: right; font-weight: bold; color: red;">*
							大分類</td>
						<td style="width: 600px;"><select
							class="form-control form-control-sm" name="busyo_dai_code"
							id="Dcodeinput" style="width: 200px; height: auto; left: 10px;">
								<option value="99">大分類コード</option>
								<c:forEach var="lc" items="${listcode}">
									<option value="${lc.busyo_dai_code }">${lc.busyo_dai_code }:${lc.busyo_name }</option>
								</c:forEach>
						</select></td>
					</tr>
				</table>
				<div class="text-right" style="position: relative;">
					<input class="btn btn-danger" type="button" value="閉じる"
						onclick="window.close()" style="width: 70px; height: 30px;">
				</div>
			</div>
		</div>
	</div>
	<style>
table {
	width: auto;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
	text-align: left;
	background-color: white;
	text-align: left;
}

body,div {
	font-family: 'メイリオ', Meiryo, 'ヒラギノ角ゴ Pro W3', 'Hiragino Kaku Gothic Pro',
		'ＭＳ Ｐゴシック', sans-serif;
}
</style>
</body>
<%@ include file="bootstrap.jsp"%>
</html>