
<%@ page import="LRC.CorrectedPronto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'correctedPronto.label', default: 'CorrectedPronto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-correctedPronto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-correctedPronto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list correctedPronto">
			
				<g:if test="${correctedProntoInstance?.prontoID}">
				<li class="fieldcontain">
					<span id="prontoID-label" class="property-label"><g:message code="correctedPronto.prontoID.label" default="Pronto ID" /></span>
					
						<span class="property-value" aria-labelledby="prontoID-label"><g:fieldValue bean="${correctedProntoInstance}" field="prontoID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${correctedProntoInstance?.componentName}">
				<li class="fieldcontain">
					<span id="componentName-label" class="property-label"><g:message code="correctedPronto.componentName.label" default="Component Name" /></span>
					
						<span class="property-value" aria-labelledby="componentName-label"><g:fieldValue bean="${correctedProntoInstance}" field="componentName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${correctedProntoInstance?.componentBaseLine}">
				<li class="fieldcontain">
					<span id="componentBaseLine-label" class="property-label"><g:message code="correctedPronto.componentBaseLine.label" default="Component Base Line" /></span>
					
						<span class="property-value" aria-labelledby="componentBaseLine-label"><g:fieldValue bean="${correctedProntoInstance}" field="componentBaseLine"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${correctedProntoInstance?.prontoDescription}">
				<li class="fieldcontain">
					<span id="prontoDescription-label" class="property-label"><g:message code="correctedPronto.prontoDescription.label" default="Pronto Description" /></span>
						<span class="property-value" aria-labelledby="prontoDescription-label"><g:fieldValue bean="${correctedProntoInstance}" field="prontoDescription"/></span>
				</li>
				</g:if>

				<li class="fieldcontain">
					<span id="prontoDescription-label" class="property-label"><g:message code="correctedPronto.prontoDescription.label" default="Feature Build" /></span>
					<span class="property-value" aria-labelledby="prontoDescription-label">
						<g:each in="${correctedProntoInstance.featurebuilds}" status="i" var="d">
						   <g:link controller="featureBuild" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link><br/>
						</g:each>
					</span>
				</li>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${correctedProntoInstance?.id}" />
					<g:link class="edit" action="edit" id="${correctedProntoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
