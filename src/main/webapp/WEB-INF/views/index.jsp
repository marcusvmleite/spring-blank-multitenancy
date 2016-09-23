<%@ include file="template/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<meta name="_csrf" content="${_csrf.token}" />
	<meta name="_csrf_header" content="${_csrf.headerName}" />
</head>
<body>
	<div class="main-content">
	
		<p>Logged in as</p><sec:authentication property="principal.username" />
		
		<sec:authorize access="isAuthenticated()">
			<c:url value="/j_spring_security_logout" var="logoutUrl" />
			<form action="${logoutUrl}" method="post" id="logoutForm">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			<script>
				function formSubmit() {
					document.getElementById("logoutForm").submit();
				}
			</script>
	 
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<a href="javascript:formSubmit()"> <i class="ace-icon fa fa-power-off"></i>
				Sign out</a>
			</c:if>
		</sec:authorize>
		
	</div>
	
	<script type="text/javascript">
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");

		//Configuring Ajax, if necessary.
		$.ajaxSetup({
			complete : function(xhr, status) {
				if (xhr.responseText == 'invalidSession') {
					window.location = '${contextPath}/login?logout';
				}
				hideLoading();
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader("Accept", "application/json");
				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				xhr.setRequestHeader(header, token);
			}
		});
	</script>
</body>
</html>