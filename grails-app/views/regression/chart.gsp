<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<script type="text/javascript" src="../js/scripts/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../js/scripts/js/highcharts.js"></script>
<script type="text/javascript" src="../js/scripts/charting.js"></script>
<script>
	$.ajaxSetup ({
	    cache: false
	});
</script>
<g:set var="entityName" value="${message(code: 'regression.label', default: 'CBR Regression')}" />

<title>CBR Chart</title>
</head>
<body>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			<li><g:link class="create" action="list">CBR LIST</g:link></li>
		</ul>
	</div>
	<h1>CBR Regression Statistics</h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>

	<script type="text/javascript">executionstat3();</script>
	<div id="executionstat3" style="width: 95%; height: 400px; margin: 0 auto"></div>
        <script type="text/javascript">executionstat4();</script>
	<div id="executionstat4" style="width: 95%; height: 400px; margin: 0 auto"></div>  
  
</body>
</html>