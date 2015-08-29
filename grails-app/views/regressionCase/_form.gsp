<%@ page import="LRC.RegressionCase" %>



<div class="fieldcontain ${hasErrors(bean: regressionCaseInstance, field: 'caseName', 'error')} required">
	<label for="caseName">
		<g:message code="regressionCase.caseName.label" default="Case Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="caseName" required="" value="${regressionCaseInstance?.caseName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionCaseInstance, field: 'belongTeam', 'error')} required">
	<label for="belongTeam">
		<g:message code="regressionCase.belongTeam.label" default="Belong Team" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="belongTeam" required="" value="${regressionCaseInstance?.belongTeam}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionCaseInstance, field: 'targetLoad', 'error')} required">
	<label for="targetLoad">
		<g:message code="regressionCase.targetLoad.label" default="Executed Load Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="targetLoad" required="" value="${regressionCaseInstance?.targetLoad}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionCaseInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="regressionCase.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${regressionCaseInstance.constraints.status.inList}" required="" value="${regressionCaseInstance?.status}" valueMessagePrefix="regressionCase.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionCaseInstance, field: 'failureReason', 'error')} ">
	<label for="failureReason">
		<g:message code="regressionCase.failureReason.label" default="Failure Reason" />
	</label>
	<g:select name="failureReason" from="${regressionCaseInstance.constraints.failureReason.inList}" required="" value="${regressionCaseInstance?.failureReason}" valueMessagePrefix="regressionCase.failureReason"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionCaseInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="regressionCase.comment.label" default="Comment" />
		
	</label>
	<g:textField name="comment" value="${regressionCaseInstance?.comment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionCaseInstance, field: 'duration', 'error')} ">
	<label for="duration">
		<g:message code="regressionCase.duration.label" default="Duration" />
		
	</label>
	<g:textField name="duration" value="${regressionCaseInstance?.duration}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionCaseInstance, field: 'priority', 'error')} required">
	<label for="priority">
		<g:message code="regressionCase.priority.label" default="Priority" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="priority" from="${regressionCaseInstance.constraints.priority.inList}" required="" value="${regressionCaseInstance?.priority}" valueMessagePrefix="regressionCase.priority"/>
</div>

