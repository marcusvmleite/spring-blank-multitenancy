<%@ include file="template/tags.jsp"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign in</title>

<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

<meta name="description" content="User Login Page">
</head>

<body>
		<h4>Sign in</h4>
		<form name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'>
			<fieldset>
				<input type="text" class="form-control" name='username' /> 
				<input type="password" class="form-control" name='password' />

				<div class="clearfix">
					<input type="checkbox" name="_spring_security_remember_me" value="yes" />Keep me connected
					<button type="submit" name="submit">Sign in</button>
				</div>

				<div class="space-4"></div>
			</fieldset>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
</body>
</html>
