package toptrouxas

import org.springframework.dao.DataIntegrityViolationException

class HistoriaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [historiaInstanceList: Historia.list(params), historiaInstanceTotal: Historia.count()]
    }

    def create() {
        [historiaInstance: new Historia(params)]
    }

    def save() {
        def historiaInstance = new Historia(params)
        if (!historiaInstance.save(flush: true)) {
            render(view: "create", model: [historiaInstance: historiaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'historia.label', default: 'Historia'), historiaInstance.id])
        redirect(action: "show", id: historiaInstance.id)
    }

    def show() {
        def historiaInstance = Historia.get(params.id)
        if (!historiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'historia.label', default: 'Historia'), params.id])
            redirect(action: "list")
            return
        }

        [historiaInstance: historiaInstance]
    }

    def edit() {
        def historiaInstance = Historia.get(params.id)
        if (!historiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'historia.label', default: 'Historia'), params.id])
            redirect(action: "list")
            return
        }

        [historiaInstance: historiaInstance]
    }

    def update() {
        def historiaInstance = Historia.get(params.id)
        if (!historiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'historia.label', default: 'Historia'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (historiaInstance.version > version) {
                historiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'historia.label', default: 'Historia')] as Object[],
                          "Another user has updated this Historia while you were editing")
                render(view: "edit", model: [historiaInstance: historiaInstance])
                return
            }
        }

        historiaInstance.properties = params

        if (!historiaInstance.save(flush: true)) {
            render(view: "edit", model: [historiaInstance: historiaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'historia.label', default: 'Historia'), historiaInstance.id])
        redirect(action: "show", id: historiaInstance.id)
    }

    def delete() {
        def historiaInstance = Historia.get(params.id)
        if (!historiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'historia.label', default: 'Historia'), params.id])
            redirect(action: "list")
            return
        }

        try {
            historiaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'historia.label', default: 'Historia'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'historia.label', default: 'Historia'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def rate = {}
}
