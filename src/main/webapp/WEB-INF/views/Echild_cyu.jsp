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
//INSERTイベント
	function setParentText() {
		opener.document.getElementById("busyo_dai_code").value = document
				.getElementById("Dcodeinput").value
		opener.document.getElementById("busyo_cyu_code").value = document
				.getElementById("Ccodeinput").value
		opener.document.getElementById("busyo_syou_code").value = document
				.getElementById("Scodeinput").value
		opener.document.getElementById("busyo_name").value = document
				.getElementById("Cname").value
		window.close();
	}

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
												location.href = "http://localhost:8080/employee/child/"
														+ daicodeVal;
											} else {
												alert("大分類を選択してください！")
												$("#Dcodeinput").focus();
											}
										});
					});

	//中分類イベント
	$(document)
			.ready(
					function() {
						$('#Ccodeinput')
								.on(
										'change',
										function() {
											var daicodeVal = $('#Dcodeinput')
													.val();
											var cyucodeVal = $('#Ccodeinput')
											.val();
											if (cyucodeVal => 0) {
												location.href = "http://localhost:8080/employee/child/"
														+ daicodeVal + "/" + cyucodeVal;
											} else {
												alert("中分類を選択してください！")
												$("#Ccodeinput").focus();
											}
										});
					});

	//小分類イベント
	$(document)
			.ready(
					function() {
						$('#Scodeinput')
								.on(
										'change',
										function() {
											var daicodeVal = $('#Dcodeinput')
													.val();
											var cyucodeVal = $('#Ccodeinput')
											.val();
											var syoucodeVal = $('#Scodeinput')
											.val();
											if (cyucodeVal => 0) {
												location.href = "http://localhost:8080/employee/child/"
														+ daicodeVal + "/" + cyucodeVal + "/" + syoucodeVal;
											} else {
												alert("小分類を選択してください！")
												$("#Ccodeinput").focus();
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
			<div>
				<h5 class="pull-right"
					style="padding: 0; margin: 0; margin-bottom: 10px; 　color: red; font-weight: bold; color: red;">
					(登録した後、部署名は自動に '名称'に入ります)</h5><br>小分類が無い場合、小分類項目を'小分類コード'にしたまま'送信'を押してください
				<table class="table table-bordered table-condensed"
					style="margin-top: 15px;">
					<tr class="form-group">
						<td class="text-center warning" for="busyo_dai_code"
							style="width: 100px; height: auto; text-align: right;">大分類</td>
						<td style="width: 200px;"><select
							class="form-control form-control-sm" name="busyo_dai_code"
							id="Dcodeinput" style="width: 200px; height: auto; left: 10px;">
								<c:forEach var="lc" items="${listcode}">
									<c:if test="${lc.busyo_dai_code eq busyo_dai_code}">
										<option value="${lc.busyo_dai_code}" selected="selected">
											${lc.busyo_dai_code }:${lc.busyo_name }</option>
									</c:if>
									<c:if test="${lc.busyo_dai_code ne busyo_dai_code}">
										<option value="${lc.busyo_dai_code}">
											${lc.busyo_dai_code }:${lc.busyo_name }</option>
									</c:if>
								</c:forEach>
						</select></td>
						<td style="width: 400px"><c:forEach var="lc"
								items="${listcode}">
								<c:if test="${lc.busyo_dai_code eq busyo_dai_code}">
									<input id="Dname" class="form-control"
										value="${lc.busyo_name }" readonly="true"
										style="width: 100px; height: auto; left: 10px;">
								</c:if>
							</c:forEach></td>
					</tr>
					<tr class="form-group">
						<td class="text-center warning" for="busyo_cyu_code"
							style="width: 100px; height: auto; text-align: right;">中分類</td>
						<td style="width: 200px;"><select
							class="form-control form-control-sm" name="busyo_cyu_code"
							id="Ccodeinput" style="width: 200px; height: auto; left: 10px;">
								<c:forEach var="lcc" items="${listcyucode}">
									<c:if test="${lcc.busyo_cyu_code eq busyo_cyu_code}">
										<option value="${lcc.busyo_cyu_code}" selected="selected">
											${lcc.busyo_cyu_code }:${lcc.busyo_name }</option>
									</c:if>
									<c:if test="${lcc.busyo_dai_code ne busyo_dai_code}">
										<option value="${lcc.busyo_cyu_code}">
											${lcc.busyo_cyu_code }:${lcc.busyo_name }</option>
									</c:if>
								</c:forEach>
						</select></td>
						<td style="width: 400px"><c:forEach var="lcc"
								items="${listcyucode}">
								<c:if test="${lcc.busyo_cyu_code eq busyo_cyu_code}">
									<input id="Cname" class="form-control"
										value="${lcc.busyo_name }" readonly="true"
										style="width: 250px; height: auto; left: 10px;">
								</c:if>
							</c:forEach></td>
					</tr>
					<tr class="form-group">
						<td class="text-center warning" for="busyo_syou_code"
							style="width: 100px; height: auto; text-align: right;">小分類</td>
						<td colspan="2" style="width: 200px;"><select
							class="form-control form-control-sm" name="busyo_syou_code"
							id="Scodeinput" style="width: 200px; height: auto; left: 10px;">
								<option value="99">小分類コード</option>
								<c:forEach var="lccc" items="${listsyoucode}">
									<option value="${lccc.busyo_syou_code }">${lccc.busyo_syou_code }:${lccc.busyo_name }</option>
								</c:forEach>
						</select></td>
					</tr>
				</table>
				<div class="text-right" style="position: relative;">
					<input class="btn btn-primary" type="button" value="送信"
						onclick="setParentText()" style="width: 90px; height: 30px;">
					<input class="btn btn-danger" type="button" value="キャンセル"
						onclick="window.close()" style="width: 90px; height: 30px;">
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