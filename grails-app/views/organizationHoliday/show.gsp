

<%@ page import="com.webapp.OrganizationHoliday" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organizationHoliday.label', default: 'OrganizationHoliday')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			
			<div class="col-md-3">
				<div class="well">
					<ul class="nav nav-pills nav-stacked">
						<li>
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
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
                
				<dl class="dl-horizontal">
				
					
					<f:display bean="${organizationHolidayInstance}" property="name"/>
					
				
					
					<f:display bean="${organizationHolidayInstance}" property="starttime"/>
					
				
					
					<f:display bean="${organizationHolidayInstance}" property="endtime"/>
					
				
					
					<f:display bean="${organizationHolidayInstance}" property="dateCreated"/>
					
				
					
					<f:display bean="${organizationHolidayInstance}" property="organization"/>
					
				
				</dl>

				<g:form url="[resource:organizationHolidayInstance, action:'delete']" method="DELETE">
					<div class="form-group">
						<g:link class="btn btn-default" action="edit" id="${organizationHolidayInstance?.id}">
							<span class="glyphicon glyphicon-pencil"></span>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<span class="glyphicon glyphicon-trash"></span>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
