    <div id="right-menu" class="modal aside" data-body-scroll="false" data-offset="true" data-placement="right" data-fixed="true" data-backdrop="invisible" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header no-padding">
					<div class="table-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							<span class="white">&times;</span>
						</button>
						Avisos
					</div>
				</div>
				<div class="modal-body">
				</div>
			</div>
			<button class="aside-trigger btn btn-info btn-app btn-xs ace-settings-btn" data-target="#right-menu" data-toggle="modal" type="button">
				<i data-icon1="fa-plus" data-icon2="fa-minus" class="ace-icon fa fa-plus bigger-110 icon-only"></i>
			</button>
		</div>
	</div>
    
    <script src="<c:url value="/resources/js/principal.min.js"/>" ></script>
    
    <c:url value="/hello" var="url" />
	<a id="hello" href="${url}"></a>
	<c:url value="/notify" var="url" />
	<a id="notify" href="${url}"></a>
    
    <%-- <script src="<c:url value="/resources/js/jquery.min.js"/>" ></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>" ></script>
    <script src="<c:url value="/resources/js/ace/ace.js" />" ></script>
    <script src="<c:url value="/resources/js/jquery-ui.min.js"/>" ></script>
	<script src="<c:url value="/resources/js/ace-extra.min.js" />" ></script>
	<script src="<c:url value="/resources/js/jquery.validate.min.js"/>" ></script>	
	<script src="<c:url value="/resources/js/additional-methods.min.js"/>" ></script>
    <script src="<c:url value="/resources/js/ace/commons-sidebar.js" />" ></script>
    <script src="<c:url value="/resources/js/ace.ajax-content.js"/>" ></script>
    <script src="<c:url value="/resources/js/content-slider.js"/>" ></script> --%>
	<script type="text/javascript">
		jQuery(function($) {
			 $('#navbar').addClass('h-navbar');
			 $('#main-container').prepend($('.main-content'));
			 $('.footer').insertAfter('.page-content');
			 $('.page-content').addClass('main-content');
		})
	</script>

	<script type="text/javascript" >
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		//Configuração que será usada por todas as chamadas AJAX da aplicação,
		//servindo para verificar se a sessão expirou. Sucesso total.
		$.ajaxSetup({
		    complete: function(xhr, status) {
	             if (xhr.responseText == 'invalidSession') {
	                 window.location = '${contextPath}/login?logout';
	             }
	             hideLoading();
	         } ,
			beforeSend: function(xhr){
	  			xhr.setRequestHeader("Content-Type","application/json");
	  			xhr.setRequestHeader("Accept","application/json");
	  			var token = $("meta[name='_csrf']").attr("content");
	  			var header = $("meta[name='_csrf_header']").attr("content");
	  			xhr.setRequestHeader(header, token);
	  			xhr.always = function(){
	  				hideLoading();
	  			}
	  			showLoading();
			}
	     });

		$.extend($.validator.messages, {
		    required: "Campo Obrigatório.",
		    remote: "Corrija esse campo.",
		    email: "Email inválido.",
		    url: "Entre com uma URL válida.",
		    date: "Entre com uma data válida.",
		    dateISO: "Entre com uma data válida (ISO).",
		    number: "Entre com um número válido.",
		    digits: "Somente digitos.",
		    creditcard: "Entre com um número de cartão de crédito válido.",
		    equalTo: "Entre com o mesmo valor novamente.",
		    accept: "Entre com um valor com extensão válida.",
		    maxlength: jQuery.validator.format("No máximo {0} caracteres."),
		    minlength: jQuery.validator.format("No mínimo {0} caracteres."),
		    rangelength: jQuery.validator.format("Entre com um valor entre {0} e {1}."),
		    range: jQuery.validator.format("Entre com um valor entre {0} e {1}."),
		    max: jQuery.validator.format("Entre com um valor menor ou igual a {0}."),
		    min: jQuery.validator.format("Entre com um valor maior ou igual a {0}.")
		});

		//permitir html no title dos jquery dialog
		$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
		    _title: function(title) {
		        if (!this.options.title ) {
		            title.html("&#160;");
		        } else {
		            title.html(this.options.title);
		        }
		    }
		}));

		function showLoading(){
			$('#div_loader').show();
			$('#div_center').show();
		}
		function hideLoading(){
			$('#div_loader').hide();
			$('#div_center').hide();
		}
		$( "#dialog" ).dialog({
		      resizable: false,
		      height:140,
		      modal: true,
		      autoOpen: false,
		      buttons: {
		          "Confirmar": function() {
		            $( this ).dialog( "close" );
		          },
		          "Cancelar": function() {
		            $( this ).dialog( "close" );
		          }
		        }
		    });
		$('#unidades').click(function() {
			$( "#dialog" ).dialog('open');
		});

		/*--------------------ATIVAR MENU ATUAL ------------------------ INÍCIO*/
		if('${activatedMenu}'!=''){
			$($('#sidebar').find('.nav-list').find('li:contains("${activatedMenu}")')[0]).addClass('active');
		}
		if('${activatedMenuLateral}'!=''){
			$($('#sidebar').find('.nav-list').find('li:contains("${activatedMenuLateral}")')[1]).addClass('active');
			//$('#sidebar2').find('.nav-list').find('li:contains("${activatedMenuLateral}")').addClass('active');
// 			$('#sidebar2').find('.nav-list').find('li:contains("${activatedMenuLateral}")').filter(function() {
// 				return $(this).text().trim() == '${activatedMenuLateral}';
// 			}).addClass('active');
		}
		/*--------------------ATIVAR MENU ATUAL ------------------------ FIM*/
		
		//$('#sidebar2').insertBefore('.page-content').ace_sidebar('collapse', false);
		
// 		//scripts temporários
// 		$('.skin-1 .navbar').css('background','none repeat scroll 0 0 #06a058');
// 		$('.skin-1 .sidebar').css('background','none repeat scroll 0 0 #06a058');
// 		$('.skin-1 .nav-list > li > a').css('background-color','darkslategrey');
	</script>
	
    <script type="text/javascript">
        function setConnected(connected) {
            document.getElementById('connect').disabled = connected;
            document.getElementById('disconnect').disabled = !connected;
            document.getElementById('conversationDiv').style.visibility = connected ? 'visible' : 'hidden';
            document.getElementById('response').innerHTML = '';
        }

        function connect() {
        	if ('WebSocket' in window){
        		  console.log('Websocket supported');
        		  socket = new WebSocket('ws://localhost:8080/websocket');

        		  console.log('Connection attempted');

        		  socket.onopen = function(){
        			   console.log('Connection open!');
        			   setConnected(true);
        			}

        		  socket.onclose = function(){
        			  console.log('Disconnecting connection');
       			  }

        		  socket.onmessage = function (evt) 
        		     { 
        		        var received_msg = evt.data;
        		        console.log(received_msg);
        		        console.log('message received!');
        		        //showMessage(received_msg);
        		        $.gritter.add({
                 			title: 'Notificação',
                 			text: received_msg,
                 			class_name: '${tipoMessage}',
                 			time: '6000'
                 		});
        		     }

        		} else {
        		  console.log('Websocket not supported');
        		}
        }

        function disconnect() {
            setConnected(false);
            console.log("Disconnected");
        }

        function sendName() {
            var message = 'aaaai papai';
            socket.send(JSON.stringify({ 'message': message }));
        }

        function showMessage(message) {
            var response = document.getElementById('response');
            var p = document.createElement('p');
            p.style.wordWrap = 'break-word';
            p.appendChild(document.createTextNode(message));
            response.appendChild(p);
        }

        //connect();

</script>
    
<script type="text/javascript">
//------------------- FUNÇÕES MOSTRAR MENSAGENS ------------------------------------------------------- INÍCIO-------------------------------------------------

function mostrarGritter(response){
	var msg;
	if(response.responseText != undefined && response.responseText != ""){
		msg = JSON.parse(response.responseText);
	} else {
		msg = response;
	}
	$.gritter.add({
		title: msg.titleMessage,
		text: msg.message,
		class_name: msg.tipoMsgGritter,
		time: '6000'
	});
	return true;
}

function errorSalvar(response){
	var msg;
	try {
		msg = JSON.parse(response.responseText);
		$.gritter.add({
			title: msg.titleMessage,
			text: msg.message,
			class_name: msg.tipoMsgGritter,
			time: '6000'
		});
	} catch (e){
		$.gritter.add({
			title: 'Erro',
			text: 'Não foi possível salvar. Tente Novamente.',
			class_name: 'gritter-error gritter-center gritter-light',
			time: '6000'
		});
	}
}

function exibirMensagemValidacao(titulo,mensagem){
	$.gritter.add({
		title: titulo,
		text: mensagem,
		sticky: false,
		class_name: 'gritter-warning gritter-light',
		time: '1500'
	});
}

</script>    
    
    <div>
	    <!-- <div>
	        <button id="connect" onclick="connect();">Connect</button>
	        <button id="disconnect" disabled="disabled" onclick="disconnect();">Disconnect</button>
	    </div> -->
	    <div id="conversationDiv">
	        <!-- <label>What is your name?</label><input type="text" id="name" />
	        <button id="sendName" onclick="sendName();">Send</button> -->
	        <p id="response"></p>
	    </div>
	</div>
