<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_ad.model.*"%>

<%
Integer memID = (Integer)session.getAttribute("memID");
SerAdVO serAdVO = (SerAdVO) request.getAttribute("serAdVO");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>EASY SPACE</title>
 <script src="<%=request.getContextPath()%>/frontend/js/jquery-1.11.3.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/member.center.styles.css"	rel="stylesheet" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<link rel="stylesheet"href=" https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css ">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

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
	width: 520px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table {
    border: 5px groove #E0E0FF;
   
  }
  th, td {
    padding: 5px;
    text-align: left;
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
<!-- main ??????--------------------------------------------------------------------------------- -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
<!-- ????????????????????????--------------------------------------------------------------------------------- -->







<%-- <html>
<head>
 <script src="<%=request.getContextPath()%>/frontend/js/jquery-1.11.3.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>??????Post an Ad</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
--%>



<body>

	

	

	<h3>??????????????????:</h3>
	<br>

	<%-- ???????????? --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">Fix:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" enctype="multipart/form-data"
		ACTION="InsertSerAdServlet.do" name="form1">
		<table>

			
			<tr>
				<td>????????????:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="adVdrID" size="45" value="${memID}" disabled /></td>
			</tr>
			<tr>
				<%-- <td>????????????:</td>--%>

				<td><input type="hidden" name="adStatus" size="45"
					value="<%=(serAdVO == null) ? "1" : serAdVO.getAdStatus()%>" /></td>

			</tr>


			<jsp:useBean id="serClaSvc" scope="page"
				class="ezs.ser_cla.model.SerClaService" />
			<tr>
				<td>??????????????????:<font color=red><b>*</b></font></td>
				<td><select size="1" name="adSerClaID">
						<c:forEach var="serClaVO" items="${serClaSvc.all}">
							<option value="${serClaVO.serClaID}" ${(serAdVO.adSerClaID==serClaVO.serClaID)? 'selected':'' }>${serClaVO.serClaName}
						</c:forEach>
				</select></td>
			</tr>


			<tr>
				<td>????????????:</td>
				<td><input type="TEXT" name="adDist" size="45"
					value="<%=(serAdVO == null) ? "?????????" : serAdVO.getAdDist()%>" /></td>
			</tr>

			<tr>
				<td>????????????:</td>
				<td><input type="TEXT" name="adTxt" size="45"
					value="<%=(serAdVO == null) ? "???????????????????????????" : serAdVO.getAdTxt()%>" /></td>
			</tr>

			<%-- <tr>
				<td>??????????????????:</td>
				<td><input type="file" id="upfiles" name="adPic" accept="image/gif, image/jpeg, image/png" multiple="multiple" />
				<div id="previews">
						<p>????????????</p>
					</div>
			
			</tr> --%>








		</table>
		<br> <input type="hidden" name="action" value="insert"> 
		<input type="hidden" name="adVdrID" size="10" value="${memID}"/>
		
		<input type="submit" value="Confirm">
	</FORM>
	
	
	
</body>

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
		



<script>
	// 	// // change??????event?????????????????????????????????????????????
	// 	// 	?????????FileReader???????????????????????????????????????Object???
	// 	// 	???????????????Object????????????onload??????
	// 	// 	?????? FileReader ?????????Web ??????????????????????????????asynchronously???????????????????????????????????????????????????????????????????????????
	// 	// ?????????input ????????????????????????this????????????<input type="file">???
	// 	// ???<input type="file">???DOM??????Object??????????????????????????????????????????
	// 	// ????????????input.files????????????????????????Array(??????input???????????? <input type="file" multiple> ???????????????????????????)
	$("#upfiles").change(function() {
		$("#previews").html(""); // ????????????
		readURL(this);
	});
	function readURL(input) {
		if (input.files && input.files.length >= 0) {
			for (var i = 0; i < input.files.length; i++) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var img = $("<img width='300' height='200'>").attr('src',
							e.target.result);
					$("#previews").append(img);
				}
				reader.readAsDataURL(input.files[i]);
			}
		} else {
			var noPictures = $("<p>??????????????????</p>");
			$("#previews").append(noPictures);
		}
	}
</script>


</html>