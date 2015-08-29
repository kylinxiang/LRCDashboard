
<%@ page import="LRC.FeatureBuild" %>
<%@ page import="LRC.Pronto" %>
<%@ page import="LRC.CorrectedPronto"%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'featureBuild.label', default: 'FeatureBuild')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-featureBuild" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="show-featureBuild" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${flash.get("mailSent")}">
				<g:javascript>alert("${flash.get("mailSent")}")</g:javascript>
			</g:if>
	
			<ol class="property-list featureBuild">
			
				<g:if test="${featureBuildInstance?.packageName}">
				<li class="fieldcontain">
					<span id="packageName-label" class="property-label"><g:message code="featureBuild.packageName.label" default="Package Name" /></span>
					
						<span class="property-value" aria-labelledby="packageName-label"><g:fieldValue bean="${featureBuildInstance}" field="packageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${featureBuildInstance?.qtLevel}">
				<li class="fieldcontain">
					<span id="qtLevel-label" class="property-label"><g:message code="featureBuild.qtLevel.label" default="Qt Level" />

					</span>
					<span class="property-value" aria-labelledby="qtLevel-label"><g:fieldValue bean="${featureBuildInstance}" field="qtLevel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${featureBuildInstance?.qtProgress}">
				<li class="fieldcontain">
					<span id="qtProgress-label" class="property-label"><g:message code="featureBuild.qtProgress.label" default="Qt Progress" /></span>
					
						<span class="property-value" aria-labelledby="qtProgress-label"><g:fieldValue bean="${featureBuildInstance}" field="qtProgress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${featureBuildInstance?.startPkgBuildTime}">
				<li class="fieldcontain">
					<span id="startPkgBuildTime-label" class="property-label"><g:message code="featureBuild.startPkgBuildTime.label" default="Start Pkg Build Time" /></span>
					
						<span class="property-value" aria-labelledby="startPkgBuildTime-label"><g:formatDate date="${featureBuildInstance?.startPkgBuildTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${featureBuildInstance?.releaseTime}">
				<li class="fieldcontain">
					<span id="releaseTime-label" class="property-label"><g:message code="featureBuild.releaseTime.label" default="Release Time" /></span>
					
						<span class="property-value" aria-labelledby="releaseTime-label"><g:formatDate date="${featureBuildInstance?.releaseTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${featureBuildInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="featureBuild.comments.label" default="Comments" /></span>
					<pre>
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${featureBuildInstance}" field="comments"/></span>
					</pre>
				</li>
				</g:if>
			
				<g:if test="${featureBuildInstance?.pkgdownloadURL}">
				<li class="fieldcontain">
					<span id="pkgdownloadURL-label" class="property-label"><g:message code="featureBuild.pkgdownloadURL.label" default="Pkgdownload URL" /></span>
					
						<span class="property-value" aria-labelledby="pkgdownloadURL-label"><g:fieldValue bean="${featureBuildInstance}" field="pkgdownloadURL"/></span>
					
				</li>
				</g:if>

				<g:if test="${featureBuildInstance?.branchName}">
				<li class="fieldcontain">
					<span id="branchName-label" class="property-label"><g:message code="featureBuild.branchName.label" default="Branch Name URL" /></span>
						<span class="property-value" aria-labelledby="branchName-label"><g:fieldValue bean="${featureBuildInstance}" field="branchName"/></span>
				</li>
				</g:if>
				
				<g:if test="${featureBuildInstance?.releaseBranch}">
				<li class="fieldcontain">
					<span id="releaseBranch-label" class="property-label"><g:message code="featureBuild.releaseBranch.label" default="release Branch" /></span>
						<span class="property-value" aria-labelledby="releaseBranch-label"><g:fieldValue bean="${featureBuildInstance}" field="releaseBranch"/></span>
				</li>
				</g:if>				
			
				<g:if test="${featureBuildInstance?.DSP_Version}">
				<li class="fieldcontain">
					<span id="DSP_Version-label" class="property-label"><g:message code="featureBuild.DSP_Version.label" default="DSP Version" /></span>
					
						<span class="property-value" aria-labelledby="DSP_Version-label"><g:fieldValue bean="${featureBuildInstance}" field="DSP_Version"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${featureBuildInstance?.PNS_Version}">
				<li class="fieldcontain">
					<span id="PNS_Version-label" class="property-label"><g:message code="featureBuild.PNS_Version.label" default="PNS Version" /></span>
					
						<span class="property-value" aria-labelledby="PNS_Version-label"><g:fieldValue bean="${featureBuildInstance}" field="PNS_Version"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${featureBuildInstance?.PS_Version}">
				<li class="fieldcontain">
					<span id="PS_Version-label" class="property-label"><g:message code="featureBuild.PS_Version.label" default="PS Version" /></span>
						<span class="property-value" aria-labelledby="PS_Version-label"><g:fieldValue bean="${featureBuildInstance}" field="PS_Version"/></span>
				</li>
				</g:if>

				<g:if test="${featureBuildInstance?.OAM_Version}">
				<li class="fieldcontain">
					<span id="PS_Version-label" class="property-label"><g:message code="featureBuild.OAM_Version.label" default="OAM Version" /></span>
						<span class="property-value" aria-labelledby="OAM_Version-label"><g:fieldValue bean="${featureBuildInstance}" field="OAM_Version"/></span>
				</li>
				</g:if>
				
				<g:if test="${featureBuildInstance?.TRS_Version}">
				<li class="fieldcontain">
					<span id="PS_Version-label" class="property-label"><g:message code="featureBuild.TRS_Version.label" default="TRS Version" /></span>
						<span class="property-value" aria-labelledby="TRS_Version-label"><g:fieldValue bean="${featureBuildInstance}" field="TRS_Version"/></span>
				</li>
				</g:if>
						
				<g:if test="${featureBuildInstance?.SMC_Version}">
				<li class="fieldcontain">
					<span id="PS_Version-label" class="property-label"><g:message code="featureBuild.SMC_Version.label" default="SMC Version" /></span>
						<span class="property-value" aria-labelledby="SMC_Version-label"><g:fieldValue bean="${featureBuildInstance}" field="SMC_Version"/></span>
				</li>
				</g:if>							

			</ol>
			
			<div style="background-color:#d9dadd">
				<h1 style="margin-botton:0">Tool Sets</h1>
			</div>
			
			<div class="dialog">
				<table>
					<tr class="prop">
						<td valign="top" style="text-align: left;" class="value">
							<div class="list">
								<table border="0" cellspacing="1" cellpadding="0">
									<tr bgcolor="#DFE8F6">
										<td style="width: 15%">PMC</td>
										<td style="width: 20%">MW Download URL</td>
										<td style="width: 15%">TM500</td>
										<td style="width: 10%">Artiza Information</td>
										<td style="width: 10%">MMT Version</td>
										<td style="width: 10%">eATT 3G</td>
										<td style="width: 10%">BTSLog</td>
										<td style="width: 10%">MemDump</td>
									</tr>
									<tr>
										<td style="width: 15%">${featureBuildInstance?.pmcVersion}</td>
										<td style="width: 20%"><a href="http://microrec3gci.china.nsn-net.net/microREC/eNB/">Click Me</a></td>
										<td style="width: 15%">${featureBuildInstance?.toolSet?.tm500Version}</td>
										<td style="width: 10%">${featureBuildInstance?.toolSet?.artizaVersion}</td>
										<td style="width: 10%">${featureBuildInstance?.toolSet?.MMTVersion}</td>
										<td style="width: 10%">${featureBuildInstance?.toolSet?.eATTVersion}</td>
										<td style="width: 10%">${featureBuildInstance?.toolSet?.BTSLogVersion}</td>
										<td style="width: 10%">${featureBuildInstance?.toolSet?.memDumpVersion}</td>
									</tr>									
								</table>
							</div>
						</td>
					</tr>
				</table>			
			</div>
			
			<div style="background-color:#d9dadd">
				<h1 style="margin-botton:0;">Corrected Faults within Build </h1>
			</div>
			
			<div class="dialog">
				<table>
					<tr class="prop">
						<td valign="top" style="text-align: left;" class="value">
							<div class="list">
								<table border="0" cellspacing="1" cellpadding="0">
									<tr bgcolor="#DFE8F6">
										<td style="width: 15%">Component</td>
										<td style="width: 20%">Baseline</td>
										<td style="width: 20%">PR ID</td>
										<td style="width: 45%">Faults</td>
									</tr>
									<g:each in="${featureBuildInstance.correctedprontos}" status="k" var="corrfault">
	                                    	<tr>
	                                    		<td>${corrfault.componentName}</td>
	                                    		<td>${corrfault.componentBaseLine}</td>
	                                    		<td>${corrfault.prontoID}</td>
	                                    		<td>${corrfault.prontoDescription}</td>
	                                    	</tr>
									</g:each>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>
			
			<g:if test="${featureBuildInstance?.correctedprontosfromlastL6}">				
				<div style="background-color:#d9dadd">
					<h1 style="margin-botton:0;">Other CF after last QL6 load:<g:fieldValue bean="${featureBuildInstance}" field="lastL6id"/></h1>
				</div>			
				<div class="dialog">
					<table>
						<tr class="prop">
							<td valign="top" style="text-align: left;" class="value">
								<div class="list">
									<table border="0" cellspacing="1" cellpadding="0">
										<tr bgcolor="#DFE8F6">
											<td style="width: 15%">Component</td>
											<td style="width: 20%">Baseline</td>
											<td style="width: 20%">PR ID</td>
											<td style="width: 45%">Faults</td>
										</tr>
										<g:each in="${featureBuildInstance.correctedprontosfromlastL6}" status="k" var="corrfault">
		                                    	<tr>
		                                    		<td>${corrfault.componentName}</td>
		                                    		<td>${corrfault.componentBaseLine}</td>
		                                    		<td>${corrfault.prontoID}</td>
		                                    		<td>${corrfault.prontoDescription}</td>
		                                    	</tr>
										</g:each>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</g:if>
						
			<div style="background-color:#d9dadd">
				<h1 style="margin-botton:0;">Faults Found in QT</h1>
			</div>
			
			<div class="dialog">
				<table>
					<tbody>
						<tr class="prop">
							<td valign="top" style="text-align: left;" class="value">
								<div class="list">
									<table border="0" cellspacing="1" cellpadding="0">
	                                    <tr bgcolor="#DFE8F6">
	                                      <td>Pronto ID</td>
	                                      <td>Description</td>
	                                      <td>Status</td>
	                                      <td>Priority</td>
	                                      <td>Owner</td>
	                                      <td>Follow Up</td>
	                                      <td>Group In Charge</td>
	                                      <td>Impact Level</td>
	                                    </tr>
	                                    
	                                    <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
	                                    	<tr class="${prontos.priority}">
	                                    		<td><g:link controller="pronto" action="show" id="${prontos.id}">${prontos.prontoID}</g:link></td>
	                                    		<td>${prontos.description}</td>
	                                    		<td>${prontos.status}</td>
	                                    		<td>${prontos.priority}</td>
	                                    		<td>${prontos.owner}</td>
	                                    		<td>${prontos.followUp}</td>
	                                    		<td>${prontos.groupInCharge}</td>
	                                    		<td>${prontos.impactLevel}</td>
	                                    	</tr>
	                                    </g:each>
									</table>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div style="background-color:#d9dadd">
				<h1 style="margin-botton:0;">Continous Build Regression (QT Phase II) Result</h1>
			</div>
			
			<div class="dialog">
				<table>
					<tbody>
						<tr class="prop">
							<td valign="top" style="text-align: left;" class="value">
								<div class="list">
									<table border="1" cellspacing="1" cellpadding="0">
	                                    <tr bgcolor="#DFE8F6">
	                                      <td style="text-align: center">Execution Start Time</td>
	                                      <td style="text-align: center">Duration (Minutes)</td>
	                                      <td style="text-align: center">AT Case Brief<br/>(PASS/ALL)</td>
	                                      <td style="text-align: center">CBR Case Brief<br/>(PASS/ALL)</td>
	                                      <td style="text-align: center">All Case Brief<br/>(PASS/ALL)</td>
	                                      <td style="text-align: center">Overall QT Phase II Level</td>
	                                    </tr>
	                                    
	                                    <g:each in="${featureBuildInstance.cbrgression}" status="i" var="regression">
	                                    	<tr>
	                                    		<td style="text-align: center"><g:link controller="regression" action="show" id="${regression.id}">${regression.executionStartTime}</g:link></td>
	                                    		<td style="text-align: center">${regression.allExecutionMinutes} Mins</td>
	                                    		<td style="text-align: center">${regression.criticalPassNumber} / ${regression.criticalNumber}</td>
	                                    		<td style="text-align: center">${regression.getCBRPassCaseNumber()} / ${regression.getCBRCaseNumber()}</td>
	                                    		<td style="text-align: center">${regression.allPassNumber} / ${regression.allNumber}</td>
	                                    		<td style="text-align: center">QL: ${regression.calculateCBRLevel()}</td>
	                                    	</tr>
	                                    </g:each>
									</table>
								</div>
							</td>
						</tr>
					</tbody>
				</table>				
			</div>
			
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${featureBuildInstance?.id}" />
					<!--<g:link class="save" action="release" id="${featureBuildInstance?.id}">Release</g:link>-->
					<g:link class="edit" action="edit" id="${featureBuildInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link controller="pronto" action="create" params="['featurebuilds':featureBuildInstance.id]"><g:message code="default.button.add.label" default="Add Pronto"/></g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
