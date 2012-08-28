package toptrouxas

import br.com.image.ImageTool

class Usuario {

	String nome
	String senha
	String email
	Integer pontuacaoTotal
	List historias
	byte[] avatar

	static constraints = {
		avatar(nullable:true, maxSize: 24000, height : 20, width : 20)
		pontuacaoTotal(nullable:true, blank:true)
		email(unique:true)
	}

	static hasMany = [historias : Historia]

	def beforeInsert = {
		senha = senha.encodeAsSHA()
		def imageTool = new ImageTool()
		imageTool.load(avatar)
		imageTool.thumbnail(100)
		avatar = imageTool.getBytes("JPEG")
	}
}
