<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>판매내역</title>
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
<script type="text/javascript">
	function fncGetList(currentPage) {

		$('#currentPage').val(currentPage);
		$('form').submit();
	}

	$(function() {

		$('tbody td:nth-child(1)').on('click', function() {

			let tranNo = $(this).children('input').val();
			location.href = "/purchase/getPurchase?tranNo="+tranNo;
		});

		$('tbody td:nth-child(2)').on('click', function() {

			let userId = $(this).text().trim();
			location.href = "/user/getUser?userId=" + userId;
		})

		$('tbody td:nth-child(5)').on(
				'click',
				function() {

					let prodNo = $(this).children('input').val();
					location.href = "/product/getProduct?prodNo=" + prodNo
							+ "&menu=manage";
				});
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

		<div class="page-header text-default">
			<h3>판매내역</h3>
		</div>

		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-12 text-left">
				<p class="text-default">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">

					<input type="hidden" id="currentPage" name="currentPage" value="" />
				</form>
			</div>
		</div>

		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">회원ID</th>
					<th align="left">구매자이름</th>
					<th align="left">구매연락처</th>
					<th align="left">구매상품</th>
					<th align="left">주문일자</th>
				</tr>
			</thead>
			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list}">
					<c:set var="i" value="${i+1}" />
					<tr>
						<td align="center">${i}<input type="hidden"
							value="${purchase.tranNo}" /></td>
						<td align="left">${purchase.buyer.userId}</td>
						<td align="left">${purchase.receiverName}</td>
						<td align="left">${purchase.receiverPhone}</td>
						<td align="left">${purchase.purchaseProd.prodName}(${purchase.purchaseProd.prodNo})<input
							type="hidden" value="${purchase.purchaseProd.prodNo}" /></td>
						<td align="left">${purchase.orderDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!--  table End /////////////////////////////////////-->
		<jsp:include page="/common/pageNavigator.jsp" />
	</div>

</body>
</html>