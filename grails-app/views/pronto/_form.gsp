<%@ page import="LRC.Pronto" %>



<div class="fieldcontain ${hasErrors(bean: prontoInstance, field: 'prontoID', 'error')} required">
	<label for="prontoID">
		<g:message code="pronto.prontoID.label" default="pronto ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prontoID" required="" value="${prontoInstance?.prontoID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prontoInstance, field: 'foundArea', 'error')} required">
	<label for="foundArea">
		<g:message code="pronto.foundArea.label" default="Found Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="foundArea" from="${prontoInstance.constraints.foundArea.inList}" required="" value="${prontoInstance?.foundArea}" valueMessagePrefix="pronto.foundArea"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prontoInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="pronto.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${prontoInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prontoInstance, field: 'owner', 'error')} ">
	<label for="owner">
		<g:message code="pronto.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="owner" from="${prontoInstance.constraints.owner.inList}" required="" value="${prontoInstance?.owner}" valueMessagePrefix="pronto.owner"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prontoInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="pronto.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${prontoInstance.constraints.status.inList}" required="" value="${prontoInstance?.status}" valueMessagePrefix="pronto.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prontoInstance, field: 'priority', 'error')} required">
	<label for="priority">
		<g:message code="pronto.priority.label" default="Priority" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="priority" from="${prontoInstance.constraints.priority.inList}" required="" value="${prontoInstance?.priority}" valueMessagePrefix="pronto.priority"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prontoInstance, field: 'followUp', 'error')} required">
	<label for="followUp">
		<g:message code="pronto.followUp.label" default="Follow Up" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="followUp" from="${prontoInstance.constraints.followUp.inList}" required="" value="${prontoInstance?.followUp}" valueMessagePrefix="pronto.followUp"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prontoInstance, field: 'groupInCharge', 'error')} ">
	<label for="groupInCharge">
		<g:message code="pronto.groupInCharge.label" default="Group In Charge" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="groupInCharge" from="${prontoInstance.constraints.groupInCharge.inList}" required="" value="${prontoInstance?.groupInCharge}" valueMessagePrefix="pronto.groupInCharge"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prontoInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="pronto.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="40" rows="5" maxlength="1000" value="${prontoInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prontoInstance, field: 'impactLevel', 'error')} ">
	<label for="impactLevel">
		<g:message code="pronto.impactLevel.label" default="impactLevel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="impactLevel" from="${prontoInstance.constraints.impactLevel.inList}" required="" value="${prontoInstance?.impactLevel}" valueMessagePrefix="pronto.impactLevel"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prontoInstance, field: 'impactStatus', 'error')} ">
	<label for="impactStatus">
		<g:message code="pronto.impactLevel.label" default="impactStatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="impactStatus" from="${prontoInstance.constraints.impactStatus.inList}" required="" value="${prontoInstance?.impactStatus}" valueMessagePrefix="pronto.impactStatus"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prontoInstance, field: 'correctiveAction', 'error')} ">
	<label for="correctiveAction">
		<g:message code="pronto.correctiveAction.label" default="Corrective Action" />
	</label>
	<g:textField name="correctiveAction" value="${prontoInstance?.correctiveAction}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prontoInstance, field: 'featurebuilds', 'error')} ">
	<label for="featurebuilds">
		<g:message code="pronto.featurebuilds.label" default="Featurebuilds" />
		
	</label>
	<g:select name="featurebuilds" from="${LRC.FeatureBuild.list()}" multiple="multiple" optionKey="id" size="5" value="${prontoInstance?.featurebuilds*.id}" class="many-to-many"/>
</div>

