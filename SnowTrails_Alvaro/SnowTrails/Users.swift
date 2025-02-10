//
//  Users.swift
//  SnowTrails
//
//  Created by Álvaro Entrena Casas on 7/2/25.
//

import Foundation
import OSLog

enum UserType: String {
    case normal = "User"
    case admin = "Admin"
}


struct User {
    let type: UserType
    let name: String
    let email: String
    let password: String
    
    init(type: UserType, name: String, email: String, password: String) {
        self.type = type
        self.name = name
        self.email = email
        self.password = password
    }
    
    func obtainRol() -> String {
        var rol = ""
        switch type {
        case .normal:
            rol = "Usuario \(type.rawValue) con nombre \(name)"
        case .admin:
            rol = "Usuario\(type.rawValue) con nombre \(name)"
        @unknown default:
            rol = "No se encontro el rol de usuario."
        }
        return rol
    }
}


let normalUserDefault = User(type: .normal, name: "Regularuserkeepcoding1", email: "regularuser@keepcoding.es", password: "Regularuser1")
                                            
let administratorUserDefault = User(type: .admin, name: "Adminuserkeepcoding1", email: "adminuser@keepcoding.es", password: "Adminuser1")
                                            
var usersRegistration: [User] = [normalUserDefault, administratorUserDefault]



