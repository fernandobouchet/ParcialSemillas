import plantas.*

class Parcelas {
	var property ancho
	var property largo
	var property horasDeSol
	
	const plantas = #{}
		
	method superficie() = ancho * largo
	
	method cantidadMaxima() = if (ancho > largo) {self.superficie() / 5} else {self.superficie() / 3 + largo}
	
	method tieneComplicaciones() = plantas.any({ plant => plant.horasDeSolTolera() < horasDeSol})
	
	method plantar(planta) {
		if (plantas.size() < self.cantidadMaxima() or horasDeSol > (planta.horasDeSolTolera() + 2))
		{plantas.add(planta)}
		else
		{self.error("Se llego al limite de la cantidad maxima de plantas o la planta no tolera las horas de sol de la parcela.")}
	}
	method seAsociaBien(planta) = false
	
	method cantPlantasBienAsociadas() = plantas.count({ plant => plant.seAsociaBien(plant)})
}

class ParcelaEcologica inherits Parcelas {
	override method seAsociaBien(planta) = not self.tieneComplicaciones() and planta.esParcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcelas {
	override method seAsociaBien(planta) = plantas.size() <= 2 and planta.esFuerte()
}