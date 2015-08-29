<%@ page import="LRC.Toolings" %>

<div class="fieldcontain ${hasErrors(bean: toolingsInstance, field: 'isAbolish', 'error')} ">
	<label for="isAbolish">
		<g:message code="toolingsInstance.isAbolish.label" default="isAbolish" />
		
	</label>
	<g:checkBox name="isAbolish" value="${toolingsInstance?.isAbolish}" />
</div>

<div class="fieldcontain ${hasErrors(bean: toolingsInstance, field: 'featureBranch', 'error')} required">
	<label for="featureBranch">
		<g:message code="toolings.featureBranch.label" default="Feature Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="featureBranch" required="" value="${toolingsInstance?.featureBranch}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: toolingsInstance, field: 'releaseLabel', 'error')} required">
	<label for="releaseLabel">
		<g:message code="toolings.releaseLabel.label" default="Release Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="releaseLabel" required="" value="${toolingsInstance?.releaseLabel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: toolingsInstance, field: 'middleWare', 'error')} required">
	<label for="middleWare">
		<g:message code="toolings.middleWare.label" default="Middle Ware" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="middleWare" required="" value="${toolingsInstance?.middleWare}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: toolingsInstance, field: 'cntCPVersion', 'error')} required">
	<label for="cntCPVersion">
		<g:message code="toolings.cntCPVersion.label" default="cntCP Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cntCPVersion" required="" value="${toolingsInstance?.cntCPVersion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: toolingsInstance, field: 'cntSVVersion', 'error')} required">
	<label for="cntSVVersion">
		<g:message code="toolings.cntSVVersion.label" default="cntSV Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cntSVVersion" required="" value="${toolingsInstance?.cntSVVersion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: toolingsInstance, field: 'tm500Version', 'error')} ">
	<label for="tm500Version">
		<g:message code="toolings.tm500Version.label" default="Tm500 Version" />
		
	</label>
	<g:textField name="tm500Version" value="${toolingsInstance?.tm500Version}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: toolingsInstance, field: 'artizaVersion', 'error')} ">
	<label for="artizaVersion">
		<g:message code="toolings.artizaVersion.label" default="Artiza Version" />
		
	</label>
	<g:textField name="artizaVersion" value="${toolingsInstance?.artizaVersion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: toolingsInstance, field: 'eATTVersion', 'error')} ">
	<label for="eATTVersion">
		<g:message code="toolings.eATTVersion.label" default="eATT Version" />
		
	</label>
	<g:textField name="eATTVersion" value="${toolingsInstance?.eATTVersion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: toolingsInstance, field: 'DSPExplorerVersion', 'error')} ">
	<label for="DSPExplorerVersion">
		<g:message code="toolings.DSPExplorerVersion.label" default="DSP Explorer Version" />
		
	</label>
	<g:textField name="DSPExplorerVersion" value="${toolingsInstance?.DSPExplorerVersion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: toolingsInstance, field: 'BTSLogVersion', 'error')} ">
	<label for="BTSLogVersion">
		<g:message code="toolings.BTSLogVersion.label" default="BTSLog Version" />
		
	</label>
	<g:textField name="BTSLogVersion" value="${toolingsInstance?.BTSLogVersion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: toolingsInstance, field: 'MMTVersion', 'error')} ">
	<label for="MMTVersion">
		<g:message code="toolings.MMTVersion.label" default="MMT Version" />
		
	</label>
	<g:textField name="MMTVersion" value="${toolingsInstance?.MMTVersion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: toolingsInstance, field: 'memDumpVersion', 'error')} ">
	<label for="memDumpVersion">
		<g:message code="toolings.memDumpVersion.label" default="MemDump Version" />
		
	</label>
	<g:textField name="memDumpVersion" value="${toolingsInstance?.memDumpVersion}"/>
</div>

