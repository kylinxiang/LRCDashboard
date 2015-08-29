
<%@ page import="LRC.Toolings" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'toolings.label', default: 'Toolings')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-toolings" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-toolings" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list toolings">
			
				<g:if test="${toolingsInstance?.featureBranch}">
				<li class="fieldcontain">
					<span id="featureBranch-label" class="property-label"><g:message code="toolings.featureBranch.label" default="Feature Branch" /></span>
						<span class="property-value" aria-labelledby="featureBranch-label"><g:fieldValue bean="${toolingsInstance}" field="featureBranch"/></span>
				</li>
				</g:if>				

				<g:if test="${toolingsInstance?.releaseLabel}">
				<li class="fieldcontain">
					<span id="releaseLabel-label" class="property-label"><g:message code="toolings.releaseLabel.label" default="ReleaseLabel" /></span>
						<span class="property-value" aria-labelledby="releaseLabel-label"><g:fieldValue bean="${toolingsInstance}" field="releaseLabel"/></span>
				</li>
				</g:if>
			
				<g:if test="${toolingsInstance?.middleWare}">
				<li class="fieldcontain">
					<span id="middleWare-label" class="property-label"><g:message code="toolings.middleWare.label" default="MiddleWare" /></span>
					
						<span class="property-value" aria-labelledby="middleWare-label"><g:fieldValue bean="${toolingsInstance}" field="middleWare"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${toolingsInstance?.tm500Version}">
				<li class="fieldcontain">
					<span id="tm500Version-label" class="property-label"><g:message code="toolings.tm500Version.label" default="Tm500 Version" /></span>
					
						<span class="property-value" aria-labelledby="tm500Version-label"><g:fieldValue bean="${toolingsInstance}" field="tm500Version"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${toolingsInstance?.eATTVersion}">
				<li class="fieldcontain">
					<span id="eATTVersion-label" class="property-label"><g:message code="toolings.eATTVersion.label" default="eATT Version" /></span>
					
						<span class="property-value" aria-labelledby="eATTVersion-label"><g:fieldValue bean="${toolingsInstance}" field="eATTVersion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${toolingsInstance?.DSPExplorerVersion}">
				<li class="fieldcontain">
					<span id="DSPExplorerVersion-label" class="property-label"><g:message code="toolings.DSPExplorerVersion.label" default="DSP Explorer Version" /></span>
					
						<span class="property-value" aria-labelledby="DSPExplorerVersion-label"><g:fieldValue bean="${toolingsInstance}" field="DSPExplorerVersion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${toolingsInstance?.BTSLogVersion}">
				<li class="fieldcontain">
					<span id="BTSLogVersion-label" class="property-label"><g:message code="toolings.BTSLogVersion.label" default="BTSLog Version" /></span>
					
						<span class="property-value" aria-labelledby="BTSLogVersion-label"><g:fieldValue bean="${toolingsInstance}" field="BTSLogVersion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${toolingsInstance?.MMTVersion}">
				<li class="fieldcontain">
					<span id="MMTVersion-label" class="property-label"><g:message code="toolings.MMTVersion.label" default="MMT Version" /></span>
					
						<span class="property-value" aria-labelledby="MMTVersion-label"><g:fieldValue bean="${toolingsInstance}" field="MMTVersion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${toolingsInstance?.id}" />
					<g:link class="edit" action="edit" id="${toolingsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
