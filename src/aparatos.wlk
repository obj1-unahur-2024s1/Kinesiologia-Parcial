import pacientes.*
class Aparato {
	var property color = "blanco"
	method usarse(paciente)
	method puedeUsarsePor(paciente)
	method necesitaMantenimiento()
	method hacerMantenimiento()
	method efectoDelUso(paciente)
}

class Magneto inherits Aparato {
	var imantacion = 800
	override method puedeUsarsePor(paciente) = true
	override method usarse(paciente){
		paciente.disminuirDolor(paciente.nivelDolor() * 0.1)
		self.efectoDelUso(paciente)
		
	}
	override method necesitaMantenimiento() = imantacion < 100
	override method efectoDelUso(paciente) {
		imantacion = 0.max(imantacion - 1)
	}
	override method hacerMantenimiento() {
		imantacion = imantacion + 500
	}
	
}

class Bicicleta inherits Aparato {
	
	var cantVecesDesajustanTornillos = 0
	var cantVecesPierdeAceite = 0
	override method puedeUsarsePor(paciente) = paciente.edad() >=8
	
	override method usarse(paciente) {
	
			
		paciente.disminuirDolor(4)
		paciente.aumentarMasaMuscular(3)
	}
	
	override method efectoDelUso(paciente) {
		if (paciente.nivelDolor()>30)
			cantVecesDesajustanTornillos = cantVecesDesajustanTornillos  +1
		if (paciente.edad().between(30,50)){
			cantVecesPierdeAceite = cantVecesPierdeAceite + 1
		}
	}
	
	override method necesitaMantenimiento() = 
		cantVecesDesajustanTornillos >= 10 or cantVecesPierdeAceite >= 5
		
	override method hacerMantenimiento() {
		cantVecesDesajustanTornillos = 0
		cantVecesPierdeAceite = 0
	}
}

class MiniTramp inherits Aparato {
	override method puedeUsarsePor(paciente) = paciente.nivelDolor() < 20
	
	override method usarse(paciente) {
		paciente.aumentarMasaMuscular(paciente.edad() * 0.1)
	}
	override method efectoDelUso(paciente) {}

	override method necesitaMantenimiento() = false
		
	override method hacerMantenimiento() {}
}

