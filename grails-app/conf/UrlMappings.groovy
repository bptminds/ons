class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?(.$format)?"{
			constraints {
			}
		}

		"/"(controller:'home')
		"/registration"(controller:'registration')
		"/login"(controller:'login')
		"/logout"(controller:'logout')
		"/calendar"(controller:'home', action:'calendar')
		"/users"(resources:'user')
		
		"403"(view:'/errors/403')
		"404"(view:'/errors/404')
		"500"(view:'/errors/500')
		"503"(view:'/errors/503')
	}
}
