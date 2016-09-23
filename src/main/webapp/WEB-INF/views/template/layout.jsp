<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/tags.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<link rel="icon" type="image/ico" href="/resources/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta charset="utf-8">
	<title>BLANK</title>

	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=0.9, maximum-scale=1.0">
	
	<link rel="stylesheet" href="<c:url value="/resources/css/principal.min.css" />">
	
	<!-- Outros plugins auxiliares -->
	<style type="text/css">
		#RemoveListnumber {
	  		list-style: none;
	   	}
	   	.RemoveListnumber {
	  		list-style: none;
	   	}
	
		#div_center {
		   	height: 200px;
		    position: fixed;
		    text-align: center;
		    top: 40%;
		    width: 100%;
		    z-index: 9999;
			display:none;
			font-size: 18px;
		}
		
		#div_loader {
			display:none;
		   	background-color: #E0FFEE;
			position: fixed;
			left: 0px;
			top: 0px;
			width: 100%;
			height: 100%;
			text-align: center;
			z-index: 9000;
			opacity: 0.5;
		}
	</style>
</head>
<body class="no-skin">

	<%@ include file="header.jsp"%>
	
	<div class="main-container" id="main-container">
<%-- 		<%@ include file="menu.jsp"%> --%>
		<%@ include file="footer.jsp"%>
	</div>
	<div id="div_loader" >
	</div>
   	<div id="div_center">
	   	<img src="<c:url value="/resources/img/loading_wheel.GIF"/>" />
	   	<p>AGUARDE</p>
    </div>
    
</body>
</html>
