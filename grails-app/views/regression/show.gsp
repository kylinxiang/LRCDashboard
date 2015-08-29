
<%@ page import="LRC.Regression" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regression.label', default: 'Regression')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-regression" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-regression" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list regression">
			
				<g:if test="${regressionInstance?.targetLoadName}">
				<li class="fieldcontain">
					<span id="targetLoadName-label" class="property-label"><g:message code="regression.targetLoadName.label" default="Target Load Name" /></span>
						<span class="property-value" aria-labelledby="targetLoadName-label"><g:fieldValue bean="${regressionInstance}" field="targetLoadName"/></span>
				</li>
				</g:if>
			
				<g:if test="${regressionInstance?.targetReleaeBranch}">
				<li class="fieldcontain">
					<span id="targetReleaeBranch-label" class="property-label"><g:message code="regression.targetReleaeBranch.label" default="Target Releae Branch" /></span>
						<span class="property-value" aria-labelledby="targetReleaeBranch-label"><g:fieldValue bean="${regressionInstance}" field="targetReleaeBranch"/></span>
				</li>
				</g:if>			
			
				<g:if test="${regressionInstance?.cbrLevel}">
				<li class="fieldcontain">
					<span id="cbrLevel-label" class="property-label"><g:message code="regression.cbrLevel.label" default="CBR Quality Level" /></span>
						<span class="property-value" aria-labelledby="cbrLevel-label"><g:fieldValue bean="${regressionInstance}" field="cbrLevel"/></span>
				</li>
				</g:if>
				
				<g:if test="${regressionInstance?.cbrStatus}">
				<li class="fieldcontain">
					<span id="cbrStatus-label" class="property-label"><g:message code="regression.cbrStatus.label" default="CBR Status" /></span>
						<span class="property-value" aria-labelledby="cbrStatus-label"><g:fieldValue bean="${regressionInstance}" field="cbrStatus"/></span>
				</li>
				</g:if>
				
				<g:if test="${regressionInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="regression.comments.label" default="Comments" /></span>
					<pre>
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${regressionInstance}" field="comments"/></span>
					</pre>
				</li>
				</g:if>
			
				<g:if test="${regressionInstance?.criticalNumber}">
				<li class="fieldcontain">
					<span id="criticalNumber-label" class="property-label"><g:message code="regression.criticalNumber.label" default="Critical Number" /></span>
						<span class="property-value" aria-labelledby="criticalNumber-label"><g:fieldValue bean="${regressionInstance}" field="criticalNumber"/></span>
				</li>
				</g:if>
			
				<g:if test="${regressionInstance?.criticalPassNumber}">
				<li class="fieldcontain">
					<span id="criticalPassNumber-label" class="property-label"><g:message code="regression.criticalPassNumber.label" default="Critical Pass Number" /></span>
						<span class="property-value" aria-labelledby="criticalPassNumber-label"><g:fieldValue bean="${regressionInstance}" field="criticalPassNumber"/></span>
				</li>
				</g:if>
			
				<g:if test="${regressionInstance?.allNumber}">
				<li class="fieldcontain">
					<span id="allNumber-label" class="property-label"><g:message code="regression.allNumber.label" default="All Number" /></span>
						<span class="property-value" aria-labelledby="allNumber-label"><g:fieldValue bean="${regressionInstance}" field="allNumber"/></span>
				</li>
				</g:if>
			
				<g:if test="${regressionInstance?.allPassNumber}">
				<li class="fieldcontain">
					<span id="allPassNumber-label" class="property-label"><g:message code="regression.allPassNumber.label" default="All Pass Number" /></span>
						<span class="property-value" aria-labelledby="allPassNumber-label"><g:fieldValue bean="${regressionInstance}" field="allPassNumber"/></span>
				</li>
				</g:if>
			
				<g:if test="${regressionInstance?.allExecutionMinutes}">
				<li class="fieldcontain">
					<span id="allExecutionMinutes-label" class="property-label"><g:message code="regression.allExecutionMinutes.label" default="All Happened Execution Minutes" /></span>
						<span class="property-value" aria-labelledby="allExecutionMinutes-label"><g:fieldValue bean="${regressionInstance}" field="allExecutionMinutes"/></span>
				</li>
				<li class="fieldcontain">
					<span id="allExecutionMinutes-label" class="property-label"><g:message code="regression.allExecutionMinutes.label" default="Wasted Execution Minutes" /></span>
						<span class="property-value" aria-labelledby="allExecutionMinutes-label">${regressionInstance.estimateWastedDuration()}</span>
				</li>				
				<li class="fieldcontain">
					<span id="allExecutionMinutes-label" class="property-label"><g:message code="regression.allExecutionMinutes.label" default="Valued Execution Minutes" /></span>
						<span class="property-value" aria-labelledby="allExecutionMinutes-label">${regressionInstance.estimateValuedDuration()}</span>
				</li>
				<li class="fieldcontain">
					<span id="valuedATDuration-label" class="property-label"><g:message code="regression.valuedATDuration.label" default="Valued AT Execution Minutes" /></span>
						<span class="property-value" aria-labelledby="valuedATDuration-label"><g:fieldValue bean="${regressionInstance}" field="valuedATDuration"/></span>
				</li>
				<li class="fieldcontain">
					<span id="valuedCBRDuration-label" class="property-label"><g:message code="regression.valuedCBRDuration.label" default="Valued CBR Execution Minutes" /></span>
						<span class="property-value" aria-labelledby="valuedCBRDuration-label"><g:fieldValue bean="${regressionInstance}" field="valuedCBRDuration"/></span>
				</li>
				</g:if>
			</ol>

			<g:if test="${regressionInstance?.regressionCases}">
				<div style="background-color:#d9dadd">
					<h1 style="margin-botton:0;">Executed CBR Case</h1>
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
											<td style="width: 5%">PRIORITY</td>
											<td style="width: 10%">DURATION (MIN)</td>
											<td style="width: 10%">FAILURE REASON</td>
											<td style="width: 30%">COMMENTS</td>
										</tr>
										<g:each in="${regressionInstance.regressionCases}" status="k" var="regressioncase">
											<tr>
												<td>
													<g:link controller="regressionCase" action='show' id='${regressioncase.id}'>${regressioncase.caseName}</g:link>
												</td>
												<td>${regressioncase.belongTeam}</td>
												<td>${regressioncase.status}</td>
												<td>${regressioncase.priority}</td>
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
			</g:if>
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${regressionInstance?.id}" />
					<g:link class="edit" action="edit" id="${regressionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
