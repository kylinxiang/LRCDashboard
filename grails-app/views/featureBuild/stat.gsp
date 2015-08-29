<%@ page import="LRC.FeatureBuild" %>
<%@ page import="LRC.Pronto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<script type="text/javascript" src="../js/scripts/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="../js/scripts/js/highcharts.js"></script>
		<script type="text/javascript" src="../js/scripts/charting.js"></script>
		<script>
			$.ajaxSetup ({
			    cache: false
			});
		</script>
		<g:set var="entityName" value="${message(code: 'featureBuild.label', default: 'FeatureBuild')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-featureBuild" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="qtRp" action="stat">QT Report</g:link></li>
				<li><g:link class="ciRp" action="stat2">CBR Trend Chart</g:link></li>
			</ul>
		</div>
		<h1 style="text-align: center">FeatureBuild Statics</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:each in="${branchList}" status="k" var="branch">
			<script type="text/javascript">fbchart("${branch}");</script>
			<div id="${branch}" style="width: 1200px; height: 400px; margin: 0 auto"></div>
		</g:each>
	</body>
</html>
	