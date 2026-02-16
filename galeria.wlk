class Autor {
  const esFamoso
  const nombre
  
  method factorSobreValor() = if (esFamoso) 10 else 1
  
  method nombre() = nombre
}

object galeria {
  const obras = []
  
  method autoresDePeriodo(inicio, fin) {
    const autores = obras.filter({ obra => obra.esDePeriodo(inicio, fin) }).map(
      { obra => obra.autor() }
    )
    
    return autores.asSet().map({ autor => autor.nombre() })
  }
  
  method valorTotalDeAutor(autor) {
    const obrasDeAutor = obras.filter({ obra => obra.esDeAutor(autor) })
    
    return obrasDeAutor.sum({ obra => obra.valor() })
  }
  
  method obrasEnExposicion() = obras.filter({ obra => obra.sePuedeExponer() })
  
  method obraMasCara() = self.obrasEnExposicion().max({ obra => obra.valor() })
}