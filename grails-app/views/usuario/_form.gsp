<%@ page import="toptrouxas.Usuario"%>

<div
	class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'avatar', 'error')} ">
	<label for="avatar"> <g:message code="usuario.avatar.label"
			default="Avatar" />

	</label> <input type="file" id="avatar" name="avatar" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} ">
	<label for="email"> <g:message code="usuario.email.label"
			default="Email" />

	</label>
	<g:textField name="email" value="${usuarioInstance?.email}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nome', 'error')} ">
	<label for="nome"> <g:message code="usuario.nome.label"
			default="Nome" />

	</label>
	<g:textField name="nome" value="${usuarioInstance?.nome}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'senha', 'error')} ">
	<label for="senha"> <g:message code="usuario.senha.label"
			default="Senha" />

	</label>
	<g:textField name="senha" value="${usuarioInstance?.senha}" />
</div>

