import aparatos.*

class Paciente {
	var edad
	var masaMuscular 
	var nivelDolor
	const rutina = []
	
	
	method edad()=edad
	method masaMuscular()=masaMuscular
	method nivelDolor()=nivelDolor
	
	method disminuirDolor(unaCantidad){
		nivelDolor = 0.max(nivelDolor - unaCantidad)
	}
	
	method aumentarMasaMuscular(unaCantidad){
		masaMuscular = masaMuscular + unaCantidad
	}
	
	method usar(aparato){
		aparato.usarse(self)
	}
	
	method puedeUsar(aparato) = aparato.puedeUsarsePor(self)
	
	method puedeHacerRutina() = rutina.all { aparato => self.puedeUsar(aparato)}
	
	method hacerRutina(){rutina.forEach { aparato => self.usar(aparato)} }
	
}

class Resistente inherits Paciente {
	override method hacerRutina() {
		super()
		self.aumentarMasaMuscular(rutina.size())
	}

}

class Caprichoso inherits Paciente {
	override method puedeHacerRutina(){ 
		return super() && self.algunAparatoEsRojo()
	}
	
	method algunAparatoEsRojo() {
		return rutina.any({aparato => aparato.color()=="rojo"})
	}
	
	override method hacerRutina(){
		super()
		super()
	}
}

class RapidaRecuperacion inherits Paciente {
	override method hacerRutina(){
		super()
		self.disminuirDolor(nivelDolorDisminuyeAdicional.valor())
	}
}

object nivelDolorDisminuyeAdicional{
	var property valor = 3
}
