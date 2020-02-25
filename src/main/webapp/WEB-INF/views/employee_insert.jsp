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
<title>社員登録</title>
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
				href="/employee?pagenum=1&contentnum=10&searchtype=employee_code&keyword=">社員一覧</a></li>
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
					<h3 style="padding: 0; margin: 0; margin-bottom: 10px;">部署登録</h3>
					<ol class="breadcrumb">
						<li><a href="/index">ホーム</a></li>
						<li><a
							href="/employee?pagenum=1&contentnum=10&searchtype=employee_no&keyword=">社員一覧</a></li>
						<li class="active">社員登録</li>
					</ol>
					<div>
						<h5 class="pull-right"
							style="padding: 0; margin: 0; margin-bottom: 10px; 　color: red; font-weight: bold; color: red;">
							* ここから部署コードを変わると、 *<br>ページがやり直しますのでご注意ください
						</h5>
						<form role="form" action="/employee/insertProc" method="post"
							enctype="multipart/form-data" autocomplete="off">
							<table class="table table-bordered table-condensed"
								style="margin-top: 35px;">
								<tr class="form-group">
									<td class="text-center warning" for="employee_no"
										style="width: 250px; height: auto; text-align: right; font-weight: bold; color: red;">*
										社員番号</td>
									<td style="width: 1000px;"><input type="text"
										class="form-control" id="employee_no" name="employee_no"
										placeholder="1桁のアルファベット+3桁の連番"
										style="width: 150px; height: auto; left: 10px;" /></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="employee_name"
										style="width: 250px; height: auto; text-align: right;">社員名</td>
									<td style="width: 1000px;"><input type="text"
										class="form-control" id="employee_name" name="employee_name"
										placeholder="社員名"
										style="width: 200px; height: auto; left: 10px;" /></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_dai_code"
										style="width: 250px; height: auto; text-align: right; font-weight: bold; color: red;">*
										部署コード(大)</td>
									<td style="width: 1000px;"><select
										class="form-control form-control-sm" name="busyo_dai_code"
										id="busyo_dai_code"
										style="width: 150px; height: auto; left: 10px;">
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
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_cyu_code"
										style="width: 250px; height: auto; text-align: right; font-weight: bold; color: red;">*
										部署コード(中)</td>
									<td style="width: 1000px;"><select
										class="form-control form-control-sm" name="busyo_cyu_code"
										id="busyo_cyu_code"
										style="width: 150px; height: auto; left: 10px;">
											<c:forEach var="lcc" items="${listcyucode}">
												<c:if test="${lcc.busyo_cyu_code eq busyo_cyu_code}">
													<option value="${lcc.busyo_cyu_code}" selected="selected">
														${lcc.busyo_cyu_code }:${lcc.busyo_name }</option>
												</c:if>
												<c:if test="${lcc.busyo_cyu_code ne busyo_cyu_code}">
													<option value="${lcc.busyo_cyu_code}">
														${lcc.busyo_cyu_code }:${lcc.busyo_name }</option>
												</c:if>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="busyo_syou_code"
										style="width: 250px; height: auto; text-align: right; font-weight: bold; color: red;">*
										部署コード(中)</td>
									<td style="width: 1000px;"><select
										class="form-control form-control-sm" name="busyo_syou_code"
										id="busyo_syou_code"
										style="width: 150px; height: auto; left: 10px;">
											<c:forEach var="lccc" items="${listsyoucode}">
												<c:if test="${lccc.busyo_syou_code eq busyo_syou_code}">
													<option value="${lccc.busyo_syou_code}" selected="selected">
														${lccc.busyo_syou_code }:${lccc.busyo_name }</option>
												</c:if>
												<c:if test="${lccc.busyo_syou_code ne busyo_syou_code}">
													<option value="${lccc.busyo_syou_code}">
														${lccc.busyo_syou_code }:${lccc.busyo_name }</option>
												</c:if>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="position_code"
										style="width: 250px; height: auto; text-align: right; font-weight: bold; color: red;">*
										職責コード</td>
									<td style="width: 1000px;"><select
										class="form-control form-control-sm" name="position_code"
										id="position_code"
										style="width: 150px; height: auto; left: 10px;">
											<option value="99">職責コード</option>
											<c:forEach var="lp" items="${listposition}">
												<option value="${lp.position_code }">${lp.position_code }:${lp.position_name }</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="type_code"
										style="width: 250px; height: auto; text-align: right; font-weight: bold; color: red;">*
										役職コード</td>
									<td style="width: 1000px;"><select
										class="form-control form-control-sm" name="type_code"
										id="type_code" style="width: 150px; height: auto; left: 10px;">
											<option value="99">役職コード</option>
											<c:forEach var="ltp" items="${listtype}">
												<option value="${ltp.type_code }">${ltp.type_code }:${ltp.type_name }</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="gender"
										style="width: 250px; height: auto; text-align: right;">性別</td>
									<td style="width: 1000px;"><select
										class="form-control form-control-sm" name="gender" id="gender"
										style="width: 100px; height: auto; left: 10px;">
											<option value="無">性別</option>
											<option value="男">男性</option>
											<option value="女">女性</option>
									</select></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="birthday"
										style="width: 250px; height: auto; text-align: right;">生年月日</td>
									<td style="width: 1000px; position: relative"><input
										type="text" class="form-control" id="birthday_date"
										name="birthday" size="8" title="生年月日"
										style="width: 200px; height: auto; cursor: pointer; left: 10px;"></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="postal_code"
										style="width: 250px; height: auto; text-align: right;">郵便番号</td>
									<td style="width: 1000px;"><input type="text"
										class="form-control" id="postal_code" name="postal_code"
										placeholder="郵便番号(-無しで)"
										style="width: 150px; height: auto; left: 10px;" /></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="address_1"
										style="width: 250px; height: auto; text-align: right;">詳細住所1</td>
									<td style="width: 1000px;"><input type="text"
										class="form-control" id="address_1" name="address_1"
										placeholder="詳細住所1"
										style="width: 500px; height: auto; left: 10px;" /></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="address_2"
										style="width: 250px; height: auto; text-align: right;">詳細住所2</td>
									<td style="width: 1000px;"><input type="text"
										class="form-control" id="address_2" name="address_2"
										placeholder="詳細住所2"
										style="width: 500px; height: auto; left: 10px;" /></td>
								</tr>
								<tr class="form-group">
									<td class="text-center warning" for="employee_memo"
										style="width: 250px; height: auto; text-align: right;">備考</td>
									<td style="width: 1000px;"><input type="text"
										class="form-control" id="employee_memo" name="employee_memo"
										placeholder="備考"
										style="width: 400px; height: 300px; left: 10px;" /></td>
								</tr>
							</table>
							<div class="text-right" style="position: relative;">
								<button type="submit" class="btn btn-warning"
									style="width: 70px; height: 30px;">登録</button>
								<a type="button" class="btn btn-primary"
									href="javascript:history.back(-1)"
									style="width: 70px; height: 30px;">戻る</a>
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

body, div {
	font-family: 'メイリオ', Meiryo, 'ヒラギノ角ゴ Pro W3', 'Hiragino Kaku Gothic Pro',
		'ＭＳ Ｐゴシック', sans-serif;
}
</style>

	<script type="text/javascript">
		//大分類イベント
		$(document)
				.ready(
						function() {
							$('#busyo_dai_code')
									.on(
											'change',
											function() {
												var daicodeVal = $(
														'#busyo_dai_code')
														.val();
												if (daicodeVal > 0) {
													location.href = "http://localhost:8080/employee/insert/"
															+ daicodeVal;
												} else {
													alert("大分類を選択してください！")
													$("#busyo_dai_code")
															.focus();
												}
											});
						});

		//中分類イベント
		$(document)
				.ready(
						function() {
							$('#busyo_cyu_code')
									.on(
											'change',
											function() {
												var cyucodeVal = $(
														'#busyo_cyu_code')
														.val();
												if (daicodeVal > 0) {
													location.href = "http://localhost:8080/employee/insert/"
															+ daicodeVal
															+ "/"
															+ cyucodeVal;
												} else {
													alert("中分類を選択してください！")
													$("#busyo_cyu_code")
															.focus();
												}
											});
						});
		//小分類イベント
		$(document)
				.ready(
						function() {
							$('#busyo_syou_code')
									.on(
											'change',
											function() {
												var syoucodeVal = $(
														'#busyo_syou_code')
														.val();
												if (daicodeVal > 0) {
													location.href = "http://localhost:8080/ranksyou/insert/"
															+ daicodeVal + "/"
													cyucodeVal + "/"
													syoucodeVal;
												} else {
													alert("小分類を選択してください！")
													$("#busyo_syou_code")
															.focus();
												}
											});
						});

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