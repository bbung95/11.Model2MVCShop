<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>�������� ����</title>
<!--   jQuery , Bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js">
	
</script>
<script>
	function fncUpdatePurchase() {

		let name = $('input[name="receiverName"]').val();
		let phone = $('input[name="receiverPhone"]').val();
		let addr = $('input[name="divyAddr"]').val();

		if (name == null || name.length < 1) {
			alert("�����ڸ��� �Է����ּ���.")
			return;
		}
		if (phone == null || phone.length < 1) {
			alert("��ȣ�� �Է����ּ���.");
			return;
		}
		if (addr == null || addr.length < 1) {
			alert("�ּҸ� �Է����ּ���.");
			return;
		}

		$('form').attr('method', 'POST').attr('action',
				'/purchase/updatePurchase').submit();
	}
</script>

</head>

<body bgcolor="#ffffff" text="#000000">
	<jsp:include page="/layout/toolbar.jsp" />

	<form>

		<input type="hidden" name="tranNo" value="${purchase.tranNo}" />
		<table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37" /></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">������������</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table>

		<table width="600" border="0" cellspacing="0" cellpadding="0"
			align="center" style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">�����ھ��̵�</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">user01</td>
				<input type="hidden" name="buyerId" value="${purchase.buyer.userId}">
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">���Ź��</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><select name="paymentOption"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20">
						<option value="1" selected="selected">���ݱ���</option>
						<option value="2">�ſ뱸��</option>
				</select></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">�������̸�</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="receiverName"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" value="${purchase.receiverName}" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">������ ����ó</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="receiverPhone"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" value="${purchase.receiverPhone}" /></td>
			</tr>

			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">�������ּ�</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="divyAddr"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" value="${purchase.divyAddr}" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">���ſ�û����</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="divyRequest"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="20" value="${purchase.divyRequest}" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">����������</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td width="200" class="ct_write01"><input type="text"
					readonly="readonly" name="divyDate" class="ct_input_g"
					style="width: 100px; height: 19px" maxLength="20" /> <img
					src="../images/ct_icon_date.gif" width="15" height="15"
					onclick="show_calendar('document.updatePurchase.divyDate', document.updatePurchase.divyDate.value)" />
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;"><a
								href="javascript:fncUpdatePurchase();">����</a></td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
							<td width="30"></td>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;"><a
								href="javascript:history.go(-1)">���</a></td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>