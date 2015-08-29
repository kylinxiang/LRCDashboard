<%@ page import="LRC.FeatureBuild" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'featureBuild.label', default: 'FeatureBuild')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<!-- use js -->
		<g:javascript>
		function saveDialog(){
			if(confirm("Do you want to send release mail?")){
				document.getElementById("mailSwitch").value="yes";
			} else {
				document.getElementById("mailSwitch").value="xxxxxxxxxx";
			}
		}
		
		</g:javascript>
	</head>
	<body>
		<a href="#edit-featureBuild" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="edit-featureBuild" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${featureBuildInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${featureBuildInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${featureBuildInstance?.id}" />
				<g:hiddenField name="version" value="${featureBuildInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:hiddenField name="mailSwitch" id="mailSwitch" value="" />
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" onclick="saveDialog()"/>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
