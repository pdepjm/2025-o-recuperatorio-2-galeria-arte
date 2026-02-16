class EstadoDeteriorado {
  const deterioro
  
  method efectoSobreValor(obra) = obra.valorOriginal().min(deterioro / 10)
  
  method restaurar(obra, presupuesto) {
    if (presupuesto >= (deterioro * 1000)) obra.sanar() else obra.arruinarse()
  }
  
  method sePuedeExponer(obra) = (deterioro < 30) and (obra.valor() < 100000)
}

object estadoArruinado {
  method efectoSobreValor(obra) = obra.valorOriginal()
  
  method restaurar(_obra, _presupuesto) {
    throw new DomainException(
      message = "Las obras arruinadas no se pueden restaurar"
    )
  }
  
  method sePuedeExponer(_obra) = false
}

object estadoSana {
  method efectoSobreValor(_obra) = 0
  
  method restaurar(_obra, _presupuesto) {
    
  }
  
  method sePuedeExponer(_obra) = true
}