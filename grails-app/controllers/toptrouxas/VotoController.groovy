package toptrouxas

import org.springframework.dao.DataIntegrityViolationException

class VotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [votoInstanceList: Voto.list(params), votoInstanceTotal: Voto.count()]
    }

    def create() {
        [votoInstance: new Voto(params)]
    }

    def save() {
        def votoInstance = new Voto(params)
        if (!votoInstance.save(flush: true)) {
            render(view: "create", model: [votoInstance: votoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'voto.label', default: 'Voto'), votoInstance.id])
        redirect(action: "show", id: votoInstance.id)
    }

    def show() {
        def votoInstance = Voto.get(params.id)
        if (!votoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'voto.label', default: 'Voto'), params.id])
            redirect(action: "list")
            return
        }

        [votoInstance: votoInstance]
    }

    def edit() {
        def votoInstance = Voto.get(params.id)
        if (!votoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voto.label', default: 'Voto'), params.id])
            redirect(action: "list")
            return
        }

        [votoInstance: votoInstance]
    }

    def update() {
        def votoInstance = Voto.get(params.id)
        if (!votoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voto.label', default: 'Voto'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (votoInstance.version > version) {
                votoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'voto.label', default: 'Voto')] as Object[],
                          "Another user has updated this Voto while you were editing")
                render(view: "edit", model: [votoInstance: votoInstance])
                return
            }
        }

        votoInstance.properties = params

        if (!votoInstance.save(flush: true)) {
            render(view: "edit", model: [votoInstance: votoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'voto.label', default: 'Voto'), votoInstance.id])
        redirect(action: "show", id: votoInstance.id)
    }

    def delete() {
        def votoInstance = Voto.get(params.id)
        if (!votoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'voto.label', default: 'Voto'), params.id])
            redirect(action: "list")
            return
        }

        try {
            votoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'voto.label', default: 'Voto'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'voto.label', default: 'Voto'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
