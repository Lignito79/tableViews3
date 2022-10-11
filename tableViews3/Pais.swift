//
//  Empleado.swift
//  tableViews3
//
//  Created by Alumno on 07/10/22.
//

import UIKit

class Pais: NSObject {
    var nombre: String
    var habitantes: Int
    var foto: UIImage!
    var capital: String
    
    init(nombre: String, habitantes: Int, foto: UIImage!, capital: String){
        self.nombre = nombre
        self.habitantes = habitantes
        self.foto = foto
        self.capital = capital
    }
    
    
}
