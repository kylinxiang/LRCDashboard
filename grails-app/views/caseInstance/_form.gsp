<%@ page import="LRC.CaseInstance" %>



<div class="fieldcontain ${hasErrors(bean: caseInstanceInstance, field: 'caseName', 'error')} required">
	<label for="caseName">
		<g:message code="caseInstance.caseName.label" default="Case Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="caseName" required="" value="${caseInstanceInstance?.caseName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstanceInstance, field: 'featrueName', 'error')} ">
	<label for="featrueName">
		<g:message code="caseInstance.featrueName.label" default="Featrue Name" />
		
	</label>
	<g:textField name="featrueName" value="${caseInstanceInstance?.featrueName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstanceInstance, field: 'nextExecutionNumber', 'error')} required">
	<label for="nextExecutionNumber">
		<g:message code="caseInstance.nextExecutionNumber.label" default="Next Execution Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nextExecutionNumber" required="" value="${caseInstanceInstance?.nextExecutionNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstanceInstance, field: 'domainName', 'error')} required">
	<label for="domainName">
		<g:message code="caseInstance.domainName.label" default="Domain Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="domainName" from="${caseInstanceInstance.constraints.domainName.inList}" required="" value="${caseInstanceInstance?.domainName}" valueMessagePrefix="caseInstance.domainName"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstanceInstance, field: 'executionStatus', 'error')} required">
	<label for="executionStatus">
		<g:message code="caseInstance.executionStatus.label" default="Execution Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="executionStatus" from="${caseInstanceInstance.constraints.executionStatus.inList}" required="" value="${caseInstanceInstance?.executionStatus}" valueMessagePrefix="caseInstance.executionStatus"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstanceInstance, field: 'duration', 'error')} ">
	<label for="duration">
		<g:message code="caseInstance.duration.label" default="Duration" />
		
	</label>
	<g:textField name="duration" value="${caseInstanceInstance?.duration}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstanceInstance, field: 'startTime', 'error')} ">
	<label for="startTime">
		<g:message code="caseInstance.startTime.label" default="Start Time" />
		
	</label>
	<g:textField name="startTime" value="${caseInstanceInstance?.startTime}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstanceInstance, field: 'targetDB', 'error')} ">
	<label for="targetDB">
		<g:message code="caseInstance.targetDB.label" default="Target DB" />
		
	</label>
	<g:textField name="targetDB" value="${caseInstanceInstance?.targetDB}"/>
</div>

