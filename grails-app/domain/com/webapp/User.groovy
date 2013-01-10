package com.webapp

class User {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	String fullName
	String email
	Date dateOfBirth
	Address address
	
	static embedded = ["address"]

	static constraints = {
		username blank: false, unique: true
		password blank: false
		fullName blank: false
		email nullable: true, email: true
		dateOfBirth nullable: true
		address nullable: true
	}

	static mapping = {
		password column: '`password`'
	}
	
	static views = [
	    list: [includes:['fullName', 'email', 'address']]
	]

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}