<%@ page import="toptrouxas.Voto" %>



<div class="fieldcontain ${hasErrors(bean: votoInstance, field: 'pontuacao', 'error')} required">
	<label for="pontuacao">
		<g:message code="voto.pontuacao.label" default="Pontuacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="pontuacao" min="0" max="10" required="" value="${fieldValue(bean: votoInstance, field: 'pontuacao')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: votoInstance, field: 'comentario', 'error')} ">
	<label for="comentario">
		<g:message code="voto.comentario.label" default="Comentario" />
		
	</label>
	<g:textField name="comentario" value="${votoInstance?.comentario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: votoInstance, field: 'historia', 'error')} required">
	<label for="historia">
		<g:message code="voto.historia.label" default="Historia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="historia" name="historia.id" from="${toptrouxas.Historia.list()}" optionKey="id" required="" value="${votoInstance?.historia?.id}" class="many-to-one"/>
</div>

