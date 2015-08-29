
<%@ page import="LRC.RegressionRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regressionRecord.label', default: 'RegressionRecord')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-regressionRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-regressionRecord" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list regressionRecord">
			
				<g:if test="${regressionRecordInstance?.executedLoadNumber}">
				<li class="fieldcontain">
					<span id="executedLoadNumber-label" class="property-label"><g:message code="regressionRecord.executedLoadNumber.label" default="Executed Load Number" /></span>
					
						<span class="property-value" aria-labelledby="executedLoadNumber-label"><g:fieldValue bean="${regressionRecordInstance}" field="executedLoadNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regressionRecordInstance?.executedNumber}">
				<li class="fieldcontain">
					<span id="executedNumber-label" class="property-label"><g:message code="regressionRecord.executedNumber.label" default="Executed Number" /></span>
					
						<span class="property-value" aria-labelledby="executedNumber-label"><g:fieldValue bean="${regressionRecordInstance}" field="executedNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regressionRecordInstance?.executionDuration}">
				<li class="fieldcontain">
					<span id="executionDuration-label" class="property-label"><g:message code="regressionRecord.executionDuration.label" default="Execution Duration" /></span>
					
						<span class="property-value" aria-labelledby="executionDuration-label"><g:fieldValue bean="${regressionRecordInstance}" field="executionDuration"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regressionRecordInstance?.failedNumber}">
				<li class="fieldcontain">
					<span id="failedNumber-label" class="property-label"><g:message code="regressionRecord.failedNumber.label" default="Failed Number" /></span>
					
						<span class="property-value" aria-labelledby="failedNumber-label"><g:fieldValue bean="${regressionRecordInstance}" field="failedNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regressionRecordInstance?.passedNumber}">
				<li class="fieldcontain">
					<span id="passedNumber-label" class="property-label"><g:message code="regressionRecord.passedNumber.label" default="Passed Number" /></span>
					
						<span class="property-value" aria-labelledby="passedNumber-label"><g:fieldValue bean="${regressionRecordInstance}" field="passedNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regressionRecordInstance?.recordTime}">
				<li class="fieldcontain">
					<span id="recordTime-label" class="property-label"><g:message code="regressionRecord.recordTime.label" default="Record Time" /></span>
					
						<span class="property-value" aria-labelledby="recordTime-label"><g:fieldValue bean="${regressionRecordInstance}" field="recordTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regressionRecordInstance?.regressionID}">
				<li class="fieldcontain">
					<span id="regressionID-label" class="property-label"><g:message code="regressionRecord.regressionID.label" default="Regression ID" /></span>
					
						<span class="property-value" aria-labelledby="regressionID-label"><g:fieldValue bean="${regressionRecordInstance}" field="regressionID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regressionRecordInstance?.totalNumber}">
				<li class="fieldcontain">
					<span id="totalNumber-label" class="property-label"><g:message code="regressionRecord.totalNumber.label" default="Total Number" /></span>
					
						<span class="property-value" aria-labelledby="totalNumber-label"><g:fieldValue bean="${regressionRecordInstance}" field="totalNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regressionRecordInstance?.valuedDuration}">
				<li class="fieldcontain">
					<span id="valuedDuration-label" class="property-label"><g:message code="regressionRecord.valuedDuration.label" default="Valued Duration" /></span>
					
						<span class="property-value" aria-labelledby="valuedDuration-label"><g:fieldValue bean="${regressionRecordInstance}" field="valuedDuration"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${regressionRecordInstance?.id}" />
					<g:link class="edit" action="edit" id="${regressionRecordInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
