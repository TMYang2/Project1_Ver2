<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EASY SPACE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
	<style type="text/css">
	}
body {
  background-color: #ecb88a;
}</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-popRpmFF9JQgExhfw5tZT4I9/CI5e2QcuUZPOVXb1m7qUmeR2b50u+YFEYe1wgzy"
	crossorigin="anonymous"></script>
<!-- Plugins -->
</head>
<body>
	<!-- Header starts from here -->
	
	<!-- Header ends from here -->
	<div class="container-fluid">
		<!--  main start -->



		<ul>
			<li>
				<a href="<%=request.getContextPath()%>/frontend/ser_dmd/getByDmdMemID.jsp">檢視需求單</a>
			</li>
		</ul>
		
		<ul>
			<li>
				<a href="<%=request.getContextPath()%>/frontend/ser_dmd/addSerDmd.jsp">Add Requests</a>
			</li>
		</ul>



		<!--  end of main -->
	</div>
	<!-- Footer ends from here -->
	
</body>
</html>