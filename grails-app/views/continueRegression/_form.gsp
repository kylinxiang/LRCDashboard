<%@ page import="LRC.ContinueRegression" %>



<div class="fieldcontain ${hasErrors(bean: continueRegressionInstance, field: 'week', 'error')} required">
	<label for="week">
		<g:message code="continueRegression.week.label" default="Week" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="week" from="${1..53}" class="range" required="" value="${fieldValue(bean: continueRegressionInstance, field: 'week')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: continueRegressionInstance, field: 'targetReleaeBranch', 'error')} required">
	<label for="targetReleaeBranch">
		<g:message code="continueRegression.targetReleaeBranch.label" default="Target Releae Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="targetReleaeBranch" required="" value="${continueRegressionInstance?.targetReleaeBranch}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: continueRegressionInstance, field: 'executionStartTime', 'error')} ">
	<label for="executionStartTime">
		<g:message code="continueRegression.executionStartTime.label" default="Execution Start Time" />
		
	</label>
	<g:textField name="executionStartTime" value="${continueRegressionInstance?.executionStartTime}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: continueRegressionInstance, field: 'executionFinishedTime', 'error')} ">
	<label for="executionFinishedTime">
		<g:message code="continueRegression.executionFinishedTime.label" default="Execution Finished Time" />
		
	</label>
	<g:textField name="executionFinishedTime" value="${continueRegressionInstance?.executionFinishedTime}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: continueRegressionInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="continueRegression.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="40" rows="5" maxlength="1000" value="${continueRegressionInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: continueRegressionInstance, field: 'allNumber', 'error')} required">
	<label for="allNumber">
		<g:message code="continueRegression.allNumber.label" default="All Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="allNumber" type="number" min="0" value="${continueRegressionInstance.allNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: continueRegressionInstance, field: 'executedNumber', 'error')} required">
	<label for="executedNumber">
		<g:message code="continueRegression.executedNumber.label" default="Executed Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="executedNumber" type="number" min="0" value="${continueRegressionInstance.executedNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: continueRegressionInstance, field: 'failureNumber', 'error')} required">
	<label for="failureNumber">
		<g:message code="continueRegression.failureNumber.label" default="Failure Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="failureNumber" type="number" min="0" value="${continueRegressionInstance.failureNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: continueRegressionInstance, field: 'allExecutionMinutes', 'error')} required">
	<label for="allExecutionMinutes">
		<g:message code="continueRegression.allExecutionMinutes.label" default="All Execution Minutes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="allExecutionMinutes" type="number" min="0" value="${continueRegressionInstance.allExecutionMinutes}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: continueRegressionInstance, field: 'crLevel', 'error')} required">
	<label for="crLevel">
		<g:message code="continueRegression.crLevel.label" default="Cr Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="crLevel" from="${continueRegressionInstance.constraints.crLevel.inList}" required="" value="${continueRegressionInstance?.crLevel}" valueMessagePrefix="continueRegression.crLevel"/>
</div>

<div class="fieldcontain ${hasErrors(bean: continueRegressionInstance, field: 'crStatus', 'error')} required">
	<label for="crStatus">
		<g:message code="continueRegression.crStatus.label" default="Cr Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="crStatus" from="${continueRegressionInstance.constraints.crStatus.inList}" required="" value="${continueRegressionInstance?.crStatus}" valueMessagePrefix="continueRegression.crStatus"/>
</div>

