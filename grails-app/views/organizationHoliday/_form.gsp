<%@ page import="com.webapp.OrganizationHoliday" %>



<div class="fieldcontain ${hasErrors(bean: organizationHolidayInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="organizationHoliday.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${organizationHolidayInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationHolidayInstance, field: 'starttime', 'error')} required">
	<label for="starttime">
		<g:message code="organizationHoliday.starttime.label" default="Starttime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="starttime" precision="day"  value="${organizationHolidayInstance?.starttime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: organizationHolidayInstance, field: 'endtime', 'error')} required">
	<label for="endtime">
		<g:message code="organizationHoliday.endtime.label" default="Endtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endtime" precision="day"  value="${organizationHolidayInstance?.endtime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: organizationHolidayInstance, field: 'organization', 'error')} required">
	<label for="organization">
		<g:message code="organizationHoliday.organization.label" default="Organization" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="organization" name="organization.id" from="${com.webapp.Organization.list()}" optionKey="id" required="" value="${organizationHolidayInstance?.organization?.id}" class="many-to-one"/>

</div>

