package com.webapp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OrganizationHolidayController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static menuItem = "OrganizationHolidays"

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OrganizationHoliday.list(params), model:[organizationHolidayInstanceCount: OrganizationHoliday.count()]
    }

    def show(OrganizationHoliday organizationHolidayInstance) {
        respond organizationHolidayInstance
    }

    def create() {
        respond new OrganizationHoliday(params)
    }

    @Transactional
    def save(OrganizationHoliday organizationHolidayInstance) {
        if (organizationHolidayInstance == null) {
            notFound()
            return
        }

        if (organizationHolidayInstance.hasErrors()) {
            respond organizationHolidayInstance.errors, view:'create'
            return
        }

        organizationHolidayInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'organizationHolidayInstance.label', default: 'OrganizationHoliday'), organizationHolidayInstance.id])
                redirect organizationHolidayInstance
            }
            '*' { respond organizationHolidayInstance, [status: CREATED] }
        }
    }

    def edit(OrganizationHoliday organizationHolidayInstance) {
        respond organizationHolidayInstance
    }

    @Transactional
    def update(OrganizationHoliday organizationHolidayInstance) {
        if (organizationHolidayInstance == null) {
            notFound()
            return
        }

        if (organizationHolidayInstance.hasErrors()) {
            respond organizationHolidayInstance.errors, view:'edit'
            return
        }

        organizationHolidayInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OrganizationHoliday.label', default: 'OrganizationHoliday'), organizationHolidayInstance.id])
                redirect organizationHolidayInstance
            }
            '*'{ respond organizationHolidayInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OrganizationHoliday organizationHolidayInstance) {

        if (organizationHolidayInstance == null) {
            notFound()
            return
        }

        organizationHolidayInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OrganizationHoliday.label', default: 'OrganizationHoliday'), organizationHolidayInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'organizationHolidayInstance.label', default: 'OrganizationHoliday'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
