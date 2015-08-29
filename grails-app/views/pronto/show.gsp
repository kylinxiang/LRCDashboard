
<%@ page import="LRC.Pronto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pronto.label', default: 'Pronto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pronto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="stat">Statics</g:link></li>
			</ul>
		</div>
		<div id="show-pronto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pronto">
			
				<g:if test="${prontoInstance?.prontoID}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="pronto.prontoID.label" default="pronto ID" /></span>
					
						<span class="property-value" aria-labelledby="prontoID-label"><g:fieldValue bean="${prontoInstance}" field="prontoID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.foundArea}">
				<li class="fieldcontain">
					<span id="foundArea-label" class="property-label"><g:message code="pronto.foundArea.label" default="Found Area" /></span>
					
						<span class="property-value" aria-labelledby="foundArea-label"><g:fieldValue bean="${prontoInstance}" field="foundArea"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="pronto.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${prontoInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="pronto.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:fieldValue bean="${prontoInstance}" field="owner"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="pronto.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${prontoInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.priority}">
				<li class="fieldcontain">
					<span id="priority-label" class="property-label"><g:message code="pronto.priority.label" default="Priority" /></span>
					
						<span class="property-value" aria-labelledby="priority-label"><g:fieldValue bean="${prontoInstance}" field="priority"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.newTime}">
				<li class="fieldcontain">
					<span id="newTime-label" class="property-label"><g:message code="pronto.newTime.label" default="New Time" /></span>
					
						<span class="property-value" aria-labelledby="newTime-label"><g:formatDate date="${prontoInstance?.newTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.closeTime}">
				<li class="fieldcontain">
					<span id="closeTime-label" class="property-label"><g:message code="pronto.closeTime.label" default="Close Time" /></span>
					
						<span class="property-value" aria-labelledby="closeTime-label"><g:formatDate date="${prontoInstance?.closeTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.followUp}">
				<li class="fieldcontain">
					<span id="followUp-label" class="property-label"><g:message code="pronto.followUp.label" default="Follow Up" /></span>
					
						<span class="property-value" aria-labelledby="followUp-label"><g:fieldValue bean="${prontoInstance}" field="followUp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.analyseReason}">
				<li class="fieldcontain">
					<span id="analyseReason-label" class="property-label"><g:message code="pronto.analyseReason.label" default="Analyse Reason" /></span>
					
						<span class="property-value" aria-labelledby="analyseReason-label"><g:fieldValue bean="${prontoInstance}" field="analyseReason"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.daManager}">
				<li class="fieldcontain">
					<span id="daManager-label" class="property-label"><g:message code="pronto.daManager.label" default="Da Manager" /></span>
					
						<span class="property-value" aria-labelledby="daManager-label"><g:fieldValue bean="${prontoInstance}" field="daManager"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.groupInCharge}">
				<li class="fieldcontain">
					<span id="groupInCharge-label" class="property-label"><g:message code="pronto.groupInCharge.label" default="Group In Charge" /></span>
					
						<span class="property-value" aria-labelledby="groupInCharge-label"><g:fieldValue bean="${prontoInstance}" field="groupInCharge"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.lineManager}">
				<li class="fieldcontain">
					<span id="lineManager-label" class="property-label"><g:message code="pronto.lineManager.label" default="Line Manager" /></span>
					
						<span class="property-value" aria-labelledby="lineManager-label"><g:fieldValue bean="${prontoInstance}" field="lineManager"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="pronto.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${prontoInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.correctiveAction}">
				<li class="fieldcontain">
					<span id="correctiveAction-label" class="property-label"><g:message code="pronto.correctiveAction.label" default="Corrective Action" /></span>
					
						<span class="property-value" aria-labelledby="correctiveAction-label"><g:fieldValue bean="${prontoInstance}" field="correctiveAction"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prontoInstance?.featurebuilds}">
				<li class="fieldcontain">
					<span id="featurebuilds-label" class="property-label"><g:message code="pronto.featurebuilds.label" default="Featurebuilds" /></span>
					
						<g:each in="${prontoInstance.featurebuilds}" var="f">
						<span class="property-value" aria-labelledby="featurebuilds-label"><g:link controller="featureBuild" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${prontoInstance?.id}" />
					<g:link class="edit" action="edit" id="${prontoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
