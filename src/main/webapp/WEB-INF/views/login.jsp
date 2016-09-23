<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="template/tags.jsp"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Autenticação</title>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<link rel="icon" type="image/ico" href="/resources/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta charset="utf-8">
	
	<meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
	
	<title>BLANK</title>

	<meta name="description" content="User Login Page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

	<link rel="stylesheet" href="<c:url value="/resources/css/login.css" />">

</head>
<!-- onload='document.loginForm.username.focus();'  -->

<body class="login-layout light-login">
	<jsp:useBean id="currentDate" class="java.util.Date" />
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
					<%-- <c:if test="${not empty tipoMessage}">
						<div class="${tipoMessage}">
							<button type="button" class="close" data-dismiss="alert">
								<i class="ace-icon fa fa-times"></i>
							</button>
							<strong>
								<i class="ace-icon fa fa-times"></i>
								${message}
							</strong>
							<br>
						</div>
						<script> 
							setTimeout(function(){
								$('.alert-danger').fadeOut(3000);
								$('.alert-info').fadeOut(3000);
								$('.alert-warning').fadeOut(3000);
							},3000);
						</script>
					</c:if> --%>
						<div class="center">
							<br/><br/><br/>
							<img src="<c:url value="/resources/img/logo.gif" />" alt="Logo"/>
							<!-- <h4 class="blue text-shadow-black" id="id-company-text">&copy; <b>GESTÃO DE CENTROS DE FORMAÇÃO DE CONDUTORES</b></h4> -->
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box" class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="ace-icon glyphicon glyphicon-info-sign"></i>
											Entre com o seu login e senha
										</h4>

										<div class="space-6"></div>
										<form name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST' class="form-signin">
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="text" class="form-control" name='username' placeholder="Login" />
														<i class="ace-icon fa fa-user"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="password" class="form-control" name='password' placeholder="Senha" />
														<i class="ace-icon fa fa-lock"></i>
													</span>
												</label>

												<div class="space"></div>

												<div class="clearfix">
													<label class="inline">
														<input type="checkbox" class="ace" name="_spring_security_remember_me" value="yes"/>
														<span class="lbl"> Manter-me conectado</span>
													</label>

													<button type="submit" name="submit" class="width-35 pull-right btn btn-sm btn-primary">
														<i class="ace-icon fa fa-key"></i>
														<span class="bigger-110">Entrar</span>
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										</form>

									</div><!-- /.widget-main -->

									<div class="toolbar clearfix">
										<div>
											<a href="#" data-target="#forgot-box" class="forgot-password-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												Esqueci minha senha
											</a>
										</div>
									</div>
								</div><!-- /.widget-body -->
							</div><!-- /.login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="ace-icon fa fa-key"></i>
											Recuperação de Senha
										</h4>

										<div class="space-6"></div>
										<p>
											Insira seu e-mail abaixo para receber as instruções
										</p>

										<form>
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="email" class="form-control" placeholder="Email" />
														<i class="ace-icon fa fa-envelope"></i>
													</span>
												</label>

												<div class="clearfix">
													<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
														<i class="ace-icon fa fa-lightbulb-o"></i>
														<span class="bigger-110">Enviar!</span>
													</button>
												</div>
											</fieldset>
										</form>
									</div><!-- /.widget-main -->

									<div class="toolbar center">
										<a href="#" data-target="#login-box" class="back-to-login-link">
											Voltar ao Login
											<i class="ace-icon fa fa-arrow-right"></i>
										</a>
									</div>
								</div><!-- /.widget-body -->
							</div><!-- /.forgot-box -->

						</div><!-- /.position-relative -->

					</div>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.main-content -->
		<div class="footer">
				<div class="footer-inner">
					<div class="footer-content">
						<span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
					</div>
				</div>
			</div>
	</div><!-- /.main-container -->
 	<script src="<c:url value="/resources/js/login.js"/>" ></script>
	<script type="text/javascript">

		if ('${tipoMessage}' != '') {
			$.gritter.add({
				title: 'Erro de validação de senha.',
				text: '${message}',
				class_name: '${tipoMessage}',
				time: '6000'
			});
		}
	
		/* jQuery(function($) {
		 $(document).on('click', '.toolbar a[data-target]', function(e) {
			e.preventDefault();
			var target = $(this).data('target');
			$('.widget-box.visible').removeClass('visible');//hide others
			$(target).addClass('visible');//show target
		 });
		}); */

		/* jQuery(function($) {
		 $('#btn-login-blur').on('click', function(e) {
			$('body').attr('class', 'login-layout blur-login');
			$('#id-text2').attr('class', 'white');
			$('#id-company-text').attr('class', 'light-blue');
			
			e.preventDefault();
		 }); */
	</script>
</body>
</html>
