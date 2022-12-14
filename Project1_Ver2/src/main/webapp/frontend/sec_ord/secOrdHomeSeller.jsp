<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.sec_ord_details.model.*"%>
<%@ page import="ezs.sec_ord.model.*"%>
<!DOCTYPE html>
<%
SecOrdService secOrdSvc = new SecOrdService();
Integer memID = (Integer) session.getAttribute("memID");
Set<SecOrdVO> listAllSecOrd = secOrdSvc.getSecOrdByShSellerID(memID);
%>

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>EASY SPACE</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/member.center.styles.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<link rel="stylesheet"
	href=" https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css ">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">

<style>
#nav {
	background-color: lightgrey;
	z-index: 9999;
	padding: 0px;
	height: 40px;
	width: 100%;
	position: fixed;
}
</style>
<style>
table#table-1 {
	background-color: #FFE8BF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 1000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #FFE8BF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>
<script src="https://kit.fontawesome.com/1c2ccc4859.js"
	crossorigin="anonymous"></script>

</head>
<body class="sb-nav-fixed">
	<!-- 上端導覽列開始--------------------------------------- -->
	<div class="navbar navbar-expand-lg navbar-dark" id="nav">
		<div class="container">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03"
				aria-controls="navbarTogglerDemo03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
				<ul class="navbar-nav ms-auto me-sm-2 mt-2 mt-lg-0">
					<li class="nav-item active me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/EZ_home.jsp">HOME PAGE </a></li>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="#">RENTAL</a></li>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/sec_items/secItemsViewPage.jsp">USED HOME APPLIANCES</a>
					</li>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/ser_ad/serAdViewPage.jsp">SERVICE</a>
					</li>

					<%
					String memUsername = (String) session.getAttribute("memUsername");

					if (memUsername != null) {
					%>
					<li class="nav-item dropdown"><a class="nav-link text-dark"
						href="#" id="navbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <img
							class="rounded-circle u-box-shadow-sm me-2 text-dark" width="25"
							height="25" src=" https://dummyimage.com/100/007bff/efefef"
							alt="Htmlstream"> ${memUsername} <i
							class="fa fa-angle-down   "></i></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/member/memberCenter/buyerMemberCenter.jsp">Member Centre</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/member/memberCenter/sellerMemberCenter.jsp">Seller Centre</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/chat/index.jsp">Chat</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/sec_items/shoppingCart.jsp">Cart</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/member/MemberServlet.do?action=logout">Log out</a>
						</div></li>
					<%
					} else {
					%>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/member/login.jsp">Log in</a></li>
					<%
					}
					%>
				</ul>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- 上端導覽列結束--------------------------------------- -->

	<!-- 側邊導覽列開始--------------------------------------- -->



	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<!-- ------------------------------------------------------------------------------------------------- -->
						<div class="sb-sidenav-menu-heading">SELLER MANAGEMENT</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-home"></i>
							</div> RENTAL RELATED MANAGEMENT
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">Apply to be a Landlord</a> <a
									class="nav-link" href="layout-static.html">Listing Management</a> <a
									class="nav-link"
									href="<%=request.getContextPath()%>/frontend/ren_appointment/listRenAppByLDD.jsp">Appointment Management</a>
								<a class="nav-link" href="layout-sidenav-light.html">Lease Management</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-couch"></i>
							</div> USED HOME APPLIANCES MANAGEMENT
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link"
									href="<%=request.getContextPath()%>/frontend/sec_items/select_page.jsp">Product Management</a>
								<a class="nav-link"
									href="<%=request.getContextPath()%>/frontend/sec_ord/listAllSecOrd.jsp">Order Management</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages2" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-wrench"></i>
							</div> SERVICE MANAGEMENT
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages2"
							aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">服務管理</a> <a
									class="nav-link" href="layout-sidenav-light.html">Requests Management</a> <a
									class="nav-link" href="layout-sidenav-light.html">Order Management</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
					</div>
				</div>

			</nav>
		</div>
		<!-- main 開始--------------------------------------------------------------------------------- -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<!-- 塞頁面從這裡開始--------------------------------------------------------------------------------- -->


					<html>
<head>


<title>EASY SPACE</title>


<style>
table#table-1 {
	background-color: #FFE5B5;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 1000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>

	<!-- 	<h4>此頁練習採用 EL 的寫法取值:</h4> -->
	<table id="table-1">
		<tr>
			<td>
				<h3>所有訂單</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/frontend/sec_ord/listAllSecOrd.jsp"><img
						src="<%=request.getContextPath()%>/images/cmn/index/EASYSPACE.png"
						width="100" height="60" border="0">回查詢HOME PAGE</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">Fix:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table>
		<tr>
			<th>商品訂單編號</th>
			<th>買家編號</th>
			<th>賣家編號</th>
			<th>收件Address郵遞區號</th>
			<th>收件縣市</th>
			<th>收件鄉鎮區</th>
			<th>收件Address</th>
			<th>付款方式</th>
			<th>訂單狀態</th>
			<th>商品價格</th>
			<th>訂單日期</th>
			<!-- 			<th>買家評價賣家星數</th> -->
			<!-- 			<th>買家評價賣家內容</th> -->
			<!-- 			<th>賣家評價買家星數</th> -->
			<!-- 			<th>賣家評價買家內容</th> -->
			<!-- 			<th>撥款日期</th> -->
			<!-- 			<th>買家備註</th> -->
			<th>Edit</th>
			<th>取消訂單<font color=red></font></th>
			<th>查詢訂單明細</th>
		</tr>

		<c:forEach var="secOrdVO" items="${listSecOrd_ByShSellererID}">
			<tr>
				<td>${secOrdVO.shOrdID}</td>
				<td>${secOrdVO.shBuyerID}</td>
				<td>${secOrdVO.shSellerID}</td>
				<td>${secOrdVO.shPostcode}</td>
				<td>${secOrdVO.shCounty}</td>
				<td>${secOrdVO.shDist}</td>
				<td>${secOrdVO.shRoad}</td>

				<td><c:if test="${secOrdVO.shPayment == 11}">信用卡</c:if> <c:if
						test="${secOrdVO.shPayment == 12}">匯款</c:if></td>


				<td><c:if test="${secOrdVO.shOrdStatus == 8}">取消訂單</c:if> <c:if
						test="${secOrdVO.shOrdStatus == 2}">待出貨</c:if> <c:if
						test="${secOrdVO.shOrdStatus == 3}">已出貨</c:if> <c:if
						test="${secOrdVO.shOrdStatus == 6}">Refund Verification中</c:if> <c:if
						test="${secOrdVO.shOrdStatus == 7}">訂單完成</c:if></td>


				<td><fmt:formatNumber value="${secOrdVO.shPrice}"
						pattern="###,###" /></td>
				<td>${secOrdVO.shDate}</td>
				<%-- 				<td>${secOrdVO.shBuyerScore}</td> --%>
				<%-- 				<td>${secOrdVO.shBuyerTXT}</td> --%>
				<%-- 				<td>${secOrdVO.shSellerScore}</td> --%>
				<%-- 				<td>${secOrdVO.shSellerTXT}</td> --%>
				<%-- 				<td>${secOrdVO.shAPPDate}</td> --%>
				<%-- 				<td>${secOrdVO.shNotes}</td> --%>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/sec_ord/UpdateSecOrdBySellerServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="Edit"> <input type="hidden"
							name="shOrdID" value="${secOrdVO.shOrdID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/sec_ord/GetSecOrdDetailsBySellerServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="取消訂單"> <input type="hidden"
							name="shOrdID" value="${secOrdVO.shOrdID}"> <input
							type="hidden" name="action" value="delete_secord">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/sec_ord/GetSecOrdDetailsBySellerServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="送出查詢"> <input type="hidden"
							name="shOrdID" value="${secOrdVO.shOrdID}"> <input
							type="hidden" name="action" value="listSecOrdDetails_BySecOrd_A">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>


	<%
	if (request.getAttribute("listSecOrdDetails") != null) {
	%>
	<jsp:include page="listSecOrdDetails.jsp" />
	<%
	}
	%>

	<!-- 塞頁面從這裡結束--------------------------------------------------------------------------------- -->
				</div>
			</main>
		</div>
		<!-- main 結束--------------------------------------------------------------------------------- -->
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
	<script src="js/datatables-simple-demo.js"></script>

	<!-- 側邊導覽列結束--------------------------------------- -->
	<main></main>
</body>
</html>