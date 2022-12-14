<%@page import="ezs.ren_landlord.model.RenLandlordService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%@ page import="ezs.ren_listing.model.*"%>
<%@ page import="ezs.ren_listing_pic.model.*" %>
<%@ page import="ezs.ren_landlord.model.*" %>
<%@ page import="java.util.List" %>

<%-- <%--  <%  Integer memID = (Integer) session.getAttribute("memID");   --%> 
<!-- //  	Integer lddMemId = Integer.valueOf(request.getParameter("lddMemId")); -->
<!-- //    	RenLandlordService renLandlordSvc = new RenLandlordService(); -->
<!-- //    	List<RenLandlordVO>  OneMenDmdList = renLandlordSvc.getOneLandlordbymemid(lddMemId);  -->
<!-- //   	pageContext.setAttribute("OneMenDmdList",OneMenDmdList); -->
<!-- //   	pageContext.setAttribute("lddMemId",lddMemId);  	 -->
<%-- <%--  %> --%> 

<%-- <%-- <% --%> 
<!-- // RenFavoritesVO renFavoritesVO = (RenFavoritesVO) request.getAttribute("renFavoritesVO"); -->
<!-- // Integer memID = (Integer)session.getAttribute("memID"); -->
<!-- // RenFavoritesService renFavSvc = new RenFavoritesService(); -->
<!-- // String favLisId = (String) request.getParameter("favLisId"); -->
<!-- // pageContext.setAttribute("favLisId", favLisId); -->
<%-- <%-- %> --%> 

<%--  <% List<RenLandlordVO>  OneMenDmdList = renLandlordSvc.getOneLandlordbymemid(lddMemId); --%>
<%--   pageContext.setAttribute("OneMenDmdList",OneMenDmdList);%>  --%>

<% 
   RenListingVO renListingVO = (RenListingVO) request.getAttribute("renListingVO");
   %>
<%-- <%-- <% --%> 
<!-- // Integer memID = (Integer)session.getAttribute("memID"); -->
<!-- //  RenListingService renListingSvc = new RenListingService(); -->
<!-- //  Integer lisLddID = Integer.valueOf( request.getParameter("lisLddID")); -->
<!-- //  pageContext.setAttribute(name, value); -->
<%-- <%--  %>  --%> 
<%= renListingVO == null %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>EASY SPACE</title>
<style>
  table#table-1 {
	background-color: #c27f29;
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
	width: 600px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>???????????? - addEmp.jsp</h3></td><td>
		 <h4><a href="listing_select_page.jsp">???HOME PAGE</a></h4>
	</td></tr>
</table>

<h3>??????????????????:<font color = red><b>*</b></font>?????????</h3>


<%-- ???????????? --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">Fix:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" enctype="multipart/form-data" ACTION="RenListingServlet.do" name="form1">

<table>
	<tr>
		<td>??????ID<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisLddID" maxlength="25" size="45"
			value="${lddMemId}"/>
		
		</td>
	</tr>
	<jsp:useBean id= "renRoomtypeSvc" scope="page" class="ezs.ren_roomtype.model.RenRoomtypeService"/>
	<tr>
		<td>????????????<font color = red><b>*</b></font></td>
			<td><select size="1" name="lisRtID">
			<c:forEach var="renRoomtypeVO" items="${renRoomtypeSvc.all}">
				<option value="${renRoomtypeVO.rtID}" ${(renListingVO.lisRtID == renRoomtypeVO.rtID)? 'selected':'' } >${renRoomtypeVO.rtType}
			</c:forEach>
		</select></td>
	<tr>
		<td>????????????<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisTitle" maxlength="25" size="45"
			value="<%= (renListingVO==null)? "??????:?????????????????????????????????!": renListingVO.getLisTitle() %>"/></td>
	</tr>
	<jsp:useBean id= "renLocationSvc" scope="page" class="ezs.ren_location.model.RenLocationService"/>
	<tr>
		<td>??????<font color = red><b>*</b></font></td>
			<td><select size="1" name="lisAreaID">
				<c:forEach var="renLocationVO" items="${renLocationSvc.all}">
					<option value="${renLocationVO.locID}" ${(renListingVO.lisAreaID == renLocationVO.locID)? 'selected':'' } >${renLocationVO.locCity}${renLocationVO.locDist}
				</c:forEach>
		</select></td>
	</tr>
	
	<tr>
		<td>??????Address<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisAddress" size="45"	
			value="<%= (renListingVO==null)? "??????:?????????200???": renListingVO.getLisAddress() %>"/></td>
	</tr>
	<tr>
		<td>??????<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisFlr" size="45"
			value="<%= (renListingVO==null)? "??????:3???/5???": renListingVO.getLisFlr() %>"/></td>
	</tr>
	<tr>
		<td>??????<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisSqft" size="45"
			value="<%= (renListingVO==null)? "4.5": renListingVO.getLisSqft() %>"/>  ????????????</td>
	</tr>
	
	<tr>
		<td>????????????<font color = red><b>*</b></font></td>
		<td>?????????<input type="TEXT" name="lisRmNo" size="1"
			value="<%= (renListingVO==null)? "3": renListingVO.getLisRmNo() %>"/>  ????????????</td>
	</tr>
	<tr>
		<td></td>
		<td>??????		<input type="TEXT" name="lisCmnArea" size="1"
			value="<%= (renListingVO==null)? "2": renListingVO.getLisCmnArea() %>"/>  ????????????</td>
	</tr>		
	<tr><td></td>
		<td>??????		<input type="TEXT" name="lisBrNo" size="1"
			value="<%= (renListingVO==null)? "2": renListingVO.getLisBrNo() %>"/>  ????????????</td>
	</tr>
	<tr>
		<td>??????<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisRent" size="1"
			value="<%= (renListingVO==null)? "1000": renListingVO.getLisRent() %>"/>  ???/???</td>
	</tr>
	<tr>
		<td>?????????<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisMngFee" size="1"
			value="<%= (renListingVO==null)? "1000": renListingVO.getLisMngFee() %>"/>  ???/???????????????0</td>
	</tr>
	<tr>
		<td>?????????<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisPfee" size="1"
			value="<%= (renListingVO==null)? "1000": renListingVO.getLisPfee() %>"/>  ???/???????????????0</td>
	</tr>
	<tr>
		<td>??????Address<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisAddress" size="45"	
			value="<%= (renListingVO==null)? "??????:?????????200???": renListingVO.getLisAddress() %>"/></td>
	</tr>
	<tr> 

      
		<td>????????????<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisAbt" size="45"	
			value="<%= (renListingVO==null)? "??????:?????????200???": renListingVO.getLisAbt() %>"/></td>
	
      </tr>
      <tr>
      	<td>??????????????????<font color = red><b>*</b></font></td>
			<td>????????????<select  name="lisEthernet" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisEthernet() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>Wifi<select  name="lisWifi" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisWifi() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>?????????<select  name="lisWh" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisWh() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>????????????<select  name="lisShenc" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisShenc() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>??????<select  name="lisAc" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisAc() %>'  selected >???</option>
			
				<option value='1' >???</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>??????<select  name="lisFridge" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisFridge() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>??????<select  name="lisTv" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisTv() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>?????????<select  name="lisWasher" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisWasher() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>?????????<select  name="lisDryer" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisDryer() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
			??????<select  name="lisTc" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisTc() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			
			<br>
			???<select  name="lisBed" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisBed() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			<br>
			??????<select  name="lisCabinet" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisCabinet() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			<br>
			??????<select  name="lisSofa" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisSofa() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			<br>
			??????<select  name="lisParking" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisParking() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			<br>
			??????<select  name="lisCook" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisCook() %>'  selected >?????????</option>
				
				<option value='1' >??????</option>
				</select>
			<br>
			?????????<select  name="lisPet" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisPet() %>'  selected >?????????</option>
				
				<option value='1' >??????</option>
				</select>
			<br>
			??????<select  name="lisSmoking" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisSmoking() %>'  selected >???</option>
				
				<option value='1' >??????</option>
				</select>
			<br>
			?????????<select  name="lisMonly" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisMonly() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			<br>
			?????????<select  name="lisFonly" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisFonly() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
			<br>
			?????????<select  name="lisSonly" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisSonly() %>'  selected >???</option>
				
				<option value='1' >???</option>
				</select>
				
                 <td>????????????:</td>
				<td><input type="file" id="upfiles" name="lspPic"
					accept="image/gif, image/jpeg, image/png" multiple="multiple" />
					<div id="previews">
						<p>????????????</p>
					</div>
			
			<br>
			<tr>
			 <td></td>
<!-- 			 <td>??????????????????</td> -->
<!-- 			 <td> -->
<%-- 			<select  name="lisStatus" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisStatus() %>'  selected >???</option> --%>
				
<!-- 				<option value='1' >?????????</option> -->
<!-- 				</select> -->
<!-- 			</td> -->
<!-- 			<td>????????????????????????<td> -->
<!-- 			<td> -->
<%-- 			<select  name="lisApproval" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisApproval() %>'  selected >???</option> --%>
<!-- 				<option value='0' >?????????</option> -->
<!-- 				<option value='1' >?????????</option> -->
<!-- 				<option value='2' >????????????</option> -->
<!-- 				</select> -->
<!-- 			</td> -->
			<br>			
			
	<tr>
		<td></td>
		<td>
			<input type="hidden" name="action" value="insert">
			<input type="submit" value="Confirm">
		<td>
		</td>
	</tr>	
</table>
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