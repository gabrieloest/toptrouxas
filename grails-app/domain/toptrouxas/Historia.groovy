package toptrouxas

class Historia {
	
	String titulo
	String descricao
	Date dateCreated

    static constraints = {
    }
	
	static hasMany = [votos : Voto]
	static belongsTo = [usuario : Usuario]
}
