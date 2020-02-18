<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<title>部署リスト</title>
</head>
<body>
	<div class="container centered text-center">
		<h2>部署リスト</h2>
	</div>
	<button class="btn btn-danger" onclick="location.href='/index'">メニュー</button>
	<button class="btn btn-warning"
		onclick="location.href='/rankdai/insert'">部署(大分類)登録</button>
	<button class="btn btn-warning"
		onclick="location.href='/rank/insertcyu'">部署(中分類)登録</button>
	<button class="btn btn-warning"
		onclick="location.href='/rank/insertsyou'">部署(小分類)登録</button>
	<br>

	<div class="container">
		<table class="table table-striped" style="width: 900px;">
			<thead>
				<tr>
					<th scope="col">部署コード</th>
					<th scope="col">大分類コード</th>
					<th scope="col">中分類コード</th>
					<th scope="col">小分類コード</th>
					<th scope="col">部署名</th>
					<th scope="col">部署省略名</th>
					<th scope="col">部署開始日</th>
					<th scope="col">部署終了日</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cpn" items="${list}">
					<tr>
						<td scope="row"><a
							href="/rank/detail/${cpn.busyo_dai_code}${cpn.busyo_cyu_code}${cpn.busyo_syou_code}/${cpn.busyo_start}">${cpn.busyo_dai_code}${cpn.busyo_cyu_code}${cpn.busyo_syou_code}</a></td>
						<td>${cpn.busyo_dai_code}</td>
						<td>${cpn.busyo_cyu_code}</td>
						<td>${cpn.busyo_syou_code}</td>
						<td>${cpn.busyo_name}</td>
						<td>${cpn.busyo_name_small}</td>
						<td>${cpn.busyo_start}</td>
						<td>${cpn.busyo_end}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item ">
						<td colspan="2"><c:if test="${page.prev}">
								<a style="text-decoration: none;"
									href="javascript:page(${page.getstartpage()-1});">&laquo;</a>
							</c:if> <c:forEach begin="${page.getstartpage()}"
								end="${page.getendpage()}" var="idx">
								<a style="text-decoration: none;"
									href="javascript:page(${idx});">${idx}</a>
							</c:forEach> <c:if test="${page.next}">
								<a style="text-decoration: none;"
									href="javascript:page(${page.getendpage()+1});">&raquo;</a>
							</c:if></td>
						</li>
					</ul>
					</nav>
				</tr>
			</tfoot>
		</table>
	</div>
	<form class="form-inline" action="search" method="get">
		<div>
			<select class="form-control form-control-sm" name="searchtype"
				id="searchtype"
				style="width: 350px; height: 35px; margin-left: auto; margin-right: auto;">
				<option value="busyo_dai_code">大分類コード</option>
				<option value="busyo_cyu_code">中分類コード</option>
				<option value="busyo_syou_code">小分類コード</option>
				<option value="busyo_name">部署名</option>
				<option value="busyo_name_small">部署省略名</option>
				<option value="busyo_start">部署開始日</option>
				<option value="busyo_end">部署終了日</option>
			</select>
		</div>
		<div>
			<input type="text" class="form-control form-control-sm"
				name="keyword" id="keyword" placeholder="Keywordを入力してください"
				value="${page.keyword}" onkeyup="characterCheck()"
				onkeydown="characterCheck()"
				style="width: 400px; height: 35px; margin-left: auto; margin-right: auto;" />
		</div>
		<button type="button" class="btn btn-primary" name="btnSearch"
			id="btnSearch">検索</button>
	</form>

	<script type="text/javascript">
	
	<!-- Paging -->
	function page(idx) {
		var pagenum = idx;
		var contentnum = 10;
		var searchtype = $('#searchtype').val()
		var keyword = $('#keyword').val()
		var url = "${pageContext.request.contextPath}/rank?pagenum=" + pagenum + "&contentnum=" + contentnum;
		url = url + "&searchtype=" + searchtype;
		url = url + "&keyword=" + keyword;
		location.href = url;
		
	};
	
<!-- Search -->
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/rank?pagenum=1&contentnum=10";
		url = url + "&searchtype=" + $('#searchtype').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});	
	
<!-- Input Limit -->
function characterCheck() {
    var RegExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
    var obj = document.getElementsByName("keyword")[0]
    if (RegExp.test(obj.value)) {
        alert("特集文字は使うことができません。");
        obj.value = obj.value.substring(0, obj.value.length - 1);
    }
}
	
<!-- Hold Select Option(Searchtype) -->
var searchtype="${param.searchtype}";

$("#searchtype").val(searchtype);
</script>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>