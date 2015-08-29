<%@ page contentType="text/html;charset=ISO-8859-1"%>
<%@ page import="LRC.Regression"%>
<%@ page import="LRC.RegressionCase"%>
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
				${regressionInstance?.targetLoadName}
			</span> <span style="font-size: 10pt; font-family: Arial; color: blue">CBR
				status: </span>
		</p>
	</div>

	<div class="body">
		<p class="MosNormal" style="margin-bottom: 10pt">
			<span style="font-size: 11pt; font-family: Arial; color: blue">
				<b>- 3G CBR Results:</b>
			</span>
			<pre>${regressionInstance?.cbrLevel}   ${regressionInstance?.cbrStatus}</pre>
		</p>
	</div>
	
	<g:if test="${regressionInstance?.comments}">
	<div class="body">
		<p class="MosNormal" style="margin-bottom: 10pt">
			<span style="font-size: 11pt; font-family: Arial; color: red">
				<b>- Important CBR Notes:</b><br>
			</span>
			<pre>${regressionInstance?.comments}</pre>
		</p>
	</div>
	</g:if>

	<g:if test="${!regressionInstance?.cbrStatus.equalsIgnoreCase('INITIAL')}">
		<div class="body">
			<p class="MsoNormal" style="margin-bottom: 12pt;">
				<span style="font-size: 11pt; font-family: Arial; color: blue;"><br>
					<b>- Feature Build 3G CBR Quality Level:</b> </span>
			</p>
			<table border="1" cellpadding="0">
				<tr>
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">CBR Level Number</span></b><b><span
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
				</tr>
				<tr>
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">7</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<td style="width: 300; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">All Critical Regression Case Executed And PASS</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<g:if test="${ 7 <= regressionInstance?.calculateCBRLevel()}">
					<td style="width: 60; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight:bold; font-family: Arial; color: green;">PASS</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					<g:if test="${!(7 <= regressionInstance?.calculateCBRLevel())}">
					<td style="width: 60; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight: bold; font-family: Arial; color: red;">FAIL</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
				</tr>
				<tr>
					<td style="width: 100; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">8</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>			
					<td style="width: 300; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-family: Arial; color: black;">All CBR Regression Case Executed and PASS</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					<g:if test="${ 8 <= regressionInstance?.calculateCBRLevel()}">
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight:bold; font-family: Arial; color: green;">PASS</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
					<g:if test="${!(8 <= regressionInstance?.calculateCBRLevel())}">
					<td style="width: 80; text-align: center">
						<p class="MsoNormal">
							<b><span
								style="font-size: 10pt; font-weight: bold; font-family: Arial; color: red;">FAIL</span></b><b><span
								style="font-size: 10pt; font-family: Arial; color: black;"></span></b>
						</p>
					</td>
					</g:if>
				</tr>
			</table>
		</div>
	</g:if>
	
	<g:if test="${regressionInstance?.regressionCases}">

		<div class="body">
			<p class="MsoNormal" style="margin-bottom: 12pt;">
				<span style="font-size: 11pt; font-family: Arial; color: blue;"><br>
					<b>- Execution Brief Statistics:</b> </span>
			</p>
			
			<table border="1" cellpadding="0">
				<tr class="prop">
					<td valign="top" style="text-align: left;" class="value">
						<div class="body">
							<table>
								<tr bgcolor="#DFE8F6">
									<td
										style="font-size: 10pt; font-family: Arial; text-align: center">All CBR Case Number</td>
									<td
										style="font-size: 10pt; font-family: Arial; text-align: center">Pass Ratio</td>
									<td
										style="font-size: 10pt; font-family: Arial; text-align: center">Total Execution (Mins)</td>
									<td
										style="font-size: 10pt; font-family: Arial; text-align: center">Valued Execution (Mins)</td>
									<td
										style="font-size: 10pt; font-family: Arial; text-align: center">Wasted Execution (Mins)</td>
								</tr>
								<tr>
									<td style="font-size: 10pt; font-family: Arial">${regressionInstance.allNumber}</td>
									<td style="font-size: 10pt; font-family: Arial">${regressionInstance.getPassRatio()}%</td>
									<td style="font-size: 10pt; font-family: Arial">${regressionInstance.allExecutionMinutes}</td>
									<td style="font-size: 10pt; font-family: Arial; color:GREEN">${regressionInstance.estimateValuedDuration()}</td>
									<td style="font-size: 10pt; font-family: Arial; color: RED">${regressionInstance.estimateWastedDuration()}</td>										
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>			
		</div>
	
		<div class="body">
			<p class="MsoNormal" style="margin-bottom: 12pt;">
				<span style="font-size: 11pt; font-family: Arial; color: blue;"><br>
					<b>- Executed CBR Case on this Build:</b> </span>
			</p>

			<table border="1" cellpadding="0">
				<tr class="prop">
					<td valign="top" style="text-align: left;" class="value">
						<div class="body">
							<table>
								<tr bgcolor="#DFE8F6">
									<td
										style="font-size: 10pt; font-family: Arial; text-align: center">Case Name</td>
									<td
										style="font-size: 10pt; font-family: Arial; text-align: center">Executed Duration (Mins)</td>
									<td
										style="font-size: 10pt; font-family: Arial; text-align: center">Execution Status</td>
									<td
										style="font-size: 10pt; font-family: Arial; text-align: center">Failure Reason</td>										
									<td
										style="font-size: 10pt; font-family: Arial; text-align: center">Comments</td>
								</tr>

								<g:each in="${regressionInstance.regressionCases}" status="k" var="regCase">
									<tr>
										<td style="font-size: 8pt; font-family: Arial">${regCase.caseName}</td>
										<td style="font-size: 8pt; font-family: Arial">${regCase.duration}</td>
										<td style="font-size: 8pt; font-family: Arial">${regCase.status}</td>
										<td style="font-size: 8pt; font-family: Arial; color: RED">${regCase.failureReason}</td>										
										<td	style="font-size: 8pt; font-family: Arial">${regCase.comment}</td>										
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
			microREC 3G CI Team<o:p></o:p></span>
	</div>

</body>
</html>