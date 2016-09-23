<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="warning_message ui-state-error ui-corner-all" style="display: ${errors==null?'none':'true'};">
	<c:forEach var="error" items="${errors}">
	    	<!-- <div id="alerta" class="ui-icon ui-icon-alert"></div> -->
	    	<div id="alertaMessage"> ${error.message}</div>
	</c:forEach>
</div>