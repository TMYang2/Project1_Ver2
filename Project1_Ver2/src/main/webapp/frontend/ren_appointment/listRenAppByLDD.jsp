<%@page import="ezs.ren_landlord.model.RenLandlordVO"%>
<%@page import="ezs.ren_landlord.model.RenLandlordService"%>
<%@page import="ezs.ren_landlord.model.RenLandlordDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_appointment.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%
	Integer ldd_mem_Id = (Integer)session.getAttribute("memID");
	System.out.println(ldd_mem_Id);
	RenAppointmentService renAppSvc = new RenAppointmentService();
	RenLandlordService renLddSvc = new RenLandlordService();
	Integer aptLddId = renLddSvc.findByMEM(ldd_mem_Id);
	List<RenAppointmentVO> list = renAppSvc.getAllLDD(aptLddId);
	pageContext.setAttribute("list",list);	
%>


<jsp:useBean id="memSvc" scope="page" class="ezs.member.model.MemberService" />
<jsp:useBean id="renLisSvc" scope="page" class="ezs.ren_listing.model.RenListingService" />



<html>
<head>
<script src="https://kit.fontawesome.com/1c2ccc4859.js" crossorigin="anonymous"></script>
<title>EASY SPACE</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc=" crossorigin="anonymous" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>   
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/member.center.styles.css"	rel="stylesheet" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<link rel="stylesheet"href=" https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css ">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">

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
	background-color: #CCCCFF;
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
	width: 800px;
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
<script src="https://kit.fontawesome.com/1c2ccc4859.js" crossorigin="anonymous"></script>
  
    
   
<style>
    #test{
        color: white;
        background-color: #212529;
        border-color: #32383e;
        text-align: center;
        vertical-align: middle;
    }
        
    table td {
        text-align: center;
    }
</style>

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
								 <a class="nav-link" href="layout-static.html">Apply to be a Landlord</a>
                                    <a class="nav-link" href="layout-static.html">Listing Management</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_appointment/listRenAppByLDD.jsp">Appointment Management</a>
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
								  <a class="nav-link" href="<%=request.getContextPath()%>/frontend/sec_items/select_page.jsp">Product Management</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/sec_ord/listAllSecOrd.jsp">Order Management</a>
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
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_vdr/update_SerVdr_input.jsp">Apply to be a Service Provider</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_vdr/listOneSerVdr.jsp">Company Information</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ad/addSerAd.jsp">Post an Ad</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ad/listAllSerAd.jsp">Check Services</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_quo/getQuoByVdrID.jsp">Requests Management</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ord/findQuoBeforeByVdrID.jsp">Add an Order</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ord/getOrdByVdrID.jsp">Check Orders</a>
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


	<h3>Appointment</h3>
		


<div class="container">
	    <div class="row">
		    <table class="table table-hover table-striped">
		        <thead>
		        <tr class="thead-dark">
		<th>Appointment Number</th>
		<th>Participant</th>
		<th>Participant's Score</th>
		<th>Listing</th>
		<th>Appointment Status</th>
		<th>Appointment Time</th>
		<th>Confirm</th>
<!-- 		<th>Edit</th> -->
		<th>Cancel</th>
		<th>Delete</th>
	</tr>
	</thead>
		        <tbody>
	<c:forEach var="renAppointmentVO" items="${list}">
		<tr align='center' valign='middle'>
			<td>${renAppointmentVO.aptId}</td>
			<td><c:forEach var="memVO" items="${memSvc.all}">
                    <c:if test="${renAppointmentVO.aptMemId==memVO.memID}">
	                    【${memVO.memID}】 - ${memVO.memUsername}
                    </c:if>
                </c:forEach>
			</td>
			<td><c:forEach var="memVO" items="${memSvc.all}">
                    <c:if test="${renAppointmentVO.aptMemId==memVO.memID}">
	                    <c:choose>
						<c:when test="${(memVO.memRedCount) == 0}">N/A</c:when>
						<c:otherwise>
							<fmt:formatNumber type="number" maxFractionDigits="1" 
								value="${(memVO.memRedScore/memVO.memRedCount)}"/>
						</c:otherwise>
					</c:choose>
                    </c:if>
                </c:forEach>
			</td>
			<td><a href="<%=request.getContextPath()%>/frontend/ren_listing/GetOneRenListingServlet.do?lisID=${renAppointmentVO.aptLisId}&action=getOne_For_Display_A">
		<c:forEach var="renLisVO" items="${renLisSvc.all}">
                    <c:if test="${renAppointmentVO.aptLisId==renLisVO.lisID}">
	                    【${renLisVO.lisID}】 - ${renLisVO.lisTitle}
                    </c:if>
                </c:forEach></a>
			</td>
			<td>
				<c:if test="${renAppointmentVO.aptStatus == 0}">Not Confirmed</c:if> 
				<c:if test="${renAppointmentVO.aptStatus == 1}">Confirmed</c:if>
				<c:if test="${renAppointmentVO.aptStatus == 2}">Cancelled</c:if>
<%-- 				<c:if test="${renAppointmentVO.aptStatus == 3}">Time Changed</c:if> --%>
			</td>
			<td><c:set value="${renAppointmentVO.aptTime}" var="dateString" />
			<fmt:parseDate value="${dateString}" var="dateObject"
                pattern="yyyy-MM-dd HH:mm" />
                <fmt:formatDate value="${dateObject}" pattern="yyyy-MM-dd HH:mm" /></td>	
			
			<td>
			<c:if test="${renAppointmentVO.aptStatus != 2 and renAppointmentVO.aptStatus != 1}">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;">
<!-- 					<input type="submit" value="確認">  -->
					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}"> 
					<input type="hidden" name="aptMemId" value="${renAppointmentVO.aptMemId}"> 
					<input type="hidden" name="aptLddId" value="${renAppointmentVO.aptLddId}"> 
					<input type="hidden" name="aptLisId" value="${renAppointmentVO.aptLisId}"> 
					<input type="hidden" name="aptStatus" value="${renAppointmentVO.aptStatus}"> 
					<input type="hidden" name="aptTime" value="${renAppointmentVO.aptTime}"> 
					<input type="hidden" name="action" value="LddConfirm">
					<button id ="submit" onclick="submit"><i class="fa-solid fa-check"></i></button> 
				</FORM></c:if>
			</td>	

<%-- 			<td><c:if test="${renAppointmentVO.aptStatus != 2}"> --%>
<%-- 				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;"> --%>
<!-- 					<input type="submit" value="Edit">  -->
<%-- 					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}">  --%>
<!-- 					<input type="hidden" name="action" value="LDDgetOne_For_Update"> -->
<%-- 					<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"> --%>
<!-- 					<button id ="submit" onclick="submit"><i class="fa-solid fa-pen-to-square"></i></button>  -->
<!-- 				</FORM> -->
<%-- 				</c:if> --%>
<!-- 			</td> -->
			<td><c:if test="${renAppointmentVO.aptStatus != 2}">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;">
<!-- 					<input type="submit" value="取消預約">  -->
					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}"> 
					<input type="hidden" name="aptMemId" value="${renAppointmentVO.aptMemId}"> 
					<input type="hidden" name="aptLddId" value="${renAppointmentVO.aptLddId}"> 
					<input type="hidden" name="aptLisId" value="${renAppointmentVO.aptLisId}"> 
					<input type="hidden" name="aptStatus" value="${renAppointmentVO.aptStatus}"> 
					<input type="hidden" name="aptTime" value="${renAppointmentVO.aptTime}"> 
					<input type="hidden" name="action" value="LddCancel">
					<button id ="submit" onclick="submit"><i class="fa-solid fa-xmark"></i></button> 
				</FORM></c:if>
			</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;">
<!-- 					<input type="submit" value="刪除預約單">  -->
					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}"> 
					<input type="hidden" name="action" value="LDDdelete">
					<button id ="submit" onclick="submit"><i class="fa-solid fa-trash"></i></button> 
				
				</FORM>
			</td>
		</tr>
	</c:forEach></tbody>
</table>
	</div>
    </div>

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