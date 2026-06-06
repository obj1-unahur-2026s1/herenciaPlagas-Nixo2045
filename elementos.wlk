import plagas.*

class Hogar {
    var mugre
    const confort
    method esBueno() = mugre <= confort * 0.5
    method recibirAtaqueDe(unaPlaga) {
        mugre += unaPlaga.nivelDeDaño()
    }
}
class Huerta {
    var produccion
    method esBueno() = produccion > nivelDeCosecha.valor()
    method recibirAtaqueDe(unaPlaga) {
        produccion = produccion - 
            (unaPlaga.nivelDeDaño() * 0.1
            + if(unaPlaga.transmisionEnfermadad()) 10 else 0)
    }
}

object nivelDeCosecha {
    var property valor = 10
}

class Mascota {
    var salud
    method esBueno() = salud > 250
    method recibirAtaqueDe(unaPlaga) {
        if (unaPlaga.transmisionEnfermadad()) {
            salud = (salud - unaPlaga.nivelDeDaño()).max(0)
        }
    }
}

class Barrio {
    const property elementos = []

    method esCopado() = self.cantElementosBuenos() > elementos.size() / 2
    method cantElementosBuenos() = elementos.count({ p => p.esBueno()})
}