<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title><c:if test="${menu == 'manage' }">
			��ǰ����
		</c:if> <c:if test="${ menu == 'search' }">
			��ǰ�˻�
	</c:if></title>

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
	//menu ����
	let menu = "<c:out value='${menu}' />";

	function fncGetList(currentPage) {

		$('#currentPage').val(currentPage);
		$('form').attr('method', 'POST').attr('action', '/product/listProduct')
				.submit();
	}

	function fncSetOrder(order) {

		$('#order').val(order.value);
		fncGetList('1');
	}

	$(function() {

		$('tbody td:nth-child(2)').on(
				'click',
				function() {

					let prodNo = $(this).children('input').val();
					location.href = "/product/getProduct?prodNo=" + prodNo
							+ "&menu=" + menu;
				});

		$('tbody td:nth-child(5) span').on('click', function() {

			//alert("����");
			if (!confirm("��ǰ�� ����Ͻðڽ��ϱ�.")) {
				return;
			}
			let select = $(this);
			let prodNo = select.children('input').val();

			$.ajax({
				url : "/purchase/json/updateTranCodeByProd/" + prodNo + "/2",
				method : "GET",
				dataType : "text",
				success : function(serverData, status) {

					//alert(status);

					//alert("ServerData : "+serverData);

					let displayValue = "";
					if (serverData == "2") {
						displayValue = "�����";
					}

					select.parent('td').html(displayValue);
				}

			});

		});

		$('button:contains("�˻�")').on('click', function() {

			fncGetList('1');
		})
	});
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
			<h3>
				<c:if test="${menu == 'manage' }">
				��ǰ����
			</c:if>
				<c:if test="${menu == 'search' }">
				��ǰ�˻�
			</c:if>
			</h3>
		</div>

		<!-- table ���� �˻� Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-default">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">
					<input type="hidden" name="order" id="order"
						value="${search.order}" />

					<div class="form-group">
						<select name="searchCondition" class="form-control"
							style="width: 110px">
							<option value="0"
								${! empty search.searchCondition && search.searchCondition== 0 ? "selected" : ""  }>��ǰ��ȣ</option>
							<option value="1"
								${! empty search.searchCondition && search.searchCondition== 1 ? "selected" : ""  }>��ǰ��</option>
							<option value="2"
								${! empty search.searchCondition && search.searchCondition== 2 ? "selected" : ""  }>��ǰ����</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">�˻���</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="�˻���"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="btn btn-default">�˻�</button>

					<!-- PageNavigation ���� ������ ���� ������ �κ� -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />
					<input type="hidden" name="menu" value="${ menu}" />
			</div>

		</div>
		<div align="right">
			<select onchange="javascript:fncSetOrder(this)">
				<option value="reg_date"
					${search.order == 'reg_date' ? "selected" : ""}>�ֽż�</option>
				<option value="price" ${search.order == 'price' ? "selected" : ""}>���ݼ�</option>
			</select>�Ǹ��߸� ǥ�� <input onclick="javascript:fncGetList('1')" type="checkbox"
				name="display" value="on" ${search.display == 'on' ? "checked" : ""}></input>
		</div>
		</form>

		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">��ǰ</th>
					<th align="left">����</th>
					<th align="left">���</th>
					<th align="left">�������</th>
				</tr>
			</thead>

			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="product" items="${ list }">
					<c:set var="i" value="${ i+1 }" />
					<tr>
						<td align="center">${ i }</td>
						<td align="left" value="${product.prodNo}">${product.prodName}<input
							type="hidden" name="prodNo" value="${product.prodNo}" />
						</td>
						<td align="left">${product.price }</td>

						<td align="left">${product.regDate}</td>
						<td align="left"><c:choose>
								<c:when test="${ menu == 'search'}">
									<c:choose>
										<c:when test="${product.proTranCode == null}">
		 							�Ǹ���
		 							</c:when>
										<c:otherwise>
		 							������
		 							</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:if test="${product.proTranCode == null}">
						 					�Ǹ���
		 							</c:if>
									<c:if
										test="${product.proTranCode == '1  ' || product.proTranCode == '1'}">
		 									���ſϷ�
		 								<c:if test="${menu == 'manage'}">
											<span>����ϱ�<input type="hidden"
												value="${product.prodNo}" /></span>
										</c:if>
									</c:if>
									<c:if
										test="${product.proTranCode == '2  ' || product.proTranCode == '2'}">
		 								�����
		 							</c:if>
									<c:if
										test="${product.proTranCode == '3  ' || product.proTranCode == '3'}">
		 								��ۿϷ�
		 							</c:if>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!--  table End /////////////////////////////////////-->
		<jsp:include page="/common/pageNavigator.jsp" />
	</div>
</body>
</html>
