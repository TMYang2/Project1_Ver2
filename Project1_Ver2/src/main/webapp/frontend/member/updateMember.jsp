<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
Integer memID = (Integer) session.getAttribute("memID");
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<script>
  var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
      URL.revokeObjectURL(output.src) // free memory
    }
  };
</script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>EASY SPACE</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc=" crossorigin="anonymous" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>   
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
						href="<%=request.getContextPath()%>/frontend/ren_listing/listingView.jsp">RENTAL</a></li>
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

						<div class="sb-sidenav-menu-heading">INFORMATION MANAGEMENT</div>
						<a class="nav-link" href="<%= request.getContextPath()%>/frontend/member/listOneMember.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Member Information Management
						</a>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<div class="sb-sidenav-menu-heading">BUYER MANAGEMENT</div>
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
								<a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_appointment/listRenAppByMEM.jsp">Appointment Management</a>
								<a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_lease/MEMlistOneLease.jsp">Lease Management</a>
                                <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_favorites/listOneRenFavorites.jsp">Favourites</a>
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
								<a class="nav-link" href="<%=request.getContextPath()%>/sec_ord/SecOrdServlet.do?action=listSecOrd_ByShBuyerID">Order Management</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages2" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-wrench"></i>
							</div> SERVICE
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages2"
							aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_dmd/addSerDmd.jsp">Add Requests</a>
								<a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_dmd/getByDmdMemID.jsp">Requests & Quotations Management</a>
                                <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ord/getOrdByMemID.jsp">Order Management</a>
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



<%-- ???????????? --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">Fix:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/MemberServletUpdate.do" name="form1" enctype="multipart/form-data" >
	
<div class="container">
	    <div class="row">
		    <table class="table table-hover table-striped">

		<tr>
			<th id="test">Member ID:</th>
			<td><%=memberVO.getMemID()%></td>
		</tr>
		<tr>
			<th id="test">Account Name:</th>
			<td><%=memberVO.getMemUsername()%></td>
		</tr>
		<tr>
			<th id="test">Password:</th>
			<td><input type="password" name="memPassword" size="20" value="<%=memberVO.getMemPassword()%>" /></td>
		</tr>
		<tr>
			<th id="test">Name:</th>
			<td><input type="TEXT" name="memName" size="20" value="<%=memberVO.getMemName()%>" /></td>
		</tr>
		<tr>
			<th id="test">Phone Number:</th>
			<td><input type="TEXT" name="memPhone" size="10" value="<%=memberVO.getMemPhone()%>" /></td>
		</tr>
		<tr>
			<th id="test">Address:</th>
			<td><input type="TEXT" name="memAddress" size="100" value="<%=memberVO.getMemAddress()%>" /></td>
		</tr>
		<tr>
			<th id="test">email:</th>
			<td><input type="TEXT" name="memEmail" size="50" value="<%=memberVO.getMemEmail()%>" /></td>
		</tr>
		<tr>
			<th id="test">Profile Picture:</th>
			<td>
			
			
			
<!-- 				<p>Preview</p>			  -->
			<input type="file" id="upfiles" name="mempic">
			 <div id="previews">
			 <br>
			 	<img src="<%=request.getContextPath()%>/DBGifReader?mem_ID=${memberVO.memID}" width=150px>
			 </div></td>

		</tr>
	</table>

</div>
    </div>


<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memID" value="<%=memberVO.getMemID()%>">
<input type="hidden" name="memUsername" value="<%=memberVO.getMemUsername()%>">
<input type="hidden" name="memVatno" value="<%=memberVO.getMemVatno()%>">
<input type="submit" value="Confirm">
</FORM>
		
	
</body>
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
					var img = $("<img width='150' height='150'>").attr('src',
							e.target.result);
					$("#previews").append(img);
				}
				reader.readAsDataURL(input.files[i]);
			}
		} else {
			var noPictures = $("<p>NO PICTURES</p>");
			$("#previews").append(noPictures);
		}
	}
</script>
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