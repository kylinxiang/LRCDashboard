<%@ page import="LRC.RegressionRecord" %>



<div class="fieldcontain ${hasErrors(bean: regressionRecordInstance, field: 'executedLoadNumber', 'error')} required">
	<label for="executedLoadNumber">
		<g:message code="regressionRecord.executedLoadNumber.label" default="Executed Load Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="executedLoadNumber" type="number" value="${regressionRecordInstance.executedLoadNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionRecordInstance, field: 'executedNumber', 'error')} required">
	<label for="executedNumber">
		<g:message code="regressionRecord.executedNumber.label" default="Executed Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="executedNumber" type="number" value="${regressionRecordInstance.executedNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionRecordInstance, field: 'executionDuration', 'error')} required">
	<label for="executionDuration">
		<g:message code="regressionRecord.executionDuration.label" default="Execution Duration" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="executionDuration" type="number" value="${regressionRecordInstance.executionDuration}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionRecordInstance, field: 'failedNumber', 'error')} required">
	<label for="failedNumber">
		<g:message code="regressionRecord.failedNumber.label" default="Failed Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="failedNumber" type="number" value="${regressionRecordInstance.failedNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionRecordInstance, field: 'passedNumber', 'error')} required">
	<label for="passedNumber">
		<g:message code="regressionRecord.passedNumber.label" default="Passed Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="passedNumber" type="number" value="${regressionRecordInstance.passedNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionRecordInstance, field: 'recordTime', 'error')} ">
	<label for="recordTime">
		<g:message code="regressionRecord.recordTime.label" default="Record Time" />
		
	</label>
	<g:textField name="recordTime" value="${regressionRecordInstance?.recordTime}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionRecordInstance, field: 'regressionID', 'error')} required">
	<label for="regressionID">
		<g:message code="regressionRecord.regressionID.label" default="Regression ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="regressionID" type="number" value="${regressionRecordInstance.regressionID}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionRecordInstance, field: 'totalNumber', 'error')} required">
	<label for="totalNumber">
		<g:message code="regressionRecord.totalNumber.label" default="Total Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalNumber" type="number" value="${regressionRecordInstance.totalNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regressionRecordInstance, field: 'valuedDuration', 'error')} required">
	<label for="valuedDuration">
		<g:message code="regressionRecord.valuedDuration.label" default="Valued Duration" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valuedDuration" type="number" value="${regressionRecordInstance.valuedDuration}" required=""/>
</div>

