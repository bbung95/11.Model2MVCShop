<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title><c:if test="${menu == 'manage' }">
			상품관리
		</c:if> <c:if test="${ menu == 'search' }">
			상품검색
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
	//menu 변수
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

			//alert("실행");
			if (!confirm("상품을 배송하시겠습니까.")) {
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
						displayValue = "배송중";
					}

					select.parent('td').html(displayValue);
				}

			});

		});

		$('button:contains("검색")').on('click', function() {

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
				상품관리
			</c:if>
				<c:if test="${menu == 'search' }">
				상품검색
			</c:if>
			</h3>
		</div>

		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-default">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">
					<input type="hidden" name="order" id="order"
						value="${search.order}" />

					<div class="form-group">
						<select name="searchCondition" class="form-control"
							style="width: 110px">
							<option value="0"
								${! empty search.searchCondition && search.searchCondition== 0 ? "selected" : ""  }>상품번호</option>
							<option value="1"
								${! empty search.searchCondition && search.searchCondition== 1 ? "selected" : ""  }>상품명</option>
							<option value="2"
								${! empty search.searchCondition && search.searchCondition== 2 ? "selected" : ""  }>상품가격</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="검색어"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="btn btn-default">검색</button>

					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />
					<input type="hidden" name="menu" value="${ menu}" />
			</div>

		</div>
		<div align="right">
			<select onchange="javascript:fncSetOrder(this)">
				<option value="reg_date"
					${search.order == 'reg_date' ? "selected" : ""}>최신순</option>
				<option value="price" ${search.order == 'price' ? "selected" : ""}>가격순</option>
			</select>판매중만 표시 <input onclick="javascript:fncGetList('1')" type="checkbox"
				name="display" value="on" ${search.display == 'on' ? "checked" : ""}></input>
		</div>
		</form>

		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">상품</th>
					<th align="left">가격</th>
					<th align="left">등록</th>
					<th align="left">현재상태</th>
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
		 							판매중
		 							</c:when>
										<c:otherwise>
		 							재고없음
		 							</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:if test="${product.proTranCode == null}">
						 					판매중
		 							</c:if>
									<c:if
										test="${product.proTranCode == '1  ' || product.proTranCode == '1'}">
		 									구매완료
		 								<c:if test="${menu == 'manage'}">
											<span>배송하기<input type="hidden"
												value="${product.prodNo}" /></span>
										</c:if>
									</c:if>
									<c:if
										test="${product.proTranCode == '2  ' || product.proTranCode == '2'}">
		 								배송중
		 							</c:if>
									<c:if
										test="${product.proTranCode == '3  ' || product.proTranCode == '3'}">
		 								배송완료
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
