package toptrouxas

class LoginTagLib {
	def loginControl = {
		if(request.getSession(false) && session.user){
//			out << "Bem vindo ${session.user.nome}"
			out << """${link(action:"show", id:"${session.user.id}",
				controller:"usuario"){"Minha Conta"}}"""
			out << """${link(action:"logout",
		controller:"usuario"){"Logout"}}"""
		} else {
			out << """${link(action:"login",
		controller:"usuario"){"Login"}}"""
		}
	}
}
