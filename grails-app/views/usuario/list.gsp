
<%@ page import="toptrouxas.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/usuario')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-usuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="avatar" title="${message(code: 'usuario.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'usuario.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="nome" title="${message(code: 'usuario.avatar.label', default: 'Foto')}" />
					
						<th>Historia Recente</th>
						
						<g:sortableColumn property="pontuacao" title="Pontuação" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: usuarioInstance, field: "nome")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "avatar")}<%--<img src="${createLink(controller:'usuario', action:'imagem', id: usuarioInstance.id)}"/>--%></td>
						
							<td>
								<g:if test="${usuarioInstance.historias.size() > 0}">
									<h3>${usuarioInstance.historias.get(usuarioInstance.historias.size() - 1).titulo}</h3>
									<br>
									${usuarioInstance.historias.get(usuarioInstance.historias.size() - 1).descricao}
									<br>
									<g:link controller="voto" action="create" params="['historia.id': usuarioInstance?.historias.get(usuarioInstance.historias.size() - 1).id]">Votar na História</g:link>
									<br>
								</g:if>
								<g:link controller="historia" action="create" params="['usuario.id': usuarioInstance?.id]">Adicionar História</g:link>
							</td>
						
							<td>${fieldValue(bean: usuarioInstance, field: "pontuacaoTotal")}</td>
						</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
