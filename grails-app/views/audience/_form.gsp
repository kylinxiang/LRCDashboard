<%@ page import="LRC.Audience" %>



<div class="fieldcontain ${hasErrors(bean: audienceInstance, field: 'mailAddress', 'error')} required">
	<label for="mailAddress">
		<g:message code="audience.mailAddress.label" default="Mail Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mailAddress" required="" value="${audienceInstance?.mailAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: audienceInstance, field: 'isbcc', 'error')} ">
	<label for="isbcc">
		<g:message code="audience.isbcc.label" default="Isbcc" />
		
	</label>
	<g:checkBox name="isbcc" value="${audienceInstance?.isbcc}" />
</div>

