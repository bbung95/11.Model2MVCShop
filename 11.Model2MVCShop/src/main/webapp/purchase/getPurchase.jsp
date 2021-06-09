<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>구매상세조회</title>

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
		
		$('button:contains("수 정")').on('click', function(){
			
			let tranNo = $(this).next().val();
			location.href = "/purchase/updatePurchase?tranNo="+tranNo;
		})
		
		$('button:contains("목 록")').on('click', function(){
			
			location.href = "/purchase/listPurchase";
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
			<h3 class=" text-default">구매상세조회</h3>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>상품번호</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>구매자아이디</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>구매방법</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<c:if test="${purchase.paymentOption == '1  ' }">
				현금구매
			</c:if>
				<c:if test="${purchase.paymentOption == '2  ' }">
				신용구매
			</c:if>
			</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>구매자이름</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>구매자연락처</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>구매자주소</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>구매요청사항</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>
		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>배송희망일</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>
		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>주문일</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-md-12 text-right ">
				<c:if test="${ sessionScope.user.role == 'user' && purchase.tranCode == '1  '}">
					<button type="button" class="btn btn-default">수 정</button>
					<input type="hidden" value="${purchase.tranNo}" />
				</c:if>
				<button type="button" class="btn btn-default">목 록</button>
			</div>
		</div>

		<br />

	</div>
</body>
</html>