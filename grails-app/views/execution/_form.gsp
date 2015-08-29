<%@ page import="LRC.Execution" %>



<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'executionDate', 'error')} required">
	<label for="executionDate">
		<g:message code="execution.executionDate.label" default="Execution Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="executionDate" required="" value="${executionInstance?.executionDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'targetLoadName', 'error')} ">
	<label for="targetLoadName">
		<g:message code="execution.targetLoadName.label" default="Target Load Name" />
		
	</label>
	<g:textField name="targetLoadName" value="${executionInstance?.targetLoadName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'nsnCPCaseNumberTA', 'error')} required">
	<label for="nsnCPCaseNumberTA">
		<g:message code="execution.nsnCPCaseNumberTA.label" default="Nsn CPC ase Number TA" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nsnCPCaseNumberTA" required="" value="${executionInstance?.nsnCPCaseNumberTA}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'nsnCMCaseNumberTA', 'error')} required">
	<label for="nsnCMCaseNumberTA">
		<g:message code="execution.nsnCMCaseNumberTA.label" default="Nsn CMC ase Number TA" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nsnCMCaseNumberTA" required="" value="${executionInstance?.nsnCMCaseNumberTA}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'cieNetCMCaseNumberTA', 'error')} required">
	<label for="cieNetCMCaseNumberTA">
		<g:message code="execution.cieNetCMCaseNumberTA.label" default="Cie Net CMC ase Number TA" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cieNetCMCaseNumberTA" required="" value="${executionInstance?.cieNetCMCaseNumberTA}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'cieNetCPCaseNumberTA', 'error')} required">
	<label for="cieNetCPCaseNumberTA">
		<g:message code="execution.cieNetCPCaseNumberTA.label" default="Cie Net CPC ase Number TA" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cieNetCPCaseNumberTA" required="" value="${executionInstance?.cieNetCPCaseNumberTA}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'nsnCPCaseNumberTAPass', 'error')} required">
	<label for="nsnCPCaseNumberTAPass">
		<g:message code="execution.nsnCPCaseNumberTAPass.label" default="Nsn CPC ase Number TAP ass" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nsnCPCaseNumberTAPass" required="" value="${executionInstance?.nsnCPCaseNumberTAPass}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'nsnCMCaseNumberTAPass', 'error')} required">
	<label for="nsnCMCaseNumberTAPass">
		<g:message code="execution.nsnCMCaseNumberTAPass.label" default="Nsn CMC ase Number TAP ass" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nsnCMCaseNumberTAPass" required="" value="${executionInstance?.nsnCMCaseNumberTAPass}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'cieNetCPCaseNumberTAPass', 'error')} required">
	<label for="cieNetCPCaseNumberTAPass">
		<g:message code="execution.cieNetCPCaseNumberTAPass.label" default="Cie Net CPC ase Number TAP ass" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cieNetCPCaseNumberTAPass" required="" value="${executionInstance?.cieNetCPCaseNumberTAPass}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'cieNetCMCaseNumberTAPass', 'error')} required">
	<label for="cieNetCMCaseNumberTAPass">
		<g:message code="execution.cieNetCMCaseNumberTAPass.label" default="Cie Net CMC ase Number TAP ass" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cieNetCMCaseNumberTAPass" required="" value="${executionInstance?.cieNetCMCaseNumberTAPass}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'nsnCPCaseNumberAll', 'error')} required">
	<label for="nsnCPCaseNumberAll">
		<g:message code="execution.nsnCPCaseNumberAll.label" default="Nsn CPC ase Number All" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nsnCPCaseNumberAll" required="" value="${executionInstance?.nsnCPCaseNumberAll}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'nsnCMCaseNumberAll', 'error')} required">
	<label for="nsnCMCaseNumberAll">
		<g:message code="execution.nsnCMCaseNumberAll.label" default="Nsn CMC ase Number All" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nsnCMCaseNumberAll" required="" value="${executionInstance?.nsnCMCaseNumberAll}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'cieNetCPCaseNumberAll', 'error')} required">
	<label for="cieNetCPCaseNumberAll">
		<g:message code="execution.cieNetCPCaseNumberAll.label" default="Cie Net CPC ase Number All" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cieNetCPCaseNumberAll" required="" value="${executionInstance?.cieNetCPCaseNumberAll}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionInstance, field: 'cieNetCMCaseNumberAll', 'error')} required">
	<label for="cieNetCMCaseNumberAll">
		<g:message code="execution.cieNetCMCaseNumberAll.label" default="Cie Net CMC ase Number All" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cieNetCMCaseNumberAll" required="" value="${executionInstance?.cieNetCMCaseNumberAll}"/>
</div>

