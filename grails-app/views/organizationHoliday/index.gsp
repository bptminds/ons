

<%@ page import="com.webapp.OrganizationHoliday" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organizationHoliday.label', default: 'OrganizationHoliday')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			
			<div class="col-md-3">
				<div class="well">
					<ul class="nav nav-pills nav-stacked">
						<li class="active">
							<g:link class="list" action="index">
								<span class="glyphicon glyphicon-list"></span>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<span class="glyphicon glyphicon-plus"></span>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>

			<div class="col-md-9">
				
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped table-hover">
					<thead>
						<tr>
						
							<g:sortableColumn property="name" title="${message(code: 'organizationHoliday.name.label', default: 'Name')}" />
						
							<g:sortableColumn property="starttime" title="${message(code: 'organizationHoliday.starttime.label', default: 'Starttime')}" />
						
							<g:sortableColumn property="endtime" title="${message(code: 'organizationHoliday.endtime.label', default: 'Endtime')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${organizationHolidayInstanceList}" var="organizationHolidayInstance">
						<tr class="clickable">
						
							<td><g:link action="show" id="${organizationHolidayInstance.id}">${fieldValue(bean: organizationHolidayInstance, field: "name")}</g:link></td>
						
							<td><g:formatDate date="${organizationHolidayInstance.starttime}" /></td>
						
							<td><g:formatDate date="${organizationHolidayInstance.endtime}" /></td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
				<div>
					<bootstrap:paginate total="${organizationHolidayInstanceCount ?: 0}" action="index" />
				</div>
			</div>

		</div>
	</body>
</html>
