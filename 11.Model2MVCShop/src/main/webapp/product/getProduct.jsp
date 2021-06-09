<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
<title>상품상세조회</title>

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
	$(function() {
		let prodNo = $('strong:contains("상품번호")').parent().next().text();

		$('button:contains("수정")').on('click', function() {
			
			location.href = "/product/updateProduct?prodNo=" + prodNo;
		})

		$('button:contains("구매")').on('click', function() {

			location.href = "/purchase/addPurchase?prodNo=" + prodNo;
		})
		
		$('button:contains("이전")').on('click',function(){
			
			history.go(-1);
		})
	})
</script>
<style>
body {
	padding-top: 30px;
}
</style>
</head>
<body>
	<jsp:include page="/layout/toolbar.jsp" />


	<div class="container">

		<div class="page-header">
			<h3 class=" text-default">상품상세조회</h3>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>상품번호</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>

		<hr />

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
				<c:if test="${menu == 'manage'}">
					<c:if test="${product.proTranCode == null}">
						<button type="button" class="btn btn-default">수정</button>
					</c:if>
				</c:if>
				<c:if test="${menu == 'search' }">
					<c:if
						test="${!empty sessionScope.user && product.proTranCode == null }">
						<button type="button" class="btn btn-default">구매</button>
					</c:if>
				</c:if>
				<button type="button" class="btn btn-default">이전</button>
			</div>
		</div>

		<br />

	</div>
</body>
</html>