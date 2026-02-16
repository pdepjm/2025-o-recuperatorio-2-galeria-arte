class Obra {
  var estado
  const autor
  const año
  
  method valor() = self.valorOriginal() - estado.efectoSobreValor(self)
  
  method valorOriginal() = self.valorBase() * autor.factorSobreValor()
  
  method valorBase()
  
  method esDePeriodo(inicio, fin) = (año >= inicio) and (año <= fin)
  
  method esRenacentista() = self.esDePeriodo(1350, 1527)
  
  method esMedieval() = self.esDePeriodo(476, 1349)
  
  method restaurar(presupuesto) {
    estado.restaurar(self, presupuesto)
  }
  
  method sanar() {
    estado = estadoSana
  }
  
  method arruinarse() {
    estado = estadoArruinado
  }
  
  method autor() = autor
  
  method esDeAutor(unAutor) = unAutor == autor
  
  method sePuedeExponer() = estado.sePuedeExponer(self)
}

class Pintura inherits Obra {
  const atractivo
  
  // Tambien se podrian representar los periodos con objetos
  method indiceSegunPeriodo() {
    if (self.esRenacentista()) {
      return 7
    }
    if (self.esMedieval()) {
      return 3
    }
    return 1
  }
  
  override method valorBase() = atractivo * self.indiceSegunPeriodo()
}

class Fresco inherits Pintura {
  override method valorBase() = super() * 1.1
  
  override method restaurar(presupuesto) {
    super(presupuesto * 0.8)
  }
}

class Escultura inherits Obra {
  const material
  const largo
  const ancho
  const alto
  
  method volumen() = (largo * ancho) * alto
  
  override method valorBase() = material.valor() * self.volumen()
}

object zapatila {
  // Ejemplo de un objeto intervenido que no es una obra
  method valor() = 100
}

class Intervencion inherits Obra {
  const objetoIntervenido
  
  override method valorBase() = objetoIntervenido.valor() + 10000
}