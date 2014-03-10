package com.webapp

import grails.transaction.Transactional

@Transactional(readOnly = true)
class HomeController {

	def index() {
		if (isLoggedIn()) {
			//redirect controller:"project"
			render view:"index"
		} else {
			render view:"index"
		}
	}
}
