<%@ page import="LRC.Regression" %>



<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'targetLoadName', 'error')} required">
	<label for="targetLoadName">
		<g:message code="regression.targetLoadName.label" default="Target Load Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="targetLoadName" maxlength="50" required="" value="${regressionInstance?.targetLoadName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'targetReleaeBranch', 'error')} required">
	<label for="targetReleaeBranch">
		<g:message code="regression.targetReleaeBranch.label" default="Target Releae Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="targetReleaeBranch" required="" value="${regressionInstance?.targetReleaeBranch}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'executionStartTime', 'error')} required">
	<label for="executionStartTime">
		<g:message code="regression.executionStartTime.label" default="Execution Start Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="executionStartTime" required="" value="${regressionInstance?.executionStartTime}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'executionFinishedTime', 'error')} ">
	<label for="executionFinishedTime">
		<g:message code="regression.executionFinishedTime.label" default="Execution Finished Time" />
		
	</label>
	<g:textField name="executionFinishedTime" value="${regressionInstance?.executionFinishedTime}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="regression.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="200" rows="5" maxlength="1000" value="${regressionInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'criticalNumber', 'error')} required">
	<label for="criticalNumber">
		<g:message code="regression.criticalNumber.label" default="Critical Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="criticalNumber" type="number" min="0" value="${regressionInstance.criticalNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'criticalPassNumber', 'error')} required">
	<label for="criticalPassNumber">
		<g:message code="regression.criticalPassNumber.label" default="Critical Pass Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="criticalPassNumber" type="number" min="0" value="${regressionInstance.criticalPassNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'allNumber', 'error')} required">
	<label for="allNumber">
		<g:message code="regression.allNumber.label" default="All Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="allNumber" type="number" min="0" value="${regressionInstance.allNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'allPassNumber', 'error')} required">
	<label for="allPassNumber">
		<g:message code="regression.allPassNumber.label" default="All Pass Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="allPassNumber" type="number" min="0" value="${regressionInstance.allPassNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'allExecutionMinutes', 'error')} required">
	<label for="allExecutionMinutes">
		<g:message code="regression.allExecutionMinutes.label" default="All Execution Minutes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="allExecutionMinutes" type="number" min="0" value="${regressionInstance.allExecutionMinutes}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'valuedATDuration', 'error')} required">
	<label for="valuedATDuration">
		<g:message code="regression.valuedATDuration.label" default="Valued AT Execution Minutes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valuedATDuration" type="number" min="0" value="${regressionInstance.valuedATDuration}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'valuedCBRDuration', 'error')} required">
	<label for="valuedCBRDuration">
		<g:message code="regression.valuedCBRDuration.label" default="Valued CBR Execution Minutes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valuedCBRDuration" type="number" min="0" value="${regressionInstance.valuedCBRDuration}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'cbrLevel', 'error')} required">
	<label for="cbrLevel">
		<g:message code="regression.cbrLevel.label" default="Cbr Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="cbrLevel" from="${regressionInstance.constraints.cbrLevel.inList}" required="" value="${regressionInstance?.cbrLevel}" valueMessagePrefix="regression.cbrLevel"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'cbrStatus', 'error')} required">
	<label for="cbrStatus">
		<g:message code="regression.cbrStatus.label" default="Cbr Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="cbrStatus" from="${regressionInstance.constraints.cbrStatus.inList}" required="" value="${regressionInstance?.cbrStatus}" valueMessagePrefix="regression.cbrStatus"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionInstance, field: 'featureBuilds', 'error')} ">
	<label for="featureBuilds">
		<g:message code="regression.featureBuilds.label" default="Featurebuilds" />
	</label>
	<g:select name="featureBuilds" from="${LRC.FeatureBuild.list()}" multiple="multiple" optionKey="id" size="5" value="${regressionInstance?.featureBuilds*.id}" class="many-to-many"/>
</div>

