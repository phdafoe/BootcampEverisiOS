import UIKit

// -> un comentario en una linea
/*
  -> Este es un comenatrioenvarias lineas
 */

// MARK: - TIPOS BASICOS

var nombre: String = "pepe" //  var -> define una propiedad mutable
let apellido: String = "ramirez" // let -> define una propiedad inmutable

nombre = "Felipe"
// apellido = "Ocampo"

let profesion = "iOS Developer"
print(profesion)

print("El Sr. \(nombre + apellido), es \(profesion)")

// NSLog("El Sr. %@, es %@", nombre, profesion)

var numeroA: Int = 4
var numeroB = 3.8

var multiplicacion = Double(numeroA) * numeroB

typealias EnteroAndres = Int

var numeroC: EnteroAndres = 5

multiplicacion = multiplicacion + Double(numeroC)

var numeroH = 1, numeroG = 4, numeroL = 5
print(numeroH)



// MARK: - OPERADORES
var numeroD = 0
numeroD = 2 * 5 + 7

numeroD += 1

print(numeroD)

numeroD -= 10

var sino = true

if sino {
    print("Correcto")
} else {
    print("Incorrecto")
}


if nombre.isEmpty || apellido.isEmpty {
    print("Coloca datos")
} else {
    print("Ya existen datos")
}

if numeroD >= 7 {
    print("Correcto")
} else {
    print("Incorrecto")
}

var resultado = numeroD != 0 ? numeroA / Int(numeroB) : 0
print(resultado)


// MARK: - STRING - CHARACTERS

var emptyString = ""
var anotherEmptyString = String()
var despedida = "Hola"

emptyString.isEmpty
despedida.isEmpty

var variableStringMutable = "Andres"
variableStringMutable += "Felipe"
variableStringMutable += "Ocampo"
variableStringMutable += "Eljaiek"


for index in despedida {
    print(index)
}

let exclamacion: Character = "!"
despedida += String(exclamacion)

var categoriaCharacters: [Character] = ["C", "b", "r", "T"]

categoriaCharacters.append("G")

var catString = String(categoriaCharacters)

print(catString)

let animalesInuasuales = "Koala _ ?, Ronoceronte ?, Finguino ?, DrummerdariusAlexusGregours ?"
print("Animales inusuales \(animalesInuasuales.count) caracteres")

var binevenidosASwift = "Hola"
binevenidosASwift.insert("!", at: binevenidosASwift.endIndex)
binevenidosASwift.insert(contentsOf: "a vosotros", at: binevenidosASwift.endIndex)

print(binevenidosASwift)



// MARK: - Arrays (matrices -> Colecciones)

var iPhones = ["iPhone 4", "iPhone 5", "iPhone XR", "iPhone X"]
var iPads = ["iPad Air", "iPad Pro", "iPad Mini retina"]

var dispositivos = iPhones + iPads

dispositivos
    .append("Mac Book Pro")

dispositivos
    .insert("iWatch 24mm", at: 0)

dispositivos
    .remove(at: 5)

print(dispositivos)

dispositivos
    .sort(by: >)


let iPhone5 = dispositivos[2]


let lastPosition = dispositivos.last
let fistPosition = dispositivos.first

let aux = dispositivos.filter { $0.contains("iP") }
let aux1 = dispositivos.isEmpty
print(aux)

// MARK: - Diccionarios (matrices -> Colecciones)

var diccionariosVacios: [String: Any] = [:]
var otroDiccionario = Dictionary<String, Any>()

var coche: [String: String] = ["marca": "Mazda",
                               "modelo": "Megane",
                               "potencia": "145 caballos"]

let marca = coche["marca"]

if coche["modelo"] != nil {
    print(coche["modelo"]!)
}

if let modelo = coche["modelo"]{
    print(modelo)
    print(marca ?? "")
} else {
    
}

for (clave, valor) in coche {
    print("Clave: \(clave) y valor: \(valor)")
}

for clave in coche.keys {
    print(clave)
}

for value in coche.values {
    print(value)
}


// MARK: - Opcionales (Optional binding)

var numeroEntero = 34
var numeroString = "3"

var sumaNumeroEntStr = numeroEntero + Int(numeroString)!

var nuevasuma: String = String(sumaNumeroEntStr)

var nuevaSumaString: String = numeroString + String(numeroEntero)

var nimbreAA: String? = "Andres"
nimbreAA = "Felipe"

var nombreBB: String? = nil
var nombreModA: String!

if let nombreModAWgr = nombreModA {
    print("Mi nombre es \(nombreModAWgr)")
}


var xOptional: Int?
xOptional = 2
var nuevoValorOptional: String?
nuevoValorOptional = String(xOptional ?? 0)

var ySumatoria: Int = 20
var resultadoSumatoriaXY = nuevoValorOptional! + String(ySumatoria)

if let resultadoSumatoria = nuevoValorOptional {
    print(resultadoSumatoria)
}


// MARK: - Funciones

func miSerieFavorita() {
    print("perdidos")
}

miSerieFavorita()

func funcionRetornaString() -> String {
    "Hola mundo"
}

let varRetornoString = funcionRetornaString()
print(varRetornoString)

func miFuncionConAtributos(mensaje: String){
    print(mensaje)
}

miFuncionConAtributos(mensaje: "Hloaaa")

func numerosSecuncia(a: Int,
                     b: Int,
                     c: Int) -> Int {
    return (a * b) + c
}


let numerosSecuencia = numerosSecuncia(a: 2, b: 4, c: 1)
print(numerosSecuencia)

func hola(nombrePersona: String) -> String {
    let saludo = "hola" + " " + nombrePersona + "!"
    return saludo
}

var saludar = hola(nombrePersona: "Andres")
print(saludar)


func holaDeNuevo(nombrePersona: String) -> String {
    let saludo = "hola" + " " + nombrePersona + "!"
    return saludo
}

func holaAmigos (nombrePersona: String, listoSaludar: Bool) -> String {
    if listoSaludar {
        return hola(nombrePersona: "Andres")
    } else {
        return holaDeNuevo(nombrePersona: "Felipe")
    }
}

print(holaAmigos(nombrePersona: "Andres", listoSaludar: true))


func miutacionParametros(a: Int, b: Int, multiply c:Int) -> Int {
    return (a * b) + c
}

miutacionParametros(a: 2, b: 3, multiply: 4)

var numeroPi = 3

func funcionInOut(numero: inout Int) {
    numero = 3
}

funcionInOut(numero: &numeroPi)
print(numeroPi)
