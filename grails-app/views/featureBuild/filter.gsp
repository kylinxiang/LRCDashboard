
<%@ page import="LRC.FeatureBuild" %>
<%@ page import="LRC.Pronto" %>
<!doctype html>
<html>
	<head>
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
	</head>
	<body>
		<div class="content scaffold-list" role="main" style="overflow-x:auto;overflow-y:auto">
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
				<g:each in="${fbil}" status="i" var="featureBuildInstance">
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
		</div>
	</body>
</html>
