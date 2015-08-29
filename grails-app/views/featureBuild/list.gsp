
<%@ page import="LRC.FeatureBuild" %>
<%@ page import="LRC.Pronto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'featureBuild.label', default: 'FeatureBuild')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		
		<style>
		#dialog label, #dialog input { display:block; }
		#dialog label { margin-top: 0.5em; }
		#dialog input, #dialog textarea { width: 95%; }
		#tabs { margin-top: 1em; }
		#tabs li .ui-icon-close { float: left; margin: 0.4em 0.2em 0 0; cursor: pointer; }
		#add_tab { cursor: pointer; }
		</style>

		<script>
			$(function() {
				var tabTitle = $("#tab_title"), 
					tabContent = $("#tab_content"), 
					tabTemplate = "<li><a href='#{href}'>#{label}</a> <span class='ui-icon ui-icon-close' role='presentation'>Remove Tab</span></li>", 
					tabCounter = 2;
				var tabs = $("#tabs").tabs();
				// modal dialog init: custom buttons and a "close" callback reseting the form inside
				var dialog = $("#dialog").dialog({
					autoOpen : false,
					modal : true,
					buttons : {
						Add : function() {
							addTab();
							$(this).dialog("close");
						},
						Cancel : function() {
							$(this).dialog("close");
						}
					},
					close : function() {
						form[0].reset();
					}
				});
				// addTab form: calls addTab function on submit and closes the dialog
				var form = dialog.find("form").submit(function(event) {
					addTab();
					dialog.dialog("close");
					event.preventDefault();
				});
				// actual addTab function: adds new tab using the input from the form above
				function addTab() {
					var label = tabTitle.val() || "Tab " + tabCounter, 
					id = "tabs-" + tabCounter, 
					li = $(tabTemplate.replace(/#\{href\}/g, "#" + id).replace(/#\{label\}/g, label)), 
					tabContentHtml = tabContent.val() || "Tab " + tabCounter + " content.";
					
					tabs.find(".ui-tabs-nav").append(li);
					$.get("http://microrec3gci.china.nsn-net.net:8080/iDashboard/featureBuild/filter?filterValue=" + label, function(data) {
						tabs.append( "<div id='" + id + "'>" + data + "</div>" );
						tabs.tabs("refresh");
						tabCounter++;
						});
				}
				// addTab button: just opens the dialog
				$("#add_tab").button().click(function() {
					dialog.dialog("open");
				});
				// close icon: removing the tab on click
				tabs.delegate("span.ui-icon-close", "click", function() {
					var panelId = $(this).closest("li").remove().attr("aria-controls");
					$("#" + panelId).remove();
					tabs.tabs("refresh");
				});
				tabs.bind("keyup", function(event) {
					if (event.altKey && event.keyCode === $.ui.keyCode.BACKSPACE) {
						var panelId = tabs.find(".ui-tabs-active").remove().attr(
								"aria-controls");
						$("#" + panelId).remove();
						tabs.tabs("refresh");
					}
				});
			});
		</script>

</head>
	<body>
		<a href="#list-featureBuild" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="qtRp" action="stat2">QT Report</g:link></li>
			</ul>
		</div>
		
		<div id="dialog" title="Create New Filter">
			<form>
				<fieldset class="ui-helper-reset">
					<label for="tab_title">Title</label>
					<input type="text" name="Release Branch" id="tab_title" value="" class="ui-widget-content ui-corner-all">
				</fieldset>
			</form>
		</div>
		
		<div id="tabs">
			<ul>
				<li>
					<button id="add_tab">Add Filter</button>
				</li>			
				<li><a href="#tabs-1">All Feature Build List</a></li>
			</ul>
			
			<div id="tabs-1">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table border="1">
					<thead>
						<tr>
							<g:sortableColumn style="text-align:center;width: 10%; font-size: 14px" property="packageName" title="${message(code: 'featureBuild.packageName.label', default: 'Package Name')}" />
							<g:sortableColumn style="text-align:center;width: 15%; font-size: 14px" property="qtProgress" title="${message(code: 'featureBuild.qtProgress.label', default: 'Qt Progress')}" />
							<g:sortableColumn style="text-align:center;width: 45%; font-size: 14px" property="comments" title="QT Comments" />
							<g:sortableColumn style="text-align:center;width: 10%; font-size: 14px" property="scs" title="SC"/>
							<g:sortableColumn style="text-align:center;width: 5%; font-size: 14px" property="pmc" title="PMC MW"/>
							<g:sortableColumn style="text-align:center;width: 5%; font-size: 14px" property="branchName" title="${message(code: 'featureBuild.branchName.label', default: 'Branch')}"/>
							<g:sortableColumn style="text-align:center;width: 5%; font-size: 14px" property="ReleaseDate" title="Weeks"/>
						</tr>
					</thead>
					<tbody>
					<g:each in="${featureBuildInstanceList}" status="i" var="featureBuildInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td style="font-size:11px; font-weight:bolder; padding-bottom: 0; text-align: center; vertical-align: middle"><g:link action="show" id="${featureBuildInstance.id}">${fieldValue(bean: featureBuildInstance, field: "packageName")}</g:link></td>
						
							<td class="<%
							out.print("ql" + featureBuildInstance.get_qt_level_number())
							%>" style="font-size:14px; font-weight:bolder; padding-bottom: 0;text-align: center; vertical-align: middle">${fieldValue(bean: featureBuildInstance, field: "qtProgress")}</td>
							
							<td style="font-size:10px; padding-bottom: 0;text-align: left; vertical-align: middle">${fieldValue(bean: featureBuildInstance, field: "comments")}</td>
							
							<td style="padding: 0px; margin: 0">
								<div class="list">
									<table border="0" cellspacing="0" cellpadding="0" style="word-break: keep-all; height: 100%; margin: 0">
										<tr>
											<td class="<%
											if (featureBuildInstance.get_if_field_changed_compare_same_branch("PS_Version")) {
												if (featureBuildInstance.qtProgress == "Failed" || featureBuildInstance.qtProgress == "StopFix") {
													out.print("chg_Failed")
												} else if (featureBuildInstance.qtProgress == "Discard") {
													out.print("Discard")
												} else {
													out.print("changed")
												}
											} else {
												out.print("nochange")
											}
											%>" style="padding: 0; padding-bottom: 0;padding-top: 1">${fieldValue(bean: featureBuildInstance, field: "PS_Version")}</td>
										</tr>
										<tr>										
											<td class="<%
											if (featureBuildInstance.get_if_field_changed_compare_same_branch("DSP_Version")) {
												if (featureBuildInstance.qtProgress == "Failed" || featureBuildInstance.qtProgress == "StopFix") {
													out.print("chg_Failed")
												} else if (featureBuildInstance.qtProgress == "Discard") {
													out.print("Discard")
												} else {
													out.print("changed")
												}
											} else {
												out.print("nochange")
											}
											 %>" style="padding: 0; padding-bottom: 0;padding-top: 1">${fieldValue(bean: featureBuildInstance, field: "DSP_Version")}</td>
										</tr>
										<tr>										 
											<td class="<%
											if (featureBuildInstance.get_if_field_changed_compare_same_branch("PNS_Version")) {
												if (featureBuildInstance.qtProgress == "Failed" || featureBuildInstance.qtProgress == "StopFix") {
													out.print("chg_Failed")
												} else if (featureBuildInstance.qtProgress == "Discard") {
													out.print("Discard")
												} else {
													out.print("changed")
												}
											} else {
												out.print("nochange")
											}
											%>" style="padding: 0; padding-bottom: 0;padding-top: 1">${fieldValue(bean: featureBuildInstance, field: "PNS_Version")}</td>
										</tr>
										<tr>										
											<td class="<%
											if (featureBuildInstance.get_if_field_changed_compare_same_branch("OAM_Version")) {
												if (featureBuildInstance.qtProgress == "Failed" || featureBuildInstance.qtProgress == "StopFix") {
													out.print("chg_Failed")
												} else if (featureBuildInstance.qtProgress == "Discard") {
													out.print("Discard")
												} else {
													out.print("changed")
												}
											} else {
												out.print("nochange")
											}
											%>" style="padding: 0; padding-bottom: 0;padding-top: 1">${fieldValue(bean: featureBuildInstance, field: "OAM_Version")}</td>
										</tr>
										<tr>										
											<td class="<%
											if (featureBuildInstance.get_if_field_changed_compare_same_branch("TRS_Version")) {
												if (featureBuildInstance.qtProgress == "Failed" || featureBuildInstance.qtProgress == "StopFix") {
													out.print("chg_Failed")
												} else if (featureBuildInstance.qtProgress == "Discard") {
													out.print("Discard")
												} else {
													out.print("changed")
												}
											} else {
												out.print("nochange")
											}
											%>" style="padding: 0; padding-bottom: 0;padding-top: 1">${fieldValue(bean: featureBuildInstance, field: "TRS_Version")}</td>
										</tr>
										<tr>										
											<td class="<%
											if (featureBuildInstance.get_if_field_changed_compare_same_branch("SMC_Version")) {
												if (featureBuildInstance.qtProgress == "Failed" || featureBuildInstance.qtProgress == "StopFix") {
													out.print("chg_Failed")
												} else if (featureBuildInstance.qtProgress == "Discard") {
													out.print("Discard")
												} else {
													out.print("changed")
												}
											} else {
												out.print("nochange")
											}
											%>" style="padding: 0; padding-bottom: 0;padding-top: 1">${fieldValue(bean: featureBuildInstance, field: "SMC_Version")}</td>
										</tr>
									</table>
								</div>
							</td>
	                        <td style="font-size:11px; padding-bottom: 0; vertical-align: middle; text-align: center">${featureBuildInstance?.pmcVersion}</td>
							<td style="font-size:20px; font-family:Arial; font-weight:bold; padding-bottom: 0; vertical-align: middle; text-align: center">${fieldValue(bean: featureBuildInstance, field: "branchName")}</td>
							<td style="font-size:24px; padding-bottom: 0; font-weight:bold; vertical-align: middle; text-align: center">${featureBuildInstance?.getWeekOfYear()}</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${featureBuildInstanceTotal}" />
				</div>			
			</div>
		</div>
	</body>
</html>
