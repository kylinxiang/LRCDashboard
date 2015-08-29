
<%@ page import="LRC.ContinueRegression" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'continueRegression.label', default: 'ContinueRegression')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-continueRegression" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-continueRegression" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list continueRegression">
			
				<g:if test="${continueRegressionInstance?.week}">
				<li class="fieldcontain">
					<span id="week-label" class="property-label"><g:message code="continueRegression.week.label" default="Week" /></span>
					
						<span class="property-value" aria-labelledby="week-label"><g:fieldValue bean="${continueRegressionInstance}" field="week"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${continueRegressionInstance?.targetReleaeBranch}">
				<li class="fieldcontain">
					<span id="targetReleaeBranch-label" class="property-label"><g:message code="continueRegression.targetReleaeBranch.label" default="Target Releae Branch" /></span>
					
						<span class="property-value" aria-labelledby="targetReleaeBranch-label"><g:fieldValue bean="${continueRegressionInstance}" field="targetReleaeBranch"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${continueRegressionInstance?.executionStartTime}">
				<li class="fieldcontain">
					<span id="executionStartTime-label" class="property-label"><g:message code="continueRegression.executionStartTime.label" default="Execution Start Time" /></span>
					
						<span class="property-value" aria-labelledby="executionStartTime-label"><g:fieldValue bean="${continueRegressionInstance}" field="executionStartTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${continueRegressionInstance?.executionFinishedTime}">
				<li class="fieldcontain">
					<span id="executionFinishedTime-label" class="property-label"><g:message code="continueRegression.executionFinishedTime.label" default="Execution Finished Time" /></span>
					
						<span class="property-value" aria-labelledby="executionFinishedTime-label"><g:fieldValue bean="${continueRegressionInstance}" field="executionFinishedTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${continueRegressionInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="continueRegression.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${continueRegressionInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${continueRegressionInstance?.allNumber}">
				<li class="fieldcontain">
					<span id="allNumber-label" class="property-label"><g:message code="continueRegression.allNumber.label" default="All Number" /></span>
					
						<span class="property-value" aria-labelledby="allNumber-label"><g:fieldValue bean="${continueRegressionInstance}" field="allNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${continueRegressionInstance?.executedNumber}">
				<li class="fieldcontain">
					<span id="executedNumber-label" class="property-label"><g:message code="continueRegression.executedNumber.label" default="Executed Number" /></span>
					
						<span class="property-value" aria-labelledby="executedNumber-label"><g:fieldValue bean="${continueRegressionInstance}" field="executedNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${continueRegressionInstance?.failureNumber}">
				<li class="fieldcontain">
					<span id="failureNumber-label" class="property-label"><g:message code="continueRegression.failureNumber.label" default="Failure Number" /></span>
					
						<span class="property-value" aria-labelledby="failureNumber-label"><g:fieldValue bean="${continueRegressionInstance}" field="failureNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${continueRegressionInstance?.allExecutionMinutes}">
				<li class="fieldcontain">
					<span id="allExecutionMinutes-label" class="property-label"><g:message code="continueRegression.allExecutionMinutes.label" default="All Execution Minutes" /></span>
					
						<span class="property-value" aria-labelledby="allExecutionMinutes-label"><g:fieldValue bean="${continueRegressionInstance}" field="allExecutionMinutes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${continueRegressionInstance?.crLevel}">
				<li class="fieldcontain">
					<span id="crLevel-label" class="property-label"><g:message code="continueRegression.crLevel.label" default="Cr Level" /></span>
					
						<span class="property-value" aria-labelledby="crLevel-label"><g:fieldValue bean="${continueRegressionInstance}" field="crLevel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${continueRegressionInstance?.crStatus}">
				<li class="fieldcontain">
					<span id="crStatus-label" class="property-label"><g:message code="continueRegression.crStatus.label" default="Cr Status" /></span>
					
						<span class="property-value" aria-labelledby="crStatus-label"><g:fieldValue bean="${continueRegressionInstance}" field="crStatus"/></span>
					
				</li>
				</g:if>
			
			</ol>
			
			<div style="background-color:#d9dadd">
				<h1 style="margin-botton:0;">Executed Continuous Regression Case</h1>
			</div>
			
			<div class='dialog'>
				<table>
					<tr class="prop">
						<td valign="top" style="text-align: center;" class="value">
							<div class='list'>
								<table border="0" cellspacing="1" cellpadding="0">
									<tr bgcolor='#DFE8F6'>
										<td style="width: 35%">CASE NAME</td>
										<td style="width: 5%">BELONG TEAM</td>
										<td style="width: 5%">STATUS</td>
										<td style="width: 15%">TARGET LOAD</td>
										<td style="width: 10%">DURATION (MIN)</td>
										<td style="width: 10%">FAILURE REASON</td>
										<td style="width: 20%">COMMENTS</td>
									</tr>
									<g:each in="${continueRegressionInstance.regressionCases}" status="k" var="regressioncase">
										<tr>
											<td>
												<g:link controller="regressionCase" action='show' id='${regressioncase.id}'>${regressioncase.caseName}</g:link>
											</td>
											<td>${regressioncase.belongTeam}</td>
											<td>${regressioncase.status}</td>
											<td>${regressioncase.targetLoad}</td>
											<td>${regressioncase.duration}</td>
											<td>${regressioncase.failureReason}</td>
											<td>${regressioncase.comment}</td>
										</tr>
									</g:each>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${continueRegressionInstance?.id}" />
					<g:link class="edit" action="edit" id="${continueRegressionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
