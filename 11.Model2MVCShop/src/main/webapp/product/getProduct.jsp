<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
<title>��ǰ����ȸ</title>

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
		let prodNo = $('strong:contains("��ǰ��ȣ")').parent().next().text();

		$('button:contains("����")').on('click', function() {
			
			location.href = "/product/updateProduct?prodNo=" + prodNo;
		})

		$('button:contains("����")').on('click', function() {

			location.href = "/purchase/addPurchase?prodNo=" + prodNo;
		})
		
		$('button:contains("����")').on('click',function(){
			
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
			<h3 class=" text-default">��ǰ����ȸ</h3>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��ǰ��ȣ</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>��ǰ��</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>��ǰ�̹���</strong>
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
				<strong>��ǰ������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>����</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>�������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-md-12 text-right ">
				<c:if test="${menu == 'manage'}">
					<c:if test="${product.proTranCode == null}">
						<button type="button" class="btn btn-default">����</button>
					</c:if>
				</c:if>
				<c:if test="${menu == 'search' }">
					<c:if
						test="${!empty sessionScope.user && product.proTranCode == null }">
						<button type="button" class="btn btn-default">����</button>
					</c:if>
				</c:if>
				<button type="button" class="btn btn-default">����</button>
			</div>
		</div>

		<br />

	</div>
</body>
</html>