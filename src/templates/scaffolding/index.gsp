<% import grails.persistence.Event %>
<% import org.codehaus.groovy.grails.commons.GrailsClassUtils as GCU %>
<%=packageName%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">\${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>

			<div class="span9">
				
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="\${flash.message}">
				<bootstrap:alert class="alert-info">\${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped table-hover">
					<thead>
						<tr>
						<%  excludedProps = Event.allEvents.toList() << 'id' << 'version' << 'dateCreated' << 'lastUpdated'
						    if (GCU.isStaticProperty(domainClass.clazz, 'views')) excludedProps += domainClass.clazz.views?.list?.excludes ?: []
							allowedNames = domainClass.persistentProperties*.name
							if (GCU.isStaticProperty(domainClass.clazz, 'views') && domainClass.clazz.views?.list?.includes) {
							    allowedNames.retainAll(domainClass.clazz.views.list.includes)
							    excludedProps.removeAll(domainClass.clazz.views.list.includes)
						    }
							props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
							Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
							props.eachWithIndex { p, i ->
								if (i < 6) {
									if (p.isAssociation()) { %>
							<th class="header"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
						<%      } else { %>
							<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
						<%  }   }   } %>
						</tr>
					</thead>
					<tbody>
					<g:each in="\${${propertyName}List}" var="${propertyName}">
						<tr class="clickable">
						<%  props.eachWithIndex { p, i ->
						        if (i < 6) {
									if (p.type == Boolean || p.type == boolean) { %>
							<td><% if (!i) { %><g:link action="show" id="\${${propertyName}.id}"><% } %><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /><% if (!i) { %></g:link><% } %></td>
						<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
							<td><% if (!i) { %><g:link action="show" id="\${${propertyName}.id}"><% } %><g:formatDate date="\${${propertyName}.${p.name}}" /><% if (!i) { %></g:link><% } %></td>
						<%          } else { %>
							<td><% if (!i) { %><g:link action="show" id="\${${propertyName}.id}"><% } %>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}<% if (!i) { %></g:link><% } %></td>
						<%  }   }   } %>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="\${${propertyName}Total}" />
				</div>
			</div>

		</div>
	</body>
</html>