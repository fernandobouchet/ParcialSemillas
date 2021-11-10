object inta {
	const parcelas = #{}
	
	method promedioDePlantas() = parcelas.sum({ parc => parc.size() }) / parcelas.size()
	
	method parcelaMasAutosustentable() = parcelas.filter({ parc => parc.size() > 4}).max({ parc => parc.cantPlantasBienAsociadas() })
	
}
