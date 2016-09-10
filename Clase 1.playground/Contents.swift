//: Playground - noun: a place where people can play

import UIKit

/// Definicion de variables de diferentes tipos
/// Definición de una persona "A pie"
let sex:Character = "H"
let name:String   = "Javier Castañeda"
var age           = 28
var height        = 1.75
var weight:Float  = 80
var isSingle      = true

/// Declaración de una clase
/// Clase Student
class Student{
    //Atributos o propiedades de la clase
    let sex:Character
    let name:String
    var age:Int
    var height:Double
    var weight:Float
    var isSingle:Bool
    
    // Constructor de la clase
    init(sex:Character,name:String,age:Int, height:Double,weight:Float, isSingle:Bool) {
        self.sex      = sex
        self.name     = name
        self.age      = age
        self.height   = height
        self.weight   = weight
        self.isSingle = isSingle
    }
    // Métodos de la instancia
    func sayHello() {
        print("Hi my name is :\(self.name)")
    }
    
    func calculateIMC(weight:Float, height:Double) -> Double {
        let doubleWeight =  Double(weight)
        return doubleWeight/(height*height)
    }
    
    func calculateIMCWithoutLet(weight:Float, height:Double) -> Double {
        return Double(weight)/(height*height)
    }
    
    func calculateMyIMC() -> Double {
        return Double(weight)/(height*height)
    }
    // flujo de datos con if
    func getIMCInfo()->String{
        let imc = self.calculateMyIMC()
        var result = ""
        if imc < 18 {
            result = "Bajo de peso"
        }else if imc >= 18 && imc < 25{
            result = "Normal"
        }else if imc >= 25 && imc < 27{
            result = "Sobrepeso"
        }else {
            result = "Obeso"
        }
        return result
    }
    //flujo de datos con switch
    func getIMCInfoWithSwitch()->String{
        let imc = self.calculateMyIMC()
        switch imc {
        case 0..<18:
            return "Bajo de peso"
        case 18..<25:
            return "Normal"
        case 25..<27:
            return "Sobrepeso"
        default:
            return "Obeso"
        }
    }
    
}
/// Inicialización de un objeto
let javierCastaneda =  Student(sex: "H", name: "Javier Castañeda", age: 28, height: 1.75, weight: 80, isSingle: true)
/// Ejecución de métodos
javierCastaneda.sayHello()
javierCastaneda.calculateMyIMC()
javierCastaneda.calculateIMC(80, height: 1.75)
javierCastaneda.calculateIMCWithoutLet(80, height: 1.75)
javierCastaneda.getIMCInfo()
javierCastaneda.getIMCInfoWithSwitch()

// Creando arreglos 
// Declarando diccionarios
let dic = ["saludo_en":"hi",
           "saludo_es":"hola"]
//accediendo a los valores de un diccionario
print(dic["saludo_ar"])
print(dic["saludo_es"])
//Opcionales unwrapping
print(dic["saludo_es"]!)//forzado, o para valientes
if let sayHello = dic["saludo_ar"]{// if let o forma segura
    print(sayHello)
}else{
    print("la llave saludo_ar no existe")
}

//if let anidados y con el operador _ (comodín)
if let hello = dic["saludo_es"],_ = dic["saludo_en"]{
    print(hello + " " )
}

var array:[AnyObject] = [1,"1",["uno":1]] // arreglo de cualquier tipo  de objeto
var arrayStudents:[Student] = [] //arreglo de Student


// Ciclos For

for i in 1...5{
    //Operador ternario
    // condicion ? caso_cumpla_condicion : caso_no_se_cumple_condicion
    // (i%2 == 0) es la condición para saber cuáles son números pares
    let sex:Character = (i%2 == 0) ? "M":"H"
    let single = (i%2 == 0)
    let student = Student(sex: sex, name: "usuario \(i)", age: 10*i, height: 1.1*Double(i), weight: 60*Float(i), isSingle: single)
    arrayStudents.append(student)
}

print(arrayStudents)
