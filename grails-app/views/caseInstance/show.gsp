
<%@ page import="LRC.CaseInstance" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'caseInstance.label', default: 'CaseInstance')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-caseInstance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-caseInstance" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list caseInstance">
			
				<g:if test="${caseInstanceInstance?.caseName}">
				<li class="fieldcontain">
					<span id="caseName-label" class="property-label"><g:message code="caseInstance.caseName.label" default="Case Name" /></span>
					
						<span class="property-value" aria-labelledby="caseName-label"><g:fieldValue bean="${caseInstanceInstance}" field="caseName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseInstanceInstance?.featrueName}">
				<li class="fieldcontain">
					<span id="featrueName-label" class="property-label"><g:message code="caseInstance.featrueName.label" default="Featrue Name" /></span>
					
						<span class="property-value" aria-labelledby="featrueName-label"><g:fieldValue bean="${caseInstanceInstance}" field="featrueName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseInstanceInstance?.nextExecutionNumber}">
				<li class="fieldcontain">
					<span id="nextExecutionNumber-label" class="property-label"><g:message code="caseInstance.nextExecutionNumber.label" default="Next Execution Number" /></span>
					
						<span class="property-value" aria-labelledby="nextExecutionNumber-label"><g:fieldValue bean="${caseInstanceInstance}" field="nextExecutionNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseInstanceInstance?.domainName}">
				<li class="fieldcontain">
					<span id="domainName-label" class="property-label"><g:message code="caseInstance.domainName.label" default="Domain Name" /></span>
					
						<span class="property-value" aria-labelledby="domainName-label"><g:fieldValue bean="${caseInstanceInstance}" field="domainName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseInstanceInstance?.executionStatus}">
				<li class="fieldcontain">
					<span id="executionStatus-label" class="property-label"><g:message code="caseInstance.executionStatus.label" default="Execution Status" /></span>
					
						<span class="property-value" aria-labelledby="executionStatus-label"><g:fieldValue bean="${caseInstanceInstance}" field="executionStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseInstanceInstance?.duration}">
				<li class="fieldcontain">
					<span id="duration-label" class="property-label"><g:message code="caseInstance.duration.label" default="Duration" /></span>
					
						<span class="property-value" aria-labelledby="duration-label"><g:fieldValue bean="${caseInstanceInstance}" field="duration"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseInstanceInstance?.startTime}">
				<li class="fieldcontain">
					<span id="startTime-label" class="property-label"><g:message code="caseInstance.startTime.label" default="Start Time" /></span>
					
						<span class="property-value" aria-labelledby="startTime-label"><g:fieldValue bean="${caseInstanceInstance}" field="startTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseInstanceInstance?.targetDB}">
				<li class="fieldcontain">
					<span id="targetDB-label" class="property-label"><g:message code="caseInstance.targetDB.label" default="Target DB" /></span>
					
						<span class="property-value" aria-labelledby="targetDB-label"><g:fieldValue bean="${caseInstanceInstance}" field="targetDB"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${caseInstanceInstance?.id}" />
					<g:link class="edit" action="edit" id="${caseInstanceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
