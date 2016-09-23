<html>
	<head>
		<%@ include file="template/layout.jsp"%>
	</head>
<body>
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->

		<div class="error-container">
			<div class="well">
				<h1 class="grey lighter smaller">
					<span class="blue bigger-125"> <i
						class="ace-icon fa fa-sitemap"></i> 404
					</span> Página Não Encontrada
				</h1>

				<hr>
				<h3 class="lighter smaller">Esta página não pode ser encontrada no sistema.</h3>

				<div>
					<!-- <form class="form-search">
						<span class="input-icon align-middle"> <i
							class="ace-icon fa fa-search"></i> <input type="text"
							class="search-query" placeholder="PROCURE POR ALGO...">
						</span>
						<button class="btn btn-sm" type="button">Buscar!</button>
					</form>

					<div class="space"></div> -->
					<h4 class="smaller">Tente alguma de nossas sugestões:</h4>

					<ul class="list-unstyled spaced inline bigger-110 margin-15">
						<li><i class="ace-icon fa fa-hand-o-right blue"></i> Verifique a URL e veja se há algum erro</li>

						<li><i class="ace-icon fa fa-hand-o-right blue"></i> Veja o Mapa do Sistema</li>
						
						<li><i class="ace-icon fa fa-hand-o-right blue"></i> Veja o Dicionário</li>

						<li><i class="ace-icon fa fa-hand-o-right blue"></i> Entre em contato com a Equipe de Suporte</li>
					</ul>
				</div>

				<hr>
				<div class="space"></div>

				<div class="center">
					<a href="javascript:history.back()" class="btn btn-grey"> <i
						class="ace-icon fa fa-arrow-left"></i> Voltar
					<c:url value="/index" var="url" />
					</a> <a href="${url}" class="btn btn-primary"> <i
						class="ace-icon fa fa-home"></i> Início
					</a>
				</div>
			</div>
		</div>

		<!-- PAGE CONTENT ENDS -->
	</div>
	
	<%@ include file="template/layoutBottom.jsp"%>
</body>
</html>
