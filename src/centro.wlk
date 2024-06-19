import pacientes.*
import aparatos.*

object centro {
	const pacientes = []
	const aparatos = []
	
	
	method coloresAparatos() {
		return aparatos.map( { aparato => aparato.color()}).asSet()
	}
	
	method pacienteMenoresA8() {
		return pacientes.filter( {paciente=> paciente.edad() < 8 })
	}
	
	method pacientesNoPuedenCumplirRutina() {
		return pacientes.count({paciente=> not paciente.puedeHacerRutina()})
	}
	
	method optimasCondiciones () {
		return aparatos.all { aparato => not aparato.necesitaMantenimiento()}
	}
	
	method estaComplicado() {
		const necestianMantenimiento = aparatos.count { aparato => aparato.necesitaMantenimiento()}
		return necestianMantenimiento >= aparatos.size() / 2
	}
	
	method registrarVisitaTecnico() {
		aparatos.filter( {aparato => aparato.necesitaMantenimiento()})
		.forEach ( { aparato => aparato.hacerMantenimiento() })
	}
}
