
<%@ page import="LRC.RegressionCase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regressionCase.label', default: 'RegressionCase')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-regressionCase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-regressionCase" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list regressionCase">
			
				<g:if test="${regressionCaseInstance?.caseName}">
				<li class="fieldcontain">
					<span id="caseName-label" class="property-label"><g:message code="regressionCase.caseName.label" default="Case Name" /></span>
					
						<span class="property-value" aria-labelledby="caseName-label"><g:fieldValue bean="${regressionCaseInstance}" field="caseName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regressionCaseInstance?.belongTeam}">
				<li class="fieldcontain">
					<span id="belongTeam-label" class="property-label"><g:message code="regressionCase.belongTeam.label" default="Belong Team" /></span>
					
						<span class="property-value" aria-labelledby="belongTeam-label"><g:fieldValue bean="${regressionCaseInstance}" field="belongTeam"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${regressionCaseInstance?.targetLoad}">
				<li class="fieldcontain">
					<span id="targetLoad-label" class="property-label"><g:message code="regressionCase.targetLoad.label" default="Target Load" /></span>
						<span class="property-value" aria-labelledby="targetLoad-label"><g:fieldValue bean="${regressionCaseInstance}" field="targetLoad"/></span>
				</li>
				</g:if>				
			
				<g:if test="${regressionCaseInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="regressionCase.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${regressionCaseInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regressionCaseInstance?.failureReason}">
				<li class="fieldcontain">
					<span id="failureReason-label" class="property-label"><g:message code="regressionCase.failureReason.label" default="Failure Reason" /></span>
					
						<span class="property-value" aria-labelledby="failureReason-label"><g:fieldValue bean="${regressionCaseInstance}" field="failureReason"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regressionCaseInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="regressionCase.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${regressionCaseInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regressionCaseInstance?.duration}">
				<li class="fieldcontain">
					<span id="duration-label" class="property-label"><g:message code="regressionCase.duration.label" default="Duration" /></span>
					
						<span class="property-value" aria-labelledby="duration-label"><g:fieldValue bean="${regressionCaseInstance}" field="duration"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regressionCaseInstance?.priority}">
				<li class="fieldcontain">
					<span id="priority-label" class="property-label"><g:message code="regressionCase.priority.label" default="Priority" /></span>
					
						<span class="property-value" aria-labelledby="priority-label"><g:fieldValue bean="${regressionCaseInstance}" field="priority"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${regressionCaseInstance?.id}" />
					<g:link class="edit" action="edit" id="${regressionCaseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
