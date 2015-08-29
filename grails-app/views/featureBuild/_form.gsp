<%@ page import="LRC.FeatureBuild" %>



<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'packageName', 'error')} required">
	<label for="packageName">
		<g:message code="featureBuild.packageName.label" default="Package Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="packageName" required="" value="${featureBuildInstance?.packageName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'qtLevel', 'error')} required">
	<label for="qtLevel">
		<g:message code="featureBuild.qtLevel.label" default="Qt Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="qtLevel" from="${featureBuildInstance.constraints.qtLevel.inList}" required="" value="${featureBuildInstance?.qtLevel}" valueMessagePrefix="featureBuild.qtLevel"/>
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'qtProgress', 'error')} required">
	<label for="qtProgress">
		<g:message code="featureBuild.qtProgress.label" default="Qt Progress" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="qtProgress" from="${featureBuildInstance.constraints.qtProgress.inList}" required="" value="${featureBuildInstance?.qtProgress}" valueMessagePrefix="featureBuild.qtProgress"/>
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'startPkgBuildTime', 'error')} ">
	<label for="startPkgBuildTime">
		<g:message code="featureBuild.startPkgBuildTime.label" default="Start Pkg Build Time" />
		
	</label>
	<g:datePicker name="startPkgBuildTime" precision="minute"  value="${featureBuildInstance?.startPkgBuildTime}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'releaseTime', 'error')} ">
	<label for="releaseTime">
		<g:message code="featureBuild.releaseTime.label" default="Release Time" />
		
	</label>
	<g:datePicker name="releaseTime" precision="minute"  value="${featureBuildInstance?.releaseTime}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="featureBuild.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="200" rows="5" maxlength="1000" value="${featureBuildInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'pkgdownloadURL', 'error')} ">
	<label for="pkgdownloadURL">
		<g:message code="featureBuild.pkgdownloadURL.label" default="Pkgdownload URL" />
		
	</label>
	<g:textField name="pkgdownloadURL" value="${featureBuildInstance?.pkgdownloadURL}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'branchName', 'error')} ">
	<label for="branchName">
		<g:message code="featureBuild.branchName.label" default="branchName" />
		
	</label>
	<g:textField name="branchName" value="${featureBuildInstance?.branchName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'releaseBranch', 'error')} ">
	<label for="releaseBranch">
		<g:message code="featureBuild.releaseBranch.label" default="releaseBranch" />
		
	</label>
	<g:textField name="releaseBranch" value="${featureBuildInstance?.releaseBranch}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'DSP_Version', 'error')} ">
	<label for="DSP_Version">
		<g:message code="featureBuild.DSP_Version.label" default="DSP Version" />
		
	</label>
	<g:textField name="DSP_Version" value="${featureBuildInstance?.DSP_Version}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'PNS_Version', 'error')} ">
	<label for="PNS_Version">
		<g:message code="featureBuild.PNS_Version.label" default="PNS Version" />
		
	</label>
	<g:textField name="PNS_Version" value="${featureBuildInstance?.PNS_Version}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'PS_Version', 'error')} ">
	<label for="PS_Version">
		<g:message code="featureBuild.PS_Version.label" default="PS Version" />
		
	</label>
	<g:textField name="PS_Version" value="${featureBuildInstance?.PS_Version}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'OAM_Version', 'error')} ">
	<label for="OAM_Version">
		<g:message code="featureBuild.OAM_Version.label" default="OAM Version" />
		
	</label>
	<g:textField name="OAM_Version" value="${featureBuildInstance?.OAM_Version}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'TRS_Version', 'error')} ">
	<label for="TRS_Version">
		<g:message code="featureBuild.TRS_Version.label" default="TRS Version" />
		
	</label>
	<g:textField name="TRS_Version" value="${featureBuildInstance?.TRS_Version}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: featureBuildInstance, field: 'SMC_Version', 'error')} ">
	<label for="SMC_Version">
		<g:message code="featureBuild.SMC_Version.label" default="SMC Version" />
		
	</label>
	<g:textField name="SMC_Version" value="${featureBuildInstance?.SMC_Version}"/>
</div>

