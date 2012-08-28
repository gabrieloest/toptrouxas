<%@ page import="toptrouxas.Historia"%>

<div
	class="fieldcontain ${hasErrors(bean: historiaInstance, field: 'descricao', 'error')} ">
	<label for="descricao"> <g:message
			code="historia.descricao.label" default="Descricao" />

	</label>
	<g:textField name="descricao" value="${historiaInstance?.descricao}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: historiaInstance, field: 'titulo', 'error')} ">
	<label for="titulo"> <g:message code="historia.titulo.label"
			default="Titulo" />

	</label>
	<g:textField name="titulo" value="${historiaInstance?.titulo}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: historiaInstance, field: 'usuario', 'error')} required">
	<label for="usuario"> <g:message code="historia.usuario.label"
			default="Usuario" /> <span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id"
		from="${toptrouxas.Usuario.list()}" optionKey="id" required=""
		value="${historiaInstance?.usuario?.id}" class="many-to-one" />
</div>


