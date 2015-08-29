<%@ page contentType="text/html;charset=ISO-8859-1"%>
<%@ page import="LRC.FeatureBuild"%>
<%@ page import="LRC.Pronto"%>
<%@ page import="LRC.CorrectedPronto"%>
<html>
<head>

<style type="text/css">
html * {
	background-color: #000;
	margin: 0
}

body,input,select,textarea {
	font-family: Arial, sans-serif;
}

h1,h2,h3,h4,h5,h6 {
	line-height: 1.1;
}

a:link,a:visited,a:hover {
	color: #48802c;
}

p.MsoNormal,li.MsoNormal,div.MsoNormal {
	mso-style-parent: "";
	margin: 0cm;
	margin-bottom: .0001pt;
	mso-pagination: widow-orphan;
	font-size: 11.0pt;
	font-family: "Arial";
	mso-fareast-font-family: SimSun
}

table,td,th {
	border-collapse: collapse;
	border: 1px solid black;
	padding: 5px;
	font-size: 11.0pt
}

td.changed {
	background: #d0b0f3;
	font-weight: bold;
	font-size: 11px;
	color: #bd14ee
}

td.nochange {
	font-style: italic;
	font-size: 11px
}

td.ql0 {
	background: white
}

td.ql1 {
	background: red
}

td.ql2 {
	background: #ff6600
}

td.ql3 {
	background: #ffcc00
}

td.ql4 {
	background: #ccff00
}

td.ql4_changed {
	background: #ccff00;
	font-weight: bold;
	color: #bd14ee
}

td.ql5 {
	background: #99cc00
}

td.ql5_changed {
	background: #99cc00;
	font-weight: bold;
	color: #bd14ee
}

td.ql6 {
	background: #993300
}

td.ql6_changed {
	background: #993300;
	font-weight: bold;
	color: #bd14ee
}

td.ql7 {
	background: #008000
}

td.ql7_changed {
	background: #008000;
	font-weight: bold;
	color: #bd14ee
}

td.ql8 {
	background: #00ff00
}

td.ql8_changed {
	background: #00ff00;
	font-weight: bold;
	color: #bd14ee
}

td.StopFix {
	background: #9e191d
}

td.chg_StopFix {
	background: #9e191d;
	font-weight: bold;
	color: #eebd14
}

td.Failed {
	background: #dd292e
}

td.chg_Failed {
	background: #dd292e;
	font-weight: bold;
	color: #eebd14
}

td.Discard {
	background: #888888
}

td.Released {
	background: #40c14c
}

td.Ristriction {
	background: #b8e600
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />

</head>
<body style="" lang="FI" link="blue" vlink="blue">
	<div class="body">
		<p class="MsoNormal" style="margin-bottom: 12pt">
			<b> <i> <span
					style="font-size: 10pt; font-family: Arial; color: gray">Distribution:
						MicroREC 3G IV <br> <br>
				</span>
			</i>
			</b> <span style="font-size: 10pt; font-family: Arial; color: blue">Hi,<br>&nbsp;&nbsp;Here
				is the short description about Feature Build
			</span> <span
				style="font-size: 11pt; font-family: Arial; color: #bd14ee; font-weight: bold">
				${featureBuildInstance?.packageName}
			</span> <span style="font-size: 10pt; font-family: Arial; color: blue">QT
				status: </span>
		</p>
	</div>

	<div class="body">
		<p class="MosNormal" style="margin-bottom: 10pt">
			<span style="font-size: 12pt; font-family: Arial; color: blue">
				<b>- 3G QT Results:</b>
			</span>
			<pre>${featureBuildInstance?.qtLevel}   ${featureBuildInstance?.qtProgress}</pre>
		</p>
	</div>
	
	<g:if test="${featureBuildInstance?.comments}">
	<div class="body">
		<p class="MosNormal" style="margin-bottom: 10pt">
			<span style="font-size: 12pt; font-family: Arial; color: red">
				<b>- Important Notes:</b><br>
			</span>
			<pre>${featureBuildInstance?.comments}</pre>
		</p>
	</div>
	</g:if>

	<div class="body">
		<p class="MsoNormal" style="margin-bottom: 12pt;">
			<span style="font-size: 12pt; font-family: Arial; color: blue;"><br>
				<b>- Baselines:</b> </span>
		</p>
		<table border="1" cellpadding="0">
			<tr>
				<td>
					<p class="MsoNormal">
						<b><span
							style="font-size: 10pt; font-family: Arial; color: black;">Release Branch</span></b><b><span
							style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
					</p>
				</td>
				<td
					class="nochange">
					${featureBuildInstance?.releaseBranch}
				</td>
			</tr>
			<tr>		
				<td>
					<p class="MsoNormal">
						<b><span
							style="font-size: 10pt; font-family: Arial; color: black;">PS
								Version</span></b><b><span
							style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
					</p>
				</td>
				<td
					class="<%
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
			%>">
					${featureBuildInstance?.PS_Version}
				</td>
			</tr>
			<tr>
				<td>
					<p class="MsoNormal">
						<b><span
							style="font-size: 10pt; font-family: Arial; color: black;">3G
								DSP Version</span></b><b><span
							style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
					</p>
				</td>
				<td
					class="<%
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
			%>">
					${featureBuildInstance?.DSP_Version}
				</td>
			</tr>
			<tr>
				<td>
					<p class="MsoNormal">
						<b><span
							style="font-size: 10pt; font-family: Arial; color: black;">PNS
								Version</span></b><b><span
							style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
					</p>
				</td>
				<td
					class="<%
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
			%>">
					${featureBuildInstance?.PNS_Version}
				</td>
			</tr>
			<tr>
				<td>
					<p class="MsoNormal">
						<b><span
							style="font-size: 10pt; font-family: Arial; color: black;">OAM
								Version</span></b><b><span
							style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
					</p>
				</td>
				<td
					class="<%
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
			%>">
					${featureBuildInstance?.OAM_Version}
				</td>
			</tr>
			<tr>
				<td>
					<p class="MsoNormal">
						<b><span
							style="font-size: 10pt; font-family: Arial; color: black;">TRS
								Library</span></b><b><span
							style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
					</p>
				</td>
				<td
					class="<%
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
			%>">
					${featureBuildInstance?.TRS_Version}
				</td>
			</tr>
			<tr>
				<td>
					<p class="MsoNormal">
						<b><span
							style="font-size: 10pt; font-family: Arial; color: black;">CNT__CF
								Version</span></b><b><span
							style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
					</p>
				</td>
				<td>
					<p class="MsoNormal">
						<b><span
							style="font-size: 10pt; font-family: Arial; color: black;">
								${featureBuildInstance?.toolSet?.middleWare}
						</span></b><b><span
							style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
					</p>
				</td>
			</tr>
			<tr>
				<td>
					<p class="MsoNormal">
						<b><span
							style="font-size: 10pt; font-family: Arial; color: black;">CNT__CP
								Version</span></b><b><span
							style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
					</p>
				</td>
				<td>
					<p class="MsoNormal">
						<b><span
							style="font-size: 10pt; font-family: Arial; color: black;">
								${featureBuildInstance?.toolSet?.cntCPVersion}
						</span></b><b><span
							style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
					</p>
				</td>
			</tr>
			<tr>
				<td>
					<p class="MsoNormal">
						<b><span
							style="font-size: 10pt; font-family: Arial; color: black;">CNT__SV
								Version</span></b><b><span
							style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
					</p>
				</td>
				<td>
					<p class="MsoNormal">
						<b><span
							style="font-size: 10pt; font-family: Arial; color: black;">
								${featureBuildInstance?.toolSet?.cntSVVersion}
						</span></b><b><span
							style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
					</p>
				</td>
			</tr>
			<tr>
				<td>
					<p class="MsoNormal">
						<b><span
							style="font-size: 10pt; font-family: Arial; color: black;">Hardware Category</span></b><b><span
							style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
					</p>
				</td>
				<g:if
					test="${featureBuildInstance?.branchName.toString().equalsIgnoreCase('FB12.04') }">
					<td>
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">pre-HW</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
				</g:if>
				<g:if
					test="${!featureBuildInstance?.branchName.toString().equalsIgnoreCase('FB12.04') }">
					<td>
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight: bold; font-family: Arial; color: black;">Build-2/Build-1</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
				</g:if>
			</tr>			
		</table>
	</div>

	<g:if test="${!featureBuildInstance?.qtProgress.equalsIgnoreCase('DISCARD')}">
		<div class="body">
			<p class="MsoNormal" style="margin-bottom: 12pt;">
				<span style="font-size: 12pt; font-family: Arial; color: blue;"><br>
					<b>- Feature Build 3G Quality Level:</b> </span>
			</p>
			<table border="1" cellpadding="0">
				<tr>
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">QT Level Number</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<td style="width: 400; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">Level Description</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<td style="width: 60; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">Status</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<g:if test="${featureBuildInstance?.prontos}">
					<td style="width: 60; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">Pronto ID</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					
					<g:if test="${featureBuildInstance?.prontos}">
					<td style="width: 40; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">Priority</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					
					<g:if test="${featureBuildInstance?.prontos}">
					<td style="width: 60; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">Group In Charge</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					
					<g:if test="${featureBuildInstance?.prontos}">
					<td style="width: 60; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">Blocking</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>			
				</tr>
				<tr>
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">1</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<td style="width: 300; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">Package Installed Successfully</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<g:if test="${ 1 <= featureBuildInstance?.get_qt_level_number_int()}">
					<td style="width: 60; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight:bold; font-family: Arial; color: green;">PASS</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					<g:if test="${!(1 <= featureBuildInstance?.get_qt_level_number_int())}">
					<td style="width: 60; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight: bold; font-family: Arial; color: red;">FAIL</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					
					<g:if test="${featureBuildInstance?.prontos}">
					<td style="width: 80; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-1')}">
										${prontos.prontoID}<br>
								</g:if>
								<g:else>
										-
								</g:else>
			                </g:each>
	                </td>
					<td style="width: 40; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-1')}">
										${prontos.priority}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 60; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-1')}">
										${prontos.groupInCharge}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 60; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-1')}">
									<g:if test="${prontos.impactStatus.equalsIgnoreCase('Failed')}">
										YES<br>
									</g:if>
									<g:else>
										NO<br>
									</g:else>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					</g:if>
				</tr>
				<tr>
					<td style="width: 100; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">2</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<g:if
						test="${!featureBuildInstance?.branchName.toString().equalsIgnoreCase('FB12.04') }">				
						<td style="width: 300; text-align: center">
							<p class="MsoNormal">
								<b><span
									style="font-size: 10pt; font-family: Arial; color: black;">BTS Startup and Alarm Process Successfully</span></b><b><span
									style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
							</p>
						</td>
					</g:if>
					<g:if
						test="${featureBuildInstance?.branchName.toString().equalsIgnoreCase('FB12.04') }">				
						<td style="width: 300; text-align: center">
							<p class="MsoNormal">
								<b><span
									style="font-size: 10pt; font-family: Arial; color: black;">BTS and OBSAI Link startup</span></b><b><span
									style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
							</p>
						</td>
					</g:if>
					<g:if test="${ 2 <= featureBuildInstance?.get_qt_level_number_int()}">
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight:bold; font-family: Arial; color: green;">PASS</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					<g:if test="${!(2 <= featureBuildInstance?.get_qt_level_number_int())}">
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight: bold; font-family: Arial; color: red;">FAIL</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					
					<g:if test="${featureBuildInstance?.prontos}">
					<td style="width: 80; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-2')}">
										${prontos.prontoID}<br>
								</g:if>
								<g:else>
										-
								</g:else>
			                </g:each>
	                </td>
					<td style="width: 40; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-2')}">
										${prontos.priority}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 60; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-2')}">
										${prontos.groupInCharge}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 60; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-2')}">
									<g:if test="${prontos.impactStatus.equalsIgnoreCase('Failed')}">
										YES<br>
									</g:if>
									<g:else>
										NO<br>
									</g:else>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					</g:if>	
				</tr>
				<tr>
					<td style="width: 100; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">3</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<td style="width: 300; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">Cell Setup and Cell Search Successfully</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<g:if test="${ 3 <= featureBuildInstance?.get_qt_level_number_int()}">
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight:bold; font-family: Arial; color: green;">PASS</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					<g:if test="${!(3 <= featureBuildInstance?.get_qt_level_number_int())}">
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight: bold; font-family: Arial; color: red;">FAIL</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					
					<g:if test="${featureBuildInstance?.prontos}">
					<td style="width: 80; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-3')}">
										${prontos.prontoID}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 40; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-3')}">
										${prontos.priority}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 60; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-3')}">
										${prontos.groupInCharge}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 60; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-3')}">
									<g:if test="${prontos.impactStatus.equalsIgnoreCase('Failed')}">
										YES<br>
									</g:if>
									<g:else>
										NO<br>
									</g:else>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					</g:if>				
				</tr>
				<tr>
					<td style="width: 100; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">4</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<td style="width: 300; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">Make R99 call successfully</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<g:if test="${ 4 <= featureBuildInstance?.get_qt_level_number_int()}">
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight:bold; font-family: Arial; color: green;">PASS</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					<g:if test="${!(4 <= featureBuildInstance?.get_qt_level_number_int())}">
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight: bold; font-family: Arial; color: red;">FAIL</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					
					<g:if test="${featureBuildInstance?.prontos}">
					<td style="width: 80; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-4')}">
										${prontos.prontoID}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 40; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-4')}">
										${prontos.priority}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 60; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-4')}">
										${prontos.groupInCharge}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 60; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-4')}">
									<g:if test="${prontos.impactStatus.equalsIgnoreCase('Failed')}">
										YES<br>
									</g:if>
									<g:else>
										NO<br>
									</g:else>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					</g:if>
				</tr>			
				<tr>
					<td style="width: 100; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">5</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<td style="width: 300; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">Make 14M HSDPA DL call successfully(LD2/LD11, Tx-Div/Power=OFF)</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<g:if test="${ 5 <= featureBuildInstance?.get_qt_level_number_int()}">
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight:bold; font-family: Arial; color: green;">PASS</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					<g:if test="${!(5 <= featureBuildInstance?.get_qt_level_number_int())}">
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight: bold; font-family: Arial; color: red;">FAIL</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					
					<g:if test="${featureBuildInstance?.prontos}">
					<td style="width: 80; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-5')}">
										${prontos.prontoID}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 40; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-5')}">
										${prontos.priority}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 60; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-5')}">
										${prontos.groupInCharge}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 60; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-5')}">
									<g:if test="${prontos.impactStatus.equalsIgnoreCase('Failed')}">
										YES<br>
									</g:if>
									<g:else>
										NO<br>
									</g:else>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					</g:if>
				</tr>
				
				<tr>
					<td style="width: 100; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">6</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<td style="width: 300; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">Make 14M HSDPA DL call successfully(LD2/LD11, Tx-Div/Power=ON)</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<g:if test="${ 6 <= featureBuildInstance?.get_qt_level_number_int()}">
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight:bold; font-family: Arial; color: green;">PASS</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					<g:if test="${!(6 <= featureBuildInstance?.get_qt_level_number_int())}">
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight: bold; font-family: Arial; color: #cbcbcb;">N/A</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					
					<g:if test="${featureBuildInstance?.prontos}">
					<td style="width: 80; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-6')}">
										${prontos.prontoID}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 40; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-6')}">
										${prontos.priority}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 60; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-6')}">
										${prontos.groupInCharge}<br>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					<td style="width: 60; text-align: center">
			                <g:each in="${featureBuildInstance.prontos}" status="i" var="prontos">
								<g:if test="${prontos.impactLevel.toString().equalsIgnoreCase('Level-6')}">
									<g:if test="${prontos.impactStatus.equalsIgnoreCase('Failed')}">
										YES<br>
									</g:if>
									<g:else>
										NO<br>
									</g:else>
								</g:if>
								<g:else>
										-
								</g:else>							
			                </g:each>
	                </td>
					</g:if>
				</tr>
			</table>
		</div>
	</g:if>

	<g:if test="${featureBuildInstance?.toolSet}">
		<div class="body">
			<p class="MosNormal" style="margin-bottom: 12pt">
				<span style="font-size: 12pt; font-family: Arial; color: blue">
					<b>- Tools Set:</b>
				</span>
			</p>
			<table>
				<tr>
					<td>
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">MMT
									Version</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<td>
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">
									${featureBuildInstance?.toolSet?.MMTVersion}
							</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">API-SIM
									Version</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<td>
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">
									${featureBuildInstance?.toolSet?.eATTVersion}
							</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">BTSLog
									Version</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<td>
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">
									${featureBuildInstance?.toolSet?.BTSLogVersion}
							</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">eATT
									Version</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<td>
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">
									${featureBuildInstance?.toolSet?.eATTVersion}
							</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">TM500
									Version</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<td>
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">
									${featureBuildInstance?.toolSet?.tm500Version}
							</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
				</tr>
			</table>
		</div>
	</g:if>

	<g:if test="${featureBuildInstance?.correctedprontos}">
		<div class="body">
			<p class="MsoNormal" style="margin-bottom: 12pt;">
				<span style="font-size: 12pt; font-family: Arial; color: blue;"><br>
					<b>- Corrected Faults within Build:</b> </span>
			</p>

			<table>
				<tr class="prop">
					<td valign="top" style="text-align: left;" class="value">
						<div class="body">
							<table>
								<tr bgcolor="#DFE8F6">
									<td
										style="width: 120; font-size: 11pt; font-family: Arial; text-align: center">Component</td>
									<td
										style="width: 300; font-size: 11pt; font-family: Arial; text-align: center">Baseline</td>
									<td
										style="width: 180; font-size: 11pt; font-family: Arial; text-align: center">PR
										ID</td>
									<td
										style="width: 400; font-size: 11pt; font-family: Arial; text-align: center">Faults
										Description</td>
								</tr>

								<g:each in="${featureBuildInstance.correctedprontos}" status="k"
									var="corrfault">
									<tr>
										<td style="width: 120; font-size: 10pt; font-family: Arial">
											${corrfault.componentName}
										</td>
										<td style="width: 300; font-size: 10pt; font-family: Arial">
											${corrfault.componentBaseLine}
										</td>
										<td
											style="width: 180; font-size: 10pt; font-weight: bold; font-family: Arial; color: RED">
											${corrfault.prontoID}
										</td>
										<td style="width: 400; font-size: 9pt; font-family: Arial">
											${corrfault.prontoDescription}
										</td>
									</tr>
								</g:each>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</g:if>
	
	<g:if test="${featureBuildInstance?.correctedprontosfromlastL6}">
		<div class="body">
			<p class="MsoNormal" style="margin-bottom: 12pt;">
				<span style="font-size: 12pt; font-family: Arial; color: blue;"><br>
					<b>- Other CF after last QL6 load: ${featureBuildInstance?.lastL6id}:</b> </span>
			</p>

			<table>
				<tr class="prop">
					<td valign="top" style="text-align: left;" class="value">
						<div class="body">
							<table>
								<tr bgcolor="#DFE8F6">
									<td
										style="width: 120; font-size: 11pt; font-family: Arial; text-align: center">Component</td>
									<td
										style="width: 300; font-size: 11pt; font-family: Arial; text-align: center">Baseline</td>
									<td
										style="width: 180; font-size: 11pt; font-family: Arial; text-align: center">PR
										ID</td>
									<td
										style="width: 400; font-size: 11pt; font-family: Arial; text-align: center">Faults
										Description</td>
								</tr>

								<g:each in="${featureBuildInstance?.correctedprontosfromlastL6}" status="k"
									var="corrfault">
									<tr>
										<td style="width: 120; font-size: 10pt; font-family: Arial">
											${corrfault.componentName}
										</td>
										<td style="width: 300; font-size: 10pt; font-family: Arial">
											${corrfault.componentBaseLine}
										</td>
										<td
											style="width: 180; font-size: 10pt; font-weight: bold; font-family: Arial; color: RED">
											${corrfault.prontoID}
										</td>
										<td style="width: 400; font-size: 9pt; font-family: Arial">
											${corrfault.prontoDescription}
										</td>
									</tr>
								</g:each>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</g:if>
	
	<div class="body">
		<p class="MsoNormal" style="margin-bottom: 12pt;">
			<span style="font-size: 12pt; font-family: Arial; color: blue;"><br>
			<br> <b>- Download Information:</b></span><br> 
			<span style="font-size: 10pt; font-family: Arial; color: blue">You should download eNB Load(3G) from CI Server:</span><br> 
			<span style="font-size: 10pt; font-family: Arial; color: blue">http://microrec3gci.china.nsn-net.net/microREC/eNB/</span><br>
			<span style="font-size: 10pt; font-family: Arial; color: blue">You should download Panasonic MW(3G) from CI Server:</span><br>
			<span style="font-size: 10pt; font-family: Arial; color: blue">http://microrec3gci.china.nsn-net.net/microREC/MW/</span><br>
		</p>
	</div>	

	<div class="body">
		<p class="MsoNormal" style="margin-bottom: 12pt;">
			<span style="font-size: 12pt; font-family: Arial; color: blue;"><br>
			<br> <b>- Other Information:</b></span><br> 
			<span style="font-size: 10pt; font-family: Arial; color: blue">You can get detail Feature Build Information via visiting:</span><br> 
			<span style="font-size: 10pt; font-family: Arial; color: blue">http://microrec3gci.china.nsn-net.net:8080/iDashboard</span><br>
			<span style="font-size: 10pt; font-family: Arial; color: blue">Detailed Quality Level Description:</span><br> 
			<span style="font-size: 10pt; font-family: Arial; color: blue">http://microrec3gci.china.nsn-net.net:8080/iDashboard/quailtylevel</span><br>
		</p>
		<br> <br> <span style="font-size: 10pt; font-family: Arial;">Br,<br>
			microREC 3G QT Team<o:p></o:p></span>
	</div>

</body>
</html>