<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
<title>상품등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--   jQuery , Bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script>

	$(function(){
		
		$('button:contains("목록")').on('click',function(){
			
			location.href= "/product/listProduct?menu=manage";
		})
	})
</script>
<style>
body{
	padding-top: 30px;
}
</style>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">

		<div class="page-header">
			<h3 class=" text-default">상품등록</h3>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>상품명</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>상품이미지</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<c:set var="file" value="${product.fileName }" />
				<c:forEach var="fileName" items="${fn:split(file, '/')}">
					<img src="/images/uploadFiles/${fileName}" width="400" height="400" />
					<div style="height: 5px;"></div>
				</c:forEach>
			</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>상품상세정보</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>제조일자</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>가격</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>등록일자</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-md-12 text-right ">
				<button type="button" class="btn btn-default">목록</button>
			</div>
		</div>

		<br />

	</div>

</body>
</html>