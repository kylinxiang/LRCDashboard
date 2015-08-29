<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<g:javascript library="application"/>
		<script type="text/javascript">

		  function toggleDiv(divid){
			    if(document.getElementById(divid).style.display == 'none'){
			      document.getElementById(divid).style.display = 'block';
			    }else{
			      document.getElementById(divid).style.display = 'none';
			    }
			  }		

		</script>
        <r:layoutResources />
	</head>
	<body>
		<div style="height: 25pex;">
		microREC 3G QT Tracking System >>
		        <span class="menuButton" align="bottom">
		        	<g:link controller="featureBuild" action="list">
		        		<img style="border:0;cellSpacing: 0;" src="${resource(dir:'images',file:'menu-parent.gif')}"></img>&nbsp;<font size=2.5>microREC QT</font>
		        	</g:link>
		        </span>
		        <span class="menuButton" align="bottom">
		        	<g:link controller="regression" action="list">
		        		<img style="border:0;cellSpacing: 0;" src="${resource(dir:'images',file:'menu-parent.gif')}"></img>&nbsp;<font size=2.5>microREC CBR Regression</font>
		        	</g:link>
		        </span>
		        <span class="menuButton" align="bottom">
		        	<g:link controller="continueRegression" action="list">
		        		<img style="border:0;cellSpacing: 0;" src="${resource(dir:'images',file:'menu-parent.gif')}"></img>&nbsp;<font size=2.5>microREC CR Regression</font>
		        	</g:link>
		        </span>
		        <span class="menuButton" align="bottom">
		        	<g:link controller="regressionCase" action="list">
		        		<img style="border:0;cellSpacing: 0;" src="${resource(dir:'images',file:'menu-parent.gif')}"></img>&nbsp;<font size=2.5>microREC Regression Case</font>
		        	</g:link>
		        </span>
		        <span class="menuButton" align="bottom">
		        	<g:link controller="toolings" action="list">
		        		<img style="border:0;cellSpacing: 0;" src="${resource(dir:'images',file:'menu-parent.gif')}"></img>&nbsp;<font size=2.5>microREC FB Toolings</font>
		        	</g:link>
		        </span>			        
		</div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
        <r:layoutResources />
	</body>
</html>