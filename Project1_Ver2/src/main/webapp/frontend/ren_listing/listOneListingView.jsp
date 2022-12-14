<%@page import="ezs.ren_favorites.model.RenFavoritesService"%>
<%@page import="ezs.ren_favorites.model.RenFavoritesVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezs.ren_listing.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
 RenListingVO renListingVO = (RenListingVO) request.getAttribute("renListingVO");
%>
<%
 	RenFavoritesVO renFavoritesVO = (RenFavoritesVO) request.getAttribute("renFavoritesVO");
	Integer memID = (Integer)session.getAttribute("memID");

%>

<%
	RenFavoritesService renFavSvc = new RenFavoritesService();
    List<RenFavoritesVO> list = renFavSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<jsp:useBean id="renRoomtypeSvc" scope="page" class="ezs.ren_roomtype.model.RenRoomtypeService" />
<jsp:useBean id="renLocationSvc" scope="page" class="ezs.ren_location.model.RenLocationService" />
<jsp:useBean id="renLandlordSvc" scope="page" class="ezs.ren_landlord.model.RenLandlordService" />
<jsp:useBean id="memberSvc" scope="page" class="ezs.member.model.MemberService" />
<!DOCTYPE html>
<html>
  <head>
    <!-- 
    More Templates Visit ==> ProBootstrap.com
    Free Template by ProBootstrap.com under the License Creative Commons 3.0 ==> (probootstrap.com/license)

    IMPORTANT: You can do whatever you want with this template but you need to keep the footer link back to ProBootstrap.com
    -->
    <title>EASY SPACE</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Free HTML5 Website Template by ProBootstrap.com" />
    <meta name="keywords" content="free bootstrap 4, free bootstrap 4 template, free website templates, free html5, free template, free website template, html5, css3, mobile first, responsive" />
    <meta name="author" content="ProBootstrap.com" />
    
    <!-- <link href="https://fonts.googleapis.com/css?family=Work+Sans" rel="stylesheet"> -->

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/open-iconic-bootstrap.min.css">
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/icomoon.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/animate.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/viewPage.css">
<style>
      *{
        box-sizing: border-box;
      }
      :root{
        --header-height: 60px;
        --aside-width: 180px;
      }
      body{
        margin: 0;
      }
      img{
        max-width: 100%;
        max-height:100%
      }

      /* ==================== header ?????? ==================== */
      header.header{
        border: 1px solid black;
        width: 100%;
        position: sticky;
        top: 0;
        height: var(--header-height);
        background-color: lightgray;
      }
      header.header button.btn_hamburger{
        display: none;
      }
      /* ==================== aside ?????? ==================== */
      aside.aside{
/*         border: 1px solid blue; */
        position: fixed;
        top: var(--header-height)+100px; 
        left: 0;
        height: calc(100% - var(--header-height));
        width: var(--aside-width);
        background-color: #efefef;
        overflow-y: auto;
        padding: 20px 0;
        transition: all 1s;
        margin-top: 1
      }
      aside.aside button.btn_hamburger{
        display: none;
      }
      @media screen and (max-width: 767px){
        aside.aside{
          top: 0;
          height: 100%;
          transform: translateX(-100%);
        }
        aside.aside.-on{
          transform: translateX(0%);
        }
        header.header button.btn_hamburger, aside.aside button.btn_hamburger{
          display: inline-block;
        }
      }

      aside.aside > nav.nav > ul.nav_list{
        margin: 0;
        padding: 0;
        list-style: none;
      }
      aside.aside > nav.nav > ul.nav_list > li > a{
        display: inline-block;
/*         border: 1px solid lightblue; */
        width: 100%;
        padding: 3px 10px;
      }

      /* ==================== main ?????? ==================== */
      main.main{
/*         border: 1px solid red; */
        margin-left: var(--aside-width);
        width: calc(100% - var(--aside-width));
        padding: 20px;
        background-color: white;
        min-height: calc(100vh - var(--header-height));
        transition: all 1s;
        margin-top: 80px;
      }
      @media screen and (max-width: 767px){
        main.main{
          width: 100%;
          margin-left: 0;
        }
      }
      main.main ul.item_list{
        margin: 0;
        padding: 0;
        list-style:none;
        display: flex;
        flex-wrap: wrap;
      }
      main.main ul.item_list > li{
        width: calc((100% - 60px) / 4);
        margin-bottom:20px;
        margin-right: 20px;
      }
      @media screen and (max-width: 767px){
        main.main ul.item_list > li{
          width: calc((100% - 20px) / 2);
        }
      }
      main.main ul.item_list > li:nth-child(4n){
        margin-right: 0;
      }
      @media screen and (max-width: 767px){
        main.main ul.item_list > li:nth-child(2n){
          margin-right: 0;
        }
      }
      main.main ul.item_list > li > a{
        display: inline-block;
/*         border: 1px solid red;  */
        text-decoration: none;
        width: 100%;
      }
      main.main ul.item_list > li > a div.img_block{
        border: 1px solid #e1e1e1;
        font-size: 0;
        height: 200px;
        display: flex;
      }
      main.main ul.item_list > li > a span.item_text{
/*         border: 1px solid blue;  */
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        display: block;
        width: 100%;
      }
      main.main ul.item_list > li > a span.item_price{
/*         border: 1px solid blue;  */
        display: block;
        width: 100%;
      }
    </style>
  </head>
  
  
<!--   IGNORE THESE  -->
  <script language="javascript">
    const addToFav = document.getElementById('addFav');
    addToFav.addEventListener('click', event => {
    	if(event.target.matches('.icon_heart')){
    		addFavorites(event.target.dataset.id);
    	}
    })
    
    function addFavorites(favid){
    	let addFav = favid.split("v");
    	$.ajax({
    		type:"POST",
    		dataType: "json",
    		data:{
    			""
    		}
    		url: "<%=request.getContextPath()%>/RenFavoritesServlet.do?action=add&favLisId=" + addFav,
    		success: function(res){
    			if(icon.getAttribute("name") === "heart_outline"){
					$.ajax({
						type : "POST",
						success : function() {
							alert('Added to Favourites!');
							icon.setAttribute("name","heart");
						}
					});
				}else{
					$.ajax({
						type : "POST",
						success : function() {
							alert('Removed from Favourites!');
							icon.setAttribute("name","heart_outline");
						}
					});
				}
    		}		
    	})
    }  
</script>
<!--   IGNORE THESE  -->

  
<body>
<%--   	<jsp:include page="/frontend/EZ_nav.jsp"/> --%>
    <jsp:include page="/frontend/EZ_LoginHeader.jsp" />
    <aside class="probootstrap-aside js-probootstrap-aside aside">
      <a href="#" class="probootstrap-close-menu js-probootstrap-close-menu d-md-none"><span class="oi oi-arrow-left"></span> Close</a>
      <div class="probootstrap-site-logo probootstrap-animate" data-animate-effect="fadeInLeft">
        
        <a href="<%=request.getContextPath() %>/frontend/ren_listing/listingView.jsp" class="mb-2 d-block probootstrap-logo">?????????</a>
<!--         <p class="mb-0">???????????????????????????????????????????????????????????????????????? </p> -->
      </div>
      </div>
      <div class="sidebar"><div class="block__info-main">
        
      <div class="probootstrap-overflow">
        <nav class="probootstrap-nav">
          <ul>
            <li class="probootstrap-animate active" data-animate-effect="fadeInLeft"><a href="<%=request.getContextPath() %>/frontend/ren_listing/listingView.jsp">??????????????????</a></li>
            <li>   
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenFavoritesServlet.do">
					<input type="hidden" name="favLisId" value="${renListingVO.lisID}"> 
					<input type="hidden" name="favMemId" value="${memID}"> 
					
					
					<c:choose>
						<c:when test=""></c:when>
					</c:choose>
					
					
					<input type="hidden" name="action" value="add">		
					<button id="addFav" class="float-left submit-button">Add to Favorites</button>
				</FORM>
			</li>
			
			<li>
				<button id="addApp" class="float-left submit-button" >Make an Appointment</button>
				<script type="text/javascript">
    				document.getElementById("addApp").onclick = function () {
       					location.href = "<%=request.getContextPath()%>/frontend/ren_appointment/addRenAppointment.jsp?aptLisId=${renListingVO.lisID}&aptLddId=${renListingVO.lisLddID}";
    				};
				</script>
			</li>

	
	<li>
      <FORM METHOD="post" ACTION="GetOneRenListingServlet.do">
      	<b>????????????ID:</b>
      	<input type="text" name="lisID">
      	<input type="hidden" name="action" value="getOne_For_Display_A">
        <input type="submit" name="??????">      
      </FORM>
     </li>
     
     
	    <li>
     	<FORM METHOD="post" ACTION="RenLocationServlet.do">     	
     	  <b>????????????:</b>
     	  <select size="1" name="lisAreaID">
     		<c:forEach var="renLocationVO" items="${renLocationSvc.all}">
     		  <option value="${renLocationVO.locID}"${(renListingVO.lisAreaID == renLocationVO.locID)? 'selected':'' } >${renLocationVO.locCity}${renLocationVO.locDist}
     		</c:forEach>
     	  </select>
     	  <input type="hidden" name="action" value="listLocations_BylisAreaID">
     	  <input type="submit" value="??????">
       </FORM>
       </li>  

          </ul>
        </nav>
      </div>
    </aside>
    
      <div class="probootstrap-bar">
        <a href="#" class="probootstrap-toggle js-probootstrap-toggle" style="margin-left:20px;"><span class="oi oi-menu"></span></a>
        <div class="probootstrap-main-site-logo"></div>
      </div>
       <main class="main">
		<ul class="item_list" id="item_list">
			<div class="block__title">
      <div class="title-3">
      <h3></h3>
        <h2>
                      <span data-tooltip="" data-tooltip-hover="" data-tooltip-pos="up">
              <i class="fr fr-condo"></i><span class="r-tooltip"><b><c:forEach var="renRoomtypeVO" items="${renRoomtypeSvc.all}">
                    <c:if test="${renListingVO.lisRtID==renRoomtypeVO.rtID}">
	                    ${renRoomtypeVO.rtType}
                    </c:if>
                </c:forEach></b></span>
            </span>
                    <span class="title"><%=renListingVO.getLisTitle()%></span>
        </h2>

        <div class="group__manage">
                      <a class="btn__track favorite_ehid" data-ehid="01ab1b163533429"><i class="fr fr-heart-o"></i></a>
                  </div>

      </div>
      <h1 class="txt__address">
        
       <%=renListingVO.getLisAddress()%> </h1>
      
       <div class="item slick-slide slick-current slick-active is--img-cover" data-slick-index="0" aria-hidden="false" tabindex="-1" role="option" aria-describedby="slick-slide20" style="width: 860px; position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1;"><img class="" src="<%=request.getContextPath()%>/ren_listing/RenListing_pic_ReaderServlet.do?LIS_ID=
				 ${renListingVO.lisID}"opacity: 1;"></div>
	   <div class="block__info-sub">
	   
	   	<h3 class="title-4">??????</h3>
	   		<h5><span class="list__label"><c:forEach var="renLandlordVO" items="${renLandlordSvc.all}">
                    <c:if test="${renListingVO.lisLddID==renLandlordVO.lddId}">
			<c:forEach var="memberVO" items="${memberSvc.all}">
                    		<c:if test="${renLandlordVO.lddId==memberVO.memID}">
                    		 	${memberVO.memID}${memberVO.memName}
                      	 </c:if>
                       </c:forEach>
                   </c:if>
                </c:forEach></span></h5>
	   	
        <h3 class="title-4">????????????</h3>
        <h4>??????</h4>
        	<li><span class="list__content"><%=renListingVO.getLisRent()%>???</span></li>
        <div class="list__info-sub">
          <h4 class="title-6">??????</h4>
          <ul class="group">           
            
                          <li><span class="list__label">??????</span><span class="list__content"><c:forEach var="renRoomtypeVO" items="${renRoomtypeSvc.all}">
                    <c:if test="${renListingVO.lisRtID==renRoomtypeVO.rtID}">
	                    ${renRoomtypeVO.rtID}${renRoomtypeVO.rtType}
                    </c:if>
                </c:forEach></span></li>
                                      <li><span class="list__label">??????</span><span class="list__content"><%=renListingVO.getLisRmNo()%>???<%=renListingVO.getLisCmnArea()%>???<%=renListingVO.getLisBrNo()%>???</span></li>
                                      <li><span class="list__label">??????/??????</span><span class="list__content"><%=renListingVO.getLisFlr()%></span></li>
                                      
          </ul>
        </div>
        <div class="list__info-sub">
          <h4 class="title-6">??????</h4>
          <ul class="group">
                          <li><span class="list__label">????????????</span><span class="list__content"><%=renListingVO.getLisSqft()%></span></li>
                                              </ul>
        </div>
                  <div class="list__info-sub">
            <h4 class="title-6">????????????</h4>
            <ul class="group">
                              
                                            <li><span class="list__label">??????</span><span class="list__content"><c:if test="${renListingVO.lisCook==0}">?????????</c:if>
		 <c:if test="${renListingVO.lisCook==1}">??????</c:if></span></li>
                                                          <li><span class="list__label">????????????</span><span class="list__content"><c:if test="${renListingVO.lisPet==0}">?????????</c:if>
		 <c:if test="${renListingVO.lisPet==1}">??????</c:if></span></li>
		 											      <li><span class="list__label">??????</span><span class="list__content"><c:if test="${renListingVO.lisSmoking==0}">?????????</c:if>
		 <c:if test="${renListingVO.lisSmoking==1}">??????</c:if></span></li>
                                                          <li><span class="list__label">?????????</span><span class="list__content"><c:if test="${renListingVO.lisMonly==0}">???</c:if>
		 <c:if test="${renListingVO.lisMonly==1}">???</c:if></span></li>
                                                          <li><span class="list__label">?????????</span><span class="list__content"><c:if test="${renListingVO.lisFonly==0}">???</c:if>
		 <c:if test="${renListingVO.lisFonly==1}">???</c:if></span></li>
                                            <li><span class="list__label">?????????</span><span class="list__content"><c:if test="${renListingVO.lisSonly==0}">???</c:if>
		 <c:if test="${renListingVO.lisSonly==1}">???</c:if></span></li>
                                            
                          </ul>
          </div>
                          <div class="list__info-sub">
            <h4 class="title-6">??????</h4>
            <ul class="group">
              <li><span class="list__label"><c:if test="${renListingVO.lisParking==0}">??????</c:if>
		 <c:if test="${renListingVO.lisParking==1}">???</c:if></span>
		 	      <li><span class="list__label">?????????</span><span class="list__content"><%=renListingVO.getLisPfee()%>???</span></li>
		 
		 
                          </ul>
          </div>
        
                  <div class="list__info-sub">
            <h4 class="title-6">??????</h4>
            <ul class="group">             
                              <li><span class="list__label">?????????</span><span class="list__content"><%=renListingVO.getLisMngFee()%>???</span></li>
                                        </ul>
          </div>
        
                  <div class="list__info-sub">
            <h4 class="title-6">????????????</h4>
            <ul class="group">
                              <li class="is--block"><span class="list__label">??????</span><span class="list__content">
                                         <li><span class="list__label">????????????</span><span class="list__content"><c:if test="${renListingVO.lisEthernet ==0}">??????</c:if>
		 <c:if test="${renListingVO.lisEthernet==1}">???</c:if></span></li>
                                         <li><span class="list__label">wifi</span><span class="list__content"><c:if test="${renListingVO.lisWifi==0}">??????</c:if>
		 <c:if test="${renListingVO.lisWifi==1}">???</c:if></span></li>
                                         <li><span class="list__label">?????????</span><span class="list__content"><c:if test="${renListingVO.lisWh==0}">??????</c:if>
		 <c:if test="${renListingVO.lisWh==1}">???</c:if></span></li>
                                         <li><span class="list__label">????????????</span><span class="list__content"><c:if test="${renListingVO.lisShenc==0}">??????</c:if>
		 <c:if test="${renListingVO.lisShenc==1}">???</c:if></span></li>
                                         <li><span class="list__label">??????</span><span class="list__content"><c:if test="${renListingVO.lisAc==0}">??????</c:if>
		 <c:if test="${renListingVO.lisAc==1}">???</c:if></span></li>
                                         <li><span class="list__label">??????</span><span class="list__content"><c:if test="${renListingVO.lisFridge==0}">??????</c:if>
		 <c:if test="${renListingVO.lisFridge==1}">???</c:if></span></li>
                                         <li><span class="list__label">??????</span><span class="list__content"><c:if test="${renListingVO.lisTv==0}">??????</c:if>
		 <c:if test="${renListingVO.lisTv==1}">???</c:if></span></li>
                                         <li><span class="list__label">?????????</span><span class="list__content"><c:if test="${renListingVO.lisWasher==0}">??????</c:if>
		 <c:if test="${renListingVO.lisWasher==1}">???</c:if></span></li>
                                         <li><span class="list__label">?????????</span><span class="list__content"><c:if test="${renListingVO.lisDryer==0}">??????</c:if>
		 <c:if test="${renListingVO.lisDryer==1}">???</c:if></span></li>
                                         <li><span class="list__label">??????</span><span class="list__content"><c:if test="${renListingVO.lisTc==0}">??????</c:if>
		 <c:if test="${renListingVO.lisTc==1}">???</c:if></span></li>
                                         <li><span class="list__label">???</span><span class="list__content"><c:if test="${renListingVO.lisBed==0}">??????</c:if>
		 <c:if test="${renListingVO.lisBed==1}">???</c:if></span></li>
                                         <li><span class="list__label">??????</span><span class="list__content"><c:if test="${renListingVO.lisCabinet==0}">??????</c:if>
		 <c:if test="${renListingVO.lisCabinet==1}">???</c:if></span></li>
                                         <li><span class="list__label">??????</span><span class="list__content"><c:if test="${renListingVO.lisSofa==0}">??????</c:if>
		 <c:if test="${renListingVO.lisSofa==1}">???</c:if></span></li>
                                         
                     </ul>
          </div>
          <div class="block__info-detail">
                  <h3 class="title-4">????????????</h3>
          <div class="content"><p><span style="font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:400;color:rgb(153,0,0);">&nbsp;&nbsp;<span style="font-family:'??????????????????W7';"></span></span><br><br><span style="font-size:12px;font-style:normal;font-weight:400;font-family:'??????????????????W7';"><span style="font-size:22pt;"><span style="color:#0000FF;"><%=renListingVO.getLisAbt()%></span></span></span><br><br></div>
          
                <p class="remark">??????????????????????????????????????????????????????????????????????????????????????????????????????</p>
      
    
             
		
		</ul>
	</main>
	<script src="<%=request.getContextPath() %>/js/jquery-3.2.1.slim.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/imagesloaded.pkgd.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/imagesloaded.pkgd.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/main.js"></script>
	

</body>
</html>