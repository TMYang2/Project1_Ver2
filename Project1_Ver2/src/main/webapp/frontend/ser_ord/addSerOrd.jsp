<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_dmd.model.SerDmdService"%>
<%@ page import="ezs.ser_ord.model.*"%>
<%@ page import="ezs.ser_quo.model.*"%>
<%@ page import="ezs.ser_dmd.model.*"%>

<%
SerOrdVO serOrdVO = (SerOrdVO) request.getAttribute("serOrdVO");
Integer quoID = Integer.valueOf(request.getParameter("quoID")) ;
SerQuoService serQuoSvc = new SerQuoService();
SerQuoVO oneQuoVO = serQuoSvc.getOneSerQuo(quoID);
pageContext.setAttribute("oneQuoVO", oneQuoVO);
SerDmdService serDmdSvc = new SerDmdService();
SerDmdVO oneDmdVO = serDmdSvc.getOneSerDmd(oneQuoVO.getQuoDmdID());
pageContext.setAttribute("oneDmdVO", oneDmdVO);
%>





<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>EASY SPACE</title>
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

</head>
<body class="sb-nav-fixed">
	<!-- ?????????????????????--------------------------------------- -->
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

	<!-- ?????????????????????--------------------------------------- -->

	<!-- ?????????????????????--------------------------------------- -->

	

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
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_vdr/addSerVdr.jsp">Apply to be a Service Provider</a>
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
<!-- main ??????--------------------------------------------------------------------------------- -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
<!-- ????????????????????????--------------------------------------------------------------------------------- -->

<div style="width:100; ">
	

	<h4>??????????????????:</h4>
</div>
	<%-- ???????????? --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">Fix:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
<div style= " margin:auto; ">
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ser_ord/AddOrdServlet.do" name="form1">
		<table>
			
			<tr>
				<td >?????????ID:</td>
				<td><input type="TEXT" name="ordDmdID" size="50" value="${oneQuoVO.quoDmdID}" disabled/></td>
			</tr>
			<tr>
				<td>?????????ID:</td>
				<td><input type="TEXT" name="ordQuoID" size="50" value="${oneQuoVO.quoID}" disabled/></td>
			</tr>
			<tr>
				<td>??????ID:</td>
				<td><input type="TEXT" name="ordMemID" size="50" value="${oneDmdVO.dmdMemID}" disabled/></td>
			</tr>
			<tr>
				<td>??????ID:</td>
				<td><input type="TEXT" name="ordVdrID" size="50" value="${oneQuoVO.quoVdrID}" disabled/></td>
			</tr>
			<tr>
				<td>????????????ID:</td>
				<td><input type="TEXT" name="ordSerClaID" size="50" value="${oneDmdVO.dmdSerClaID}" disabled/></td>
			</tr>
			<tr>
				<td>??????Name:</td>
				<td><input type="TEXT" name="ordClnName" size="50" value="${oneDmdVO.dmdName}" disabled/></td>
			</tr>
			<tr>
				<td>??????Phone Number:</td>
				<td><input type="TEXT" name="ordClnTel" size="50" value="${oneDmdVO.dmdTel}" disabled/></td>
			</tr>
			<tr>
				<td>????????????:</td>
				<td><input type="TEXT" name="ordCounty" size="50" value="${oneDmdVO.dmdCounty}" disabled/></td>
			</tr>
			<tr>
				<td>????????????:</td>
				<td><input type="TEXT" name="ordDist" size="50" value="${oneDmdVO.dmdRegion}" disabled /></td>
			</tr>
			<tr>
				<td>????????????Address:</td>
				<td><input type="TEXT" name="ordAddr" size="50" value="${oneDmdVO.dmdAddress}" disabled/></td>
			</tr>
			<tr>
				<td>??????????????????:</td>
				<td><input type="TEXT" name="ordMemVatno" size="50"
					value="" /></td>
			</tr>
			<tr>
				<td>??????????????????:</td>
				<td><input type="TEXT" name="ordVdrVatno" size="50"
					value="${oneQuoVO.quoID}" /></td>
			</tr>
			<tr>
				<td>????????????:</td>
				<td><input name="ordWorkDate" id="ordWorkDate1" type="text" ></td>
			</tr>
			<tr>
				<td>????????????:</td>
				<td>
					<textarea name="ordItem"rows="4" cols="50" >${oneQuoVO.quoItem}</textarea>
				</td>
			</tr>
			<tr>
				<td>?????????:</td>
				<td><input type="TEXT" name="ordTotalPrice" value="${oneQuoVO.quoTotalPrice}" /></td>
			</tr>
			<tr>
				<td>??????:</td>
				<td>
				<textarea name="ordNote"rows="4" cols="50" ></textarea>
				</td>
			</tr>
			
			

		</table>
		<br> 
		<input type="hidden" name="ordStatus" size="8" value=0 />
		<input type="hidden" name="ordPayStatus" size="8" value=0 />
		<input type="hidden" name="ordDmdID" size="50" value="${oneQuoVO.quoDmdID}" />
		<input type="hidden" name="ordQuoID" size="50" value="${oneQuoVO.quoID}" />
		<input type="hidden" name="ordMemID" size="50" value="${oneDmdVO.dmdMemID}" />
		<input type="hidden" name="ordVdrID" size="50" value="${oneQuoVO.quoVdrID}" />
		<input type="hidden" name="ordSerClaID" size="50" value="${oneDmdVO.dmdSerClaID}" />
		<input type="hidden" name="ordClnName" size="50" value="${oneDmdVO.dmdName}" />
		<input type="hidden" name="ordClnTel" size="50" value="${oneDmdVO.dmdTel}" />
		<input type="hidden" name="ordCounty" size="50" value="${oneDmdVO.dmdCounty}" />
		<input type="hidden" name="ordDist" size="50" value="${oneDmdVO.dmdRegion}" />
		<input type="hidden" name="ordAddr" size="50" value="${oneDmdVO.dmdAddress}" />
		<input type="hidden" name="ordPrePay" value="10" />
		<input type="hidden" name="ordPayType" size="8" value=0 />
		<input name="ordPayDate" id="ordPayDate1" type="hidden">
		<input type="hidden" name="ordFpay" value="10" />
		<input type="hidden" name="ordFpayType" size="8" value=0 />
		<input name="ordFpayDate" id="ordFpayDate1" type="hidden">
		<input type="hidden" name="ordBuyerScore" value="<%=(serOrdVO == null) ? "0" : serOrdVO.getOrdBuyerScore() %>" />
		<input type="hidden" name="ordBuyerTxt" value="<%=(serOrdVO == null) ? "" : serOrdVO.getOrdBuyerTxt() %>" />
		<input type="hidden" name="ordVdrScore" value="<%=(serOrdVO == null) ? "0" : serOrdVO.getOrdVdrScore() %>" />
		<input type="hidden" name="ordVdrTxt" value="<%=(serOrdVO == null) ? "" : serOrdVO.getOrdVdrTxt() %>" />
		<input type="hidden" name="action" value="insert"> 
		<input type="submit" value="Confirm">
	</FORM>
	</div>
</body>



<!-- =========================================????????? datetimepicker ?????????Setting========================================== -->


<% 
  java.sql.Date ordWorkDate = null;
  try {
	  ordWorkDate = serOrdVO.getOrdWorkDate();
   } catch (Exception e) {
	   ordWorkDate = new java.sql.Date(System.currentTimeMillis());
   }
%>
<% 
  java.sql.Date  ordPayDate= null;
  try {
	  ordPayDate = serOrdVO.getOrdPayDate();
   } catch (Exception e) {
	   ordPayDate = new java.sql.Date(System.currentTimeMillis());
   }
%>
<% 
  java.sql.Date  ordFpayDate= null;
  try {
	  ordFpayDate = serOrdVO.getOrdFpayDate();
   } catch (Exception e) {
	   ordFpayDate = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#ordWorkDate1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (??????timepicker???????????????60??????)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=ordWorkDate%>' //,  value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // ??????????????????
           //startDate:	            '2017/07/10',  // ?????????
           //minDate:               '-1970-01-01', // ????????????(??????)??????
           //maxDate:               '+1970-01-01'  // ????????????(??????)??????
        });
        $.datetimepicker.setLocale('zh');
        $('#ordPayDate1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (??????timepicker???????????????60??????)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=ordPayDate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // ??????????????????
           //startDate:	            '2017/07/10',  // ?????????
           //minDate:               '-1970-01-01', // ????????????(??????)??????
           //maxDate:               '+1970-01-01'  // ????????????(??????)??????
        });
        $.datetimepicker.setLocale('zh');
        $('#ordFpayDate1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (??????timepicker???????????????60??????)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=ordFpayDate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // ??????????????????
           //startDate:	            '2017/07/10',  // ?????????
           //minDate:               '-1970-01-01', // ????????????(??????)??????
           //maxDate:               '+1970-01-01'  // ????????????(??????)??????
        });
        
        
   
        // ----------------------------------------------------------???????????????????????????????????????-----------------------------------------------------------

        //      1.?????????????????????????????????????????????
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.?????????????????????????????????????????????
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.???????????????????????????????????????????????? (?????????????????????????????????)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>





<!-- ????????????????????????--------------------------------------------------------------------------------- -->
				</div>
			</main>
		</div>
<!-- main ??????--------------------------------------------------------------------------------- -->
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

	<!-- ?????????????????????--------------------------------------- -->
	<main></main>

</html>