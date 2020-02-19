<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Comapany Management System</title>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/index">ホーム</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a
						href="/employee?pagenum=1&contentnum=10&searchtype=employee_no&keyword=">社員一覧
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">部署一覧 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a
								href="/rankdai?pagenum=1&contentnum=10&searchtype=busyo_dai_code&keyword=">大分類一覧</a></li>
							<li><a
								href="/rankcyu?pagenum=1&contentnum=10&searchtype=busyo_cyu_code&keyword=">中分類一覧</a></li>
							<li><a
								href="/rank?pagenum=1&contentnum=10&searchtype=busyo_syou_code&keyword=">小分類一覧</a></li>
						</ul></li>
					<li><a
						href="/position?pagenum=1&contentnum=10&searchtype=position_code&keyword=">職責一覧</a></li>
					<li><a
						href="/type?pagenum=1&contentnum=10&searchtype=type_code&keyword=">役職一覧</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<div class="text-center" style="float: none; margin: 0 auto;">
		<h2>COMPANY MANAGEMENT SYSTEM</h2>
	</div>

	<div class="text-center" style="float: none; margin: 0 auto;">
		<h1>
			ここはメインページでございます。<br> <br> 上のメニューを選択してください
		</h1>
	</div>

	<style>
body, div {
	font-family: 'メイリオ', Meiryo, 'ヒラギノ角ゴ Pro W3', 'Hiragino Kaku Gothic Pro',
		'ＭＳ Ｐゴシック', sans-serif;
}

body, a {
	padding: 20px;
}
</style>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>