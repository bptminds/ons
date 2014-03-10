package com.webapp

class OrganizationHoliday {
    String name
    Date starttime
    Date endtime
    Date dateCreated
    Date lastUpdated

    static belongsTo = [organization:Organization]

    static constraints = {
        name blank:false
        starttime blank:false
        endtime blank:false
    }
	
    static views = [
	    list: [includes:['name', 'starttime', 'endtime']],
	    show: [excludes:['lastUpdated']],
	    create: [excludes:['dateCreated', 'lastUpdated']],
	    edit: [excludes:['dateCreated', 'lastUpdated']]
	]
	
	String toString() { name }
}
