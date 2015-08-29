
<%@ page import="LRC.Execution" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'execution.label', default: 'Execution')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-execution" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-execution" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list execution">
			
				<g:if test="${executionInstance?.executionDate}">
				<li class="fieldcontain">
					<span id="executionDate-label" class="property-label"><g:message code="execution.executionDate.label" default="Execution Date" /></span>
					
						<span class="property-value" aria-labelledby="executionDate-label"><g:fieldValue bean="${executionInstance}" field="executionDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionInstance?.targetLoadName}">
				<li class="fieldcontain">
					<span id="targetLoadName-label" class="property-label"><g:message code="execution.targetLoadName.label" default="Target Load Name" /></span>
					
						<span class="property-value" aria-labelledby="targetLoadName-label"><g:fieldValue bean="${executionInstance}" field="targetLoadName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionInstance?.nsnCPCaseNumberTA}">
				<li class="fieldcontain">
					<span id="nsnCPCaseNumberTA-label" class="property-label"><g:message code="execution.nsnCPCaseNumberTA.label" default="Nsn CPC ase Number TA" /></span>
					
						<span class="property-value" aria-labelledby="nsnCPCaseNumberTA-label"><g:fieldValue bean="${executionInstance}" field="nsnCPCaseNumberTA"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionInstance?.nsnCMCaseNumberTA}">
				<li class="fieldcontain">
					<span id="nsnCMCaseNumberTA-label" class="property-label"><g:message code="execution.nsnCMCaseNumberTA.label" default="Nsn CMC ase Number TA" /></span>
					
						<span class="property-value" aria-labelledby="nsnCMCaseNumberTA-label"><g:fieldValue bean="${executionInstance}" field="nsnCMCaseNumberTA"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionInstance?.cieNetCMCaseNumberTA}">
				<li class="fieldcontain">
					<span id="cieNetCMCaseNumberTA-label" class="property-label"><g:message code="execution.cieNetCMCaseNumberTA.label" default="Cie Net CMC ase Number TA" /></span>
					
						<span class="property-value" aria-labelledby="cieNetCMCaseNumberTA-label"><g:fieldValue bean="${executionInstance}" field="cieNetCMCaseNumberTA"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionInstance?.cieNetCPCaseNumberTA}">
				<li class="fieldcontain">
					<span id="cieNetCPCaseNumberTA-label" class="property-label"><g:message code="execution.cieNetCPCaseNumberTA.label" default="Cie Net CPC ase Number TA" /></span>
					
						<span class="property-value" aria-labelledby="cieNetCPCaseNumberTA-label"><g:fieldValue bean="${executionInstance}" field="cieNetCPCaseNumberTA"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionInstance?.nsnCPCaseNumberTAPass}">
				<li class="fieldcontain">
					<span id="nsnCPCaseNumberTAPass-label" class="property-label"><g:message code="execution.nsnCPCaseNumberTAPass.label" default="Nsn CPC ase Number TAP ass" /></span>
					
						<span class="property-value" aria-labelledby="nsnCPCaseNumberTAPass-label"><g:fieldValue bean="${executionInstance}" field="nsnCPCaseNumberTAPass"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionInstance?.nsnCMCaseNumberTAPass}">
				<li class="fieldcontain">
					<span id="nsnCMCaseNumberTAPass-label" class="property-label"><g:message code="execution.nsnCMCaseNumberTAPass.label" default="Nsn CMC ase Number TAP ass" /></span>
					
						<span class="property-value" aria-labelledby="nsnCMCaseNumberTAPass-label"><g:fieldValue bean="${executionInstance}" field="nsnCMCaseNumberTAPass"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionInstance?.cieNetCPCaseNumberTAPass}">
				<li class="fieldcontain">
					<span id="cieNetCPCaseNumberTAPass-label" class="property-label"><g:message code="execution.cieNetCPCaseNumberTAPass.label" default="Cie Net CPC ase Number TAP ass" /></span>
					
						<span class="property-value" aria-labelledby="cieNetCPCaseNumberTAPass-label"><g:fieldValue bean="${executionInstance}" field="cieNetCPCaseNumberTAPass"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionInstance?.cieNetCMCaseNumberTAPass}">
				<li class="fieldcontain">
					<span id="cieNetCMCaseNumberTAPass-label" class="property-label"><g:message code="execution.cieNetCMCaseNumberTAPass.label" default="Cie Net CMC ase Number TAP ass" /></span>
					
						<span class="property-value" aria-labelledby="cieNetCMCaseNumberTAPass-label"><g:fieldValue bean="${executionInstance}" field="cieNetCMCaseNumberTAPass"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionInstance?.nsnCPCaseNumberAll}">
				<li class="fieldcontain">
					<span id="nsnCPCaseNumberAll-label" class="property-label"><g:message code="execution.nsnCPCaseNumberAll.label" default="Nsn CPC ase Number All" /></span>
					
						<span class="property-value" aria-labelledby="nsnCPCaseNumberAll-label"><g:fieldValue bean="${executionInstance}" field="nsnCPCaseNumberAll"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionInstance?.nsnCMCaseNumberAll}">
				<li class="fieldcontain">
					<span id="nsnCMCaseNumberAll-label" class="property-label"><g:message code="execution.nsnCMCaseNumberAll.label" default="Nsn CMC ase Number All" /></span>
					
						<span class="property-value" aria-labelledby="nsnCMCaseNumberAll-label"><g:fieldValue bean="${executionInstance}" field="nsnCMCaseNumberAll"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionInstance?.cieNetCPCaseNumberAll}">
				<li class="fieldcontain">
					<span id="cieNetCPCaseNumberAll-label" class="property-label"><g:message code="execution.cieNetCPCaseNumberAll.label" default="Cie Net CPC ase Number All" /></span>
					
						<span class="property-value" aria-labelledby="cieNetCPCaseNumberAll-label"><g:fieldValue bean="${executionInstance}" field="cieNetCPCaseNumberAll"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionInstance?.cieNetCMCaseNumberAll}">
				<li class="fieldcontain">
					<span id="cieNetCMCaseNumberAll-label" class="property-label"><g:message code="execution.cieNetCMCaseNumberAll.label" default="Cie Net CMC ase Number All" /></span>
					
						<span class="property-value" aria-labelledby="cieNetCMCaseNumberAll-label"><g:fieldValue bean="${executionInstance}" field="cieNetCMCaseNumberAll"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${executionInstance?.id}" />
					<g:link class="edit" action="edit" id="${executionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
