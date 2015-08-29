<%@ page import="LRC.CorrectedPronto" %>



<div class="fieldcontain ${hasErrors(bean: correctedProntoInstance, field: 'prontoID', 'error')} required">
	<label for="prontoID">
		<g:message code="correctedPronto.prontoID.label" default="Pronto ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prontoID" required="" value="${correctedProntoInstance?.prontoID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: correctedProntoInstance, field: 'componentName', 'error')} required">
	<label for="componentName">
		<g:message code="correctedPronto.componentName.label" default="Component Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="componentName" required="" value="${correctedProntoInstance?.componentName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: correctedProntoInstance, field: 'componentBaseLine', 'error')} required">
	<label for="componentBaseLine">
		<g:message code="correctedPronto.componentBaseLine.label" default="Component Base Line" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="componentBaseLine" required="" value="${correctedProntoInstance?.componentBaseLine}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: correctedProntoInstance, field: 'prontoDescription', 'error')} required">
	<label for="prontoDescription">
		<g:message code="correctedPronto.prontoDescription.label" default="Pronto Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prontoDescription" required="" value="${correctedProntoInstance?.prontoDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: correctedProntoInstance, field: 'featurebuilds', 'error')} ">
	<label for="featurebuilds">
		<g:message code="pronto.featurebuilds.label" default="Featurebuilds" />
		
	</label>
	<g:select name="featurebuilds" from="${LRC.FeatureBuild.list()}" multiple="multiple" optionKey="id" size="5" value="${prontoInstance?.featurebuilds*.id}" class="many-to-many"/>
</div>
