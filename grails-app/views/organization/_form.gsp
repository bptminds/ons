<%@ page import="com.webapp.Organization" %>



<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="organization.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${organizationInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'holidays', 'error')} ">
	<label for="holidays">
		<g:message code="organization.holidays.label" default="Holidays" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${organizationInstance?.holidays?}" var="h">
    <li><g:link controller="organizationHoliday" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="organizationHoliday" action="create" params="['organization.id': organizationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'organizationHoliday.label', default: 'OrganizationHoliday')])}</g:link>
</li>
</ul>


</div>

