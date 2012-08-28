
<%@ page import="toptrouxas.Voto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'voto.label', default: 'Voto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-voto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/usuario')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-voto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list voto">
			
				<g:if test="${votoInstance?.pontuacao}">
				<li class="fieldcontain">
					<span id="pontuacao-label" class="property-label"><g:message code="voto.pontuacao.label" default="Pontuacao" /></span>
					
						<span class="property-value" aria-labelledby="pontuacao-label"><g:fieldValue bean="${votoInstance}" field="pontuacao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${votoInstance?.comentario}">
				<li class="fieldcontain">
					<span id="comentario-label" class="property-label"><g:message code="voto.comentario.label" default="Comentario" /></span>
					
						<span class="property-value" aria-labelledby="comentario-label"><g:fieldValue bean="${votoInstance}" field="comentario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${votoInstance?.historia}">
				<li class="fieldcontain">
					<span id="historia-label" class="property-label"><g:message code="voto.historia.label" default="Historia" /></span>
					
						<span class="property-value" aria-labelledby="historia-label"><g:link controller="historia" action="show" id="${votoInstance?.historia?.id}">${votoInstance?.historia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${votoInstance?.id}" />
					<g:link class="edit" action="edit" id="${votoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
