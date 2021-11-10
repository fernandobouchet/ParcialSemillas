class Plantas {
	var property anioDeObtencion = 0
	var property altura = 0
	var property horasDeSolTolera = 0
	
	method esFuerte() = horasDeSolTolera > 10
	
	method daNuevasSemillas() = self.esFuerte()
	
	method espacioQueOcupa()
	
	method esParcelaIdeal(parcela)
}

class Menta inherits Plantas {
	override method horasDeSolTolera() = 6
	
	override method daNuevasSemillas() = super() or altura > 0.4
	
	override method espacioQueOcupa() = altura * 3
	
	override method esParcelaIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Plantas {
	override method horasDeSolTolera() = if (altura < 0.5) {6} else if (altura.between(0.5, 1)) {7} else {9}
	
	override method daNuevasSemillas() = super() or (anioDeObtencion < 2007 and altura > 1)
	
	override method espacioQueOcupa() = altura / 2
	
	override method esParcelaIdeal(parcela) = parcela.horasDeSol() == self.horasDeSolTolera()
}

class Quinoa inherits Plantas {
	override method daNuevasSemillas() = super() or (anioDeObtencion < 2005)
	
	override method espacioQueOcupa() = 0.5
	
	override method esParcelaIdeal(parcela) = parcela.all({ plant => plant.altura() < 1.5})
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
	
	override method esParcelaIdeal(parcela) = parcela.cantidadMaxima() == 1
}

class Hierbabuena inherits Menta {
	override method espacioQueOcupa() = super() * 2
}