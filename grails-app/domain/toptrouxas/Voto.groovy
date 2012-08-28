package toptrouxas

class Voto {
	
	String comentario
	Integer pontuacao

    static constraints = {
		pontuacao(min:0, max:10)
    }
	
	static belongsTo = [historia : Historia]
}
