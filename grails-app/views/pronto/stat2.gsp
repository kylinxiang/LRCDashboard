<%@ page import="LRC.FeatureBuild" %>
<%@ page import="LRC.Pronto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet" href="../js/scripts/themes/base/jquery-ui.css" />
		<script type="text/javascript" src="../js/scripts/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="../js/scripts/jquery/jquery-ui.js"></script>
		<script type="text/javascript" src="../js/scripts/js/highcharts.js"></script>
		<script type="text/javascript" src="../js/scripts/charting.js"></script>
		<script>
			$.ajaxSetup ({
			    cache: false
			});
		</script>
		<g:set var="entityName" value="${message(code: 'pronto.label', default: 'Pronto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-featureBuild" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="stat">Statics</g:link></li>
				<li><g:link class="create" action="stat2">Statics2</g:link></li>
			</ul>
		</div>
		<h1>Pronto Statics</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div id="radio" style="display:block">
	        <input type="radio" id="radio1" name="radio" checked="checked"/><label for="radio1">Daily</label>
	        <input type="radio" id="radio2" name="radio" /><label for="radio2">Weekly</label>
		</div>
		<g:each in="${chartTypes}" status="k" var="type">
			<script type="text/javascript">prontostat("${type}");</script>
			<div id="${type}" style="width: 1200px; height: 400px; margin: 0 auto"></div>
		</g:each>
	</body>
</html>
