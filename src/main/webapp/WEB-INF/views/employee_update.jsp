<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>情報修正</title>
</head>
<body style="padding-top: 60px;">
	<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="/index"
			style="font-size: 14px; font-weight: bold; color: white; height: 40px;">COMPANY
			MANAGEMENT SYSTEM</a>
		<button type="button" class="navbar-toggle" data-toggle="offcanvas"
			data-target=".navbar-offcanvas" data-canvas="body">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
	</div>
	<div id="ie8_navbar" class="navbar-collapse collapse">
		<ul class="nav navbar-nav">
			<li class="active"><a style="color: white;"
				href="/employee?pagenum=1&contentnum=10&searchtype=employee_no&keyword=">社員一覧</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">部署 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a
						href="/rankdai?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">大分類一覧</a></li>
					<li><a
						href="/rankcyu?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">中分類一覧</a></li>
					<li><a
						href="/ranksyou?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">小分類一覧</a></li>
				</ul></li>
			<li><a style="color: white;"
				href="/position?pagenum=1&contentnum=10&searchtype=position_code&keyword=">職責一覧</a></li>
			<li><a style="color: white;"
				href="/type?pagenum=1&contentnum=10&searchtype=type_code&keyword=">役職一覧</a></li>
		</ul>
	</div>
	</nav>

	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-sm-2">
				<ul class="nav nav-pills nav-stacked" style="margin-bottom: 20px;">
					<li role="presentation" class="active"><a
						href="/employee?pagenum=1&contentnum=10&searchtype=employee_no&keyword=">社員一覧</a></li>
				</ul>
			</div>
			<div class="col-sm-10">
				<div class="pull-left">
					<h3 style="padding: 0; margin: 0; margin-bottom: 10px;">情報修正</h3>
					<ol class="breadcrumb">
						<li><a href="/index">ホーム</a></li>
						<li><a
							href="/employee?pagenum=1&contentnum=10&searchtype=employee_no&keyword=">社員一覧</a></li>
						<li class="active">情報修正</li>
					</ol>
					<div>
						<h5 class="pull-left"
							style="padding: 0; margin: 0; margin-bottom: 10px;">基本情報</h5>
						<form action="/employee/updateProc" method="post"
							autocomplete="off">
							<table class="table table-bordered table-condensed"
								style="margin-top: 35px;">
								<tr class="form-group">
									<td class="text-center warning" for="employee_no"
										style="width: 300px; height: auto; text-align: right; font-weight: bold; color: red;">*
										社員番号</td>
									<td colspan="3" style="width: 750px;"><input type="text"
										class="form-control" id="employee_no" name="employee_no"
										value="${detail.employee_no }"
										style="width: 150px; height: auto; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="employee_name"
										style="width: 300px; height: auto; text-align: right; font-weight: bold; color: red;">*
										社員名</td>
									<td colspan="3" style="width: 750px;"><input type="text"
										class="form-control" id="employee_name" name="employee_name"
										value="${detail.employee_name }"
										style="width: 200px; height: auto; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td rowspan="3" class="text-center warning"
										for="busyo_dai_code"
										style="width: 300px; height: auto; text-align: right; font-weight: bold; color: red;">*
										部署コード</td>
									<td style="width: 150px;"><input type="text"
										class="form-control" id="busyo_dai_code" name="busyo_dai_code"
										value="${detail.busyo_dai_code }" readonly="true"
										style="width: 150px; height: auto; left: 10px;" /></td>
									<td rowspan="3" style="width: 450px; vertical-align: middle;"><input
										type="text" class="form-control" id="busyo_name"
										name="busyo_name" value="${detail.busyo_name }"
										readonly="true"
										style="width: 430px; height: auto; left: 10px;" /></td>
									<td rowspan="3"
										style="width: 100px; vertical-align: middle; text-align-last: center;"><input
										type="button" class="btn btn-danger" value="分類変更"
										onclick="openchild()"
										style="width: 80px; height: 50px; left: 10px"></td>
								</tr>
								<tr class="form-group">
									<td style="width: 150px;"><input type="text"
										class="form-control" id="busyo_cyu_code" name="busyo_cyu_code"
										value="${detail.busyo_cyu_code }" readonly="true"
										style="width: 150px; height: auto; left: 10px;" /></td>
								</tr>
								<tr class="form-group">
									<td style="width: 150px;"><input type="text"
										class="form-control" id="busyo_syou_code"
										name="busyo_syou_code" value="${detail.busyo_syou_code }"
										readonly="true"
										style="width: 150px; height: auto; left: 10px;" /></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="position_code"
										style="width: 300px; height: auto; text-align: right; font-weight: bold; color: red;">*
										職責コード</td>
									<td colspan="3" style="width: 750px;"><select
										class="form-control form-control-sm" name="position_code"
										id="position_code"
										style="width: 150px; height: auto; left: 10px;">
											<c:forEach var="lp" items="${listposition}">
												<c:if test="${detail.position_code eq lp.position_code}">
													<option value="${lp.position_code}" selected="selected">
														${lp.position_code }:${lp.position_name }</option>
												</c:if>
												<c:if test="${detail.position_code ne lp.position_code}">
													<option value="${lc.position_code}">
														${lp.position_code }:${lp.position_name }</option>
												</c:if>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="type_code"
										style="width: 300px; height: auto; text-align: right; font-weight: bold; color: red;">*
										役職コード</td>
									<td colspan="3" style="width: 750px;"><select
										class="form-control form-control-sm" name="type_code"
										id="type_code" style="width: 150px; height: auto; left: 10px;">
											<c:forEach var="ltp" items="${listtype}">
												<c:if test="${detail.type_code eq ltp.type_code}">
													<option value="${ltp.type_code}" selected="selected">
														${ltp.type_code }:${ltp.type_name }</option>
												</c:if>
												<c:if test="${detail.type_code ne ltp.type_code}">
													<option value="${lc.type_code}">${ltp.type_code }:${ltp.type_name }</option>
												</c:if>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="gender"
										style="width: 300px; height: auto; text-align: right; font-weight: bold; color: red;">*
										性別</td>
									<td colspan="3" style="width: 750px;"><select
										class="form-control form-control-sm" name="gender" id="gender"
										style="width: 150px; height: auto; left: 10px;">
											<c:if test="${detail.gender eq 男}">
												<option value="男" selected="selected">男</option>
												<option value="女">女</option>
											</c:if>
											<c:if test="${detail.gender ne 女}">
												<option value="男">男</option>
												<option value="女" selected="selected">女</option>
											</c:if>
									</select></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="birthday"
										style="width: 300px; height: auto; text-align: right; font-weight: bold; color: red;">*
										生年月日</td>
									<td colspan="3" style="width: 750px; position: relative"><input
										type="text" class="form-control" id="birthday_date"
										name="birthday" size="8" value="${detail.birthday }"
										style="width: 200px; height: auto; cursor: pointer; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="postal_code"
										style="width: 300px; height: auto; text-align: right; font-weight: bold; color: red;">*
										郵便番号</td>
									<td colspan="3" style="width: 750px;"><input type="text"
										class="form-control" id="postal_code" name="postal_code"
										value="${detail.postal_code }"
										style="width: 150px; height: auto; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="address_1"
										style="width: 300px; height: auto; text-align: right;">詳細住所1</td>
									<td colspan="3" style="width: 750px;"><input type="text"
										class="form-control" id="address_1" name="address_1" size="8"
										value="${detail.address_1 }"
										style="width: 500px; height: auto; left: 10px;" /></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="address_2"
										style="width: 300px; height: auto; text-align: right;">詳細住所2</td>
									<td colspan="3" style="width: 750px;"><input type="text"
										class="form-control" id="address_2" name="address_2" size="8"
										value="${detail.address_2 }"
										style="width: 500px; height: auto; left: 10px;" /></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="employee_memo"
										style="width: 300px; height: auto; text-align: right;">備考</td>
									<td colspan="3" style="width: 750px;"><input type="text"
										class="form-control" id="employee_memo" name="employee_memo"
										size="8" value="${detail.employee_memo }"
										style="width: 400px; height: 300px; left: 10px;" /></td>
								</tr>
							</table>
							<div class="text-right" style="position: relative;">
								<input type="button" value="削除" class="btn btn-danger"
									OnClick="location.href='/employee/delete/${detail.busyo_dai_code}/${detail.busyo_cyu_code}/${detail.employee_no}'">
								<button type="submit" class="btn btn-warning" id="subend">修正</button>
								<input type="button" value="戻る" class="btn btn-primary"
									OnClick="javascript:history.back(-1)">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<style>
.ui-datepicker-trigger {
	position: absolute;
	top: 13px;
	left: 180px;
}

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

	<script type="text/javascript">
	//Form検査
	$(document).ready(
			function() {
				$("#subend").click(
						function() {
							if ($("#employee_no").val() == "") {
								alert("社員番号が無いです！");
							} else if ($("#employee_name").val() == "") {
								alert("社員名が無いです！");
							} else if ($("#busyo_name").val() == "") {
								alert("部署が無いです！");
							} else if ($("#position_code").val() == "99") {
								alert("職責が無いです！");
							} else if ($("#type_code").val() == "99") {
								alert("役職が無いです！");
							} else if ($("#gender").val() == "無") {
								alert("性別が無いです！");
							} else if ($("#birthday").val() == "") {
								alert("誕生日が無いです！");
							} else if ($("#postal_code").val() == "") {
								alert("郵便番号が無いです！");
							} else {
								$("#subend").attr("action",
										"<c:url value='/employee/updateProc'/>");
								$("#subend").submit();
							}
						});
			});
		//popupイベント
		function openchild() {
			window.open('child', '分類',
					'width=750, height=450, resizeable=no, left=10 top=10');
		}
		//日付設定(start)
		$("#birthday_date")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd',
							changeYear : true,
							changeMonth : true,
							showOn : "both",
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
							buttonImageOnly : true
						});
		//文字数制限
		//postal_code제한
		$(document).ready(function() {
			$('#postal_code').on('keyup', function() {
				if ($(this).val().length > 7) {
					alert("文字数制限を超えました!(制限:7桁の連番)");
					$(this).val($(this).val().substring(0, 7));
				}
			});
		});

		//文字数制限
		//employee_no제한
		$(document).ready(function() {
			$('#employee_no').on('keyup', function() {
				if ($(this).val().length > 4) {
					alert("文字数制限を超えました!(制限:4桁の連番)");
					$(this).val($(this).val().substring(0, 4));
				}
			});
		});
	</script>

	<%@ include file="bootstrap.jsp"%>
</body>
</html>