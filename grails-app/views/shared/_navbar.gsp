<%! import org.codehaus.groovy.grails.commons.GrailsClassUtils as GCU %>

<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="container">
		
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		
			<a class="navbar-brand" href="${createLink(uri: '/')}">${meta(name: 'app.name')}</a>
		</div>

		<div class="navbar-collapse collapse" id="navbar-collapse-1">
			<ul class="nav navbar-nav">							
				<sec:ifLoggedIn>
					<g:each var="c" in="${grailsApplication.controllerClasses.findAll { GCU.isStaticProperty(it.clazz, 'menuItem') }.sort { it.fullName } }">
						<li<%= c.logicalPropertyName == controllerName ? ' class="active"' : '' %>><g:link controller="${c.logicalPropertyName}">${c.clazz.menuItem}</g:link></li>
					</g:each>
				</sec:ifLoggedIn>
				<sec:ifNotLoggedIn>
					<li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a href="${createLink(uri: '/')}">Home</a></li>
				    <li><a href="${createLink(uri: '/')}">About</a></li>
				    <li><a href="${createLink(uri: '/')}">Tour</a></li>
				    <li><a href="${createLink(uri: '/')}">Pricing</a></li>
				</sec:ifNotLoggedIn>
			</ul>
			
	        <ul class="nav navbar-nav navbar-right">
				<sec:ifLoggedIn>
	                <li class="dropdown">
	                    <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> <sec:loggedInUserInfo field="fullName" /><b class="caret"></b></a>
	                    <ul class="dropdown-menu">
	                        <li><g:link controller="logout">Sign Out</g:link></li>
	                    </ul>
	                </li>
	                <sec:ifAllGranted roles="ROLE_ADMIN">
	                    <li class="dropdown">
	                        <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-cog"></i><b class="caret"></b></a>
	                        <ul class="dropdown-menu">
	                            <li><g:link controller="console">Groovy Console</g:link></li>
	                            <g:if test="${System.env['DATABASE_URL']}">
	                                <li><h:dbconsoleLink>Database Console</h:dbconsoleLink></li>
	                            </g:if>
	                            <g:else>
	                                <li><g:link controller="dbconsole">Database Console</g:link></li>
	                            </g:else>
	                        </ul>
	                    </li>
	                </sec:ifAllGranted>
	            </sec:ifLoggedIn>
	            <sec:ifNotLoggedIn>
	                <li><g:link controller="registration">Sign Up</g:link></li>
	                <li><g:link controller="login">Login</g:link></li>
	            </sec:ifNotLoggedIn>
	        </ul>
		</div>
		
	</div>
</nav>
