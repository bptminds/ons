package com.webapp

class Organization {
    
    String name
    Date dateCreated
    Date lastUpdated
    
    static hasMany = [holidays:OrganizationHoliday]

    static constraints = {
        name blank:false
    }
	
	static mapping = {
		holidays sort:'id'
	}
	
    static views = [
	    list: [includes:['name']],
	    show: [excludes:['lastUpdated']],
	    create: [excludes:['holidays', 'dateCreated', 'lastUpdated']],
	    edit: [excludes:['dateCreated', 'lastUpdated']]
	]
	
	String toString() { name }
}
