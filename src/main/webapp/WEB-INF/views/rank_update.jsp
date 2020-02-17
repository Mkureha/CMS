<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部署情報修正</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>部署情報修正</h2>
	</div>

	<div class="container">
		<form action="/rank/updateProc" method="post">
			<div class="form-group">
				<label for="rank_code" style="width: 500px; padding: 15px;">部署コード(大分類+中分類+小分類)
				</label> <input type="text" class="form-control" id="rank_code"
					name="rank_code" value="${detail.rank_code }">
			</div>
			<div class="form-group">
				<label for="busyo_dai_code" style="width: 500px; padding: 15px;">大分類コード<br>(01:経営支援部
					/ 02:SI事業部)
				</label> <input type="text" class="form-control" id="busyo_dai_code"
					name="busyo_dai_code" value="${detail.busyo_dai_code }">
			</div>
			<div class="form-group">
				<label for="busyo_cyu_code" style="width: 500px; padding: 15px;">中分類コード<br>(01:第1グループ
					/ 02:第2グループ / 大分類 = 01 → 00:なし)
				</label> <input type="text" class="form-control" id="busyo_cyu_code"
					name="busyo_cyu_code" value="${detail.busyo_cyu_code }">
			</div>
			<div class="form-group">
				<label for="busyo_syou_code" style="width: 500px; padding: 15px;">小分類コード<br>(中分類
					= 00 → 01:経営支援チーム / 02:技術支援チーム )<br>(中分類 = 01 → 01:第1開発ユニット /
					02:第2開発ユニット / 03:第3開発ユニット / 04:第4開発ユニット)
				</label> <input type="text" class="form-control" id="busyo_syou_code"
					name="busyo_syou_code" value="${detail.busyo_syou_code }">
			</div>
			<div class="form-group">
				<label for="busyo_name">部署名</label> <input type="text"
					class="form-control" id="busyo_name" name="busyo_name"
					value="${detail.busyo_name }">
			</div>
			<div class="form-group">
				<label for="busyo_name_small">部署省略名</label> <input type="text"
					class="form-control" id="busyo_name_small" name="busyo_name_small"
					value="${detail.busyo_name_small }">
			</div>
			<div class="form-group">
				<label for="busyo_start">部署開始日</label> <input type="text"
					class="form-control" id="busyo_start" name="busyo_start"
					value="${detail.busyo_start }">
			</div>
			<div class="form-group">
				<label for="busyo_end">部署終了日</label> <input type="text"
					class="form-control" id="busyo_end" name="busyo_end"
					value="${detail.busyo_end }">
			</div>
			<button type="submit" class="btn btn-primary">修正</button>
			<input type="button" value="戻る" class="btn btn-primary"
				OnClick="javascript:history.back(-1)">
			<%@ include file="bootstrap.jsp"%>
</body>
</html>