
<%@ page import="toptrouxas.Historia" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'historia.label', default: 'Historia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-historia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/usuario')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-historia" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'historia.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'historia.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="titulo" title="${message(code: 'historia.titulo.label', default: 'Titulo')}" />
					
						<th><g:message code="historia.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${historiaInstanceList}" status="i" var="historiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${historiaInstance.id}">${fieldValue(bean: historiaInstance, field: "dateCreated")}</g:link></td>
					
						<td>${fieldValue(bean: historiaInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: historiaInstance, field: "titulo")}</td>
					
						<td>${fieldValue(bean: historiaInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${historiaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
