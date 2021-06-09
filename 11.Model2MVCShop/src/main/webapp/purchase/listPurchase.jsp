<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>���� �����ȸ</title>

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
			location.href = "/purchase/getPurchase?tranNo=" + tranNo;
		})

		$('tbody td:nth-child(2)').on('click', function() {

			let prodNo = $(this).children('input').val();
			location.href = "/product/getProduct?prodNo=" + prodNo;
		})

		$('tbody td:nth-child(6) span').on('click', function() {

			let select = $(this);
			let tranNo = select.children('input').val();

			$.ajax({
				url : "/purchase/json/updateTranCode/" + tranNo + "/3",
				method : "GET",
				dataType : "text",
				success : function(serverData, status) {

					//alert(status);

					//alert("ServerData : " + serverData);

					let displayValue = "";
					if (serverData == "3") {
						displayValue = "���� ��ۿϷ� ���� �Դϴ�.";
					}

					select.parent("td").prev().html(displayValue);
					select.remove();
				}
			});
		});

	});
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

		<div class="page-header text-default">
			<h3>���� �����ȸ</h3>
		</div>

		<!-- table ���� �˻� Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-12 text-left">
				<p class="text-default">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
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
					<th align="left">��ǰ��</th>
					<th align="left">����</th>
					<th align="left">�ֹ�����</th>
					<th align="left">�����Ȳ</th>
					<th align="left">��������</th>
				</tr>
			</thead>
			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list}">
					<c:set var="i" value="${i+1}" />
					<tr>
						<td align="center">${i}<input type="hidden"
							value="${purchase.tranNo}" /></td>
						<td align="left">${purchase.purchaseProd.prodName}<input
							type="hidden" value="${purchase.purchaseProd.prodNo}" /></td>
						<td align="left">${purchase.purchaseProd.price}</td>
						<td align="left">${purchase.orderDate}</td>
						<td align="left"><c:if test="${ purchase.tranCode == '1  '}">
							���� ���ſϷ� ���� �Դϴ�.
						</c:if> <c:if test="${ purchase.tranCode == '2  '}">
							���� ����� ���� �Դϴ�.
						</c:if> <c:if test="${ purchase.tranCode == '3  '}">
							���� ��ۿϷ� ���� �Դϴ�.
						</c:if></td>
						<td align="left"><c:if test="${ purchase.tranCode == '2  '}">
								<span>���ǵ���<input type="hidden" value="${purchase.tranNo}" /></span>
							</c:if></td>
				</c:forEach>
			</tbody>
		</table>
		<!--  table End /////////////////////////////////////-->
		<jsp:include page="/common/pageNavigator.jsp" />
	</div>

</body>
</html>