<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tags.jsp"%>
<style>
	.nav-header {
		margin-top: 12px !important;
    	width: 11% !important;
	}
	#navbar-container{
		height: 69px;
		padding: 0px;
	}
	
	#sidebar{
		width: 78% !important;
		position: relative !important;
		float: left !important;
		margin-top: 0px !important;
		padding-left: 0px !important;
		padding-right: 0px !important;
	}
	
	.navbar-fixed-top + .main-container{
		padding-top: 80px !important;
	}
	
	.user-info {
		white-space: initial;
	}
</style>
<title>BLANK</title>

<div id="navbar" class="navbar navbar-default    navbar-collapse       h-navbar navbar-fixed-top">
	<div class="navbar-container" id="navbar-container">
		<div class="navbar-header pull-left" style="width: 11%;">
			<c:url value="/index" var="varJson" />
			<!-- #section:basics/navbar.layout.brand -->
			<a href="${varJson}" class="navbar-brand" style="margin-top: 12px;">
			<small>
				<i class="fa fa-automobile"></i>
				BLANK
			</small>
			</a>
		</div>
		<%@ include file="menu.jsp"%>
		<%-- <div class="navbar-header pull-left">
			<!-- #section:basics/navbar.layout.brand -->
			<a href="${url}" class="navbar-brand">
			<small>
				( ${pessoaTenant.filial.nome} )
			</small>
			</a>
		</div> --%>

	<!-- #section:basics/navbar.dropdown -->
	<div class="navbar-buttons navbar-header pull-right  collapse navbar-collapse" style="width: 11%; padding: 0;" role="navigation">
		<ul class="nav ace-nav">
			<!-- #section:basics/navbar.user_menu -->
			<%-- <c:if test="${temTroca}">
				<li id="unidades" class="grey">
					<a href="${contextPath}/escolher" aria-expanded="false">
						<i class="ace-icon fa fa-tasks"></i>
						<span class="badge badge-grey">Trocar Filial</span>
					</a>
				</li>
			</c:if> --%>
			<li class="green" style="height: 69px;">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#" style="padding:10px !important;">
					<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
					<!-- <span id="spanCountNew" class="badge badge-success">0</span> -->
				</a>

				<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
					<li class="dropdown-header">
						<i class="ace-icon fa fa-envelope-o"></i>
						0 Mensagens
					</li>

					<!-- <li class="dropdown-content ace-scroll" style="position: relative;"><div class="scroll-track" style="display: none;"><div class="scroll-bar"></div></div><div class="scroll-content" style="max-height: 200px;">
						<ul class="dropdown-menu dropdown-navbar">
							<li>
								<a href="#" class="clearfix">
									<img src="dist/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar">
									<span class="msg-body">
										<span class="msg-title">
											<span class="blue">Alex:</span>
											Ciao sociis natoque penatibus et auctor ...
										</span>

										<span class="msg-time">
											<i class="ace-icon fa fa-clock-o"></i>
											<span>a moment ago</span>
										</span>
									</span>
								</a>
							</li>

							<li>
								<a href="#" class="clearfix">
									<img src="dist/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar">
									<span class="msg-body">
										<span class="msg-title">
											<span class="blue">Susan:</span>
											Vestibulum id ligula porta felis euismod ...
										</span>

										<span class="msg-time">
											<i class="ace-icon fa fa-clock-o"></i>
											<span>20 minutes ago</span>
										</span>
									</span>
								</a>
							</li>

							<li>
								<a href="#" class="clearfix">
									<img src="dist/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar">
									<span class="msg-body">
										<span class="msg-title">
											<span class="blue">Bob:</span>
											Nullam quis risus eget urna mollis ornare ...
										</span>

										<span class="msg-time">
											<i class="ace-icon fa fa-clock-o"></i>
											<span>3:15 pm</span>
										</span>
									</span>
								</a>
							</li>

							<li>
								<a href="#" class="clearfix">
									<img src="dist/avatars/avatar2.png" class="msg-photo" alt="Kate's Avatar">
									<span class="msg-body">
										<span class="msg-title">
											<span class="blue">Kate:</span>
											Ciao sociis natoque eget urna mollis ornare ...
										</span>

										<span class="msg-time">
											<i class="ace-icon fa fa-clock-o"></i>
											<span>1:33 pm</span>
										</span>
									</span>
								</a>
							</li>

							<li>
								<a href="#" class="clearfix">
									<img src="dist/avatars/avatar5.png" class="msg-photo" alt="Fred's Avatar">
									<span class="msg-body">
										<span class="msg-title">
											<span class="blue">Fred:</span>
											Vestibulum id penatibus et auctor  ...
										</span>

										<span class="msg-time">
											<i class="ace-icon fa fa-clock-o"></i>
											<span>10:09 am</span>
										</span>
									</span>
								</a>
							</li>
						</ul>
					</div></li> -->

					<li class="dropdown-footer">
						<c:url value="/mensagem/formulario" var="url" />
						<a href="${url}">
							Ver todas as mensagens
							<i class="ace-icon fa fa-arrow-right"></i>
						</a>
					</li>
				</ul>
			</li>
			<li class="light-blue" style="height: 69px; width: 66%;">
				<a data-toggle="dropdown" href="#" class="dropdown-toggle" style="padding: 10px !important;">
					<%-- <img cass="nav-user-photo" src="<c:url value="/resources/avatars/user.jpg"/>" alt="Jason's Photo"> --%>
					<span class="user-info">
						<small>Olá,</small>
						<sec:authentication property="principal.pessoa.nome" />
					</span>

					<i class="ace-icon fa fa-caret-down"></i>
				</a>

				<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
					<%-- <li>
						<a href="${contextPath}/indexConfiguracoes">
							<i class="ace-icon fa fa-cog"></i>
							Administrativo
						</a>
					</li> --%>

					<li>
						<a href="<c:url value="/usuario/perfil"/>">
							<i class="ace-icon fa fa-user"></i>
							Meu Perfil
						</a>
					</li>

					<li class="divider"></li>

					<li>
						<sec:authorize access="isAuthenticated()">
							<!-- For login user -->
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
								Sair</a>
							</c:if>
						</sec:authorize>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</div>
<!-- <div id="dialog" title="Escolha a Unidade desejada">
	<p id="selecione" class="text-center"></p>
</div> -->
</div>
