

<%@ page import="com.webapp.OrganizationHoliday" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organizationHoliday.label', default: 'OrganizationHoliday')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
					<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="${organizationHolidayInstance}">
				<bootstrap:alert class="alert-danger">
				<ul>
					<g:eachError bean="${organizationHolidayInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" url="[resource:organizationHolidayInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${organizationHolidayInstance?.version}" />
						<fieldset>
					        <f:with bean="organizationHolidayInstance">
						    
                                    <f:field property="name" input-class="form-control"/>
            				
                                    <f:field property="starttime" input-class="form-control"/>
            				
                                    <f:field property="endtime" input-class="form-control"/>
            				
                                    <f:field property="organization" input-class="form-control"/>
            				
                            </f:with>
							<div class="form-group">
								<div class="col-sm-5 col-sm-offset-2">
									<button type="submit" class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span>
										<g:message code="default.button.update.label" default="Update" />
									</button>
									<button type="submit" class="btn btn-danger" name="_action_delete" formnovalidate>
										<span class="glyphicon glyphicon-trash"></span>
										<g:message code="default.button.delete.label" default="Delete" />
									</button>
								</div>
							</div>
						</fieldset>
					</g:form>
				</fieldset>

			</div>

		</div>
	</body>
</html>
