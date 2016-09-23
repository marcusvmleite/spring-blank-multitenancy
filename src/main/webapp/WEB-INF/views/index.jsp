<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="template/tags.jsp"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="template/layout.jsp"%>
	
</head>
<body>

	<div class="main-content">
		<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
			<ul class="breadcrumb">
				<li class="active">
					<i class="ace-icon fa fa-home home-icon"></i>
					Pagina Inicial
				</li>
			</ul><!-- /.breadcrumb -->

			<!-- <div class="col-sm-3 no-padding-right pull-right">
				<input type="text" id="funcionalidade" class="width-100">
			</div> -->
			<div class="col-sm-3 no-padding-right pull-right">
				<input type="text" id="cpf" class="width-100">
			</div>
		</div>
		<div class="main-content-inner">
		<div class="page-content">
			<%-- <div class="row" style="margin-top:40px;">
				<c:url value="/indesSelenium" var="varJson" />
				<a href="${varJson}" target="blank"> LINK SELENIUM</a>
			</div> --%>
			<div class="row">
				<br/><br/><br/><br/><br/><br/><br/>
			</div>
			<div class="row">
				<div class="center">
					<!-- <h4 class="blue text-shadow-black" id="id-company-text">© <b>GESTÃO DE CENTROS DE FORMAÇÃO DE CONDUTORES</b></h4> -->
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="template/layoutBottom.jsp"%>
	
</div>
</body>
</html>