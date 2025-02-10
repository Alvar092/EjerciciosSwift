//
//  Programm.swift
//  SnowTrails
//
//  Created by Álvaro Entrena Casas on 7/2/25.
//

import Foundation
 

struct Program {
    
    // Modo de acceso al data source mediante Singleton
    private let dataSource = TopographicDataSource.shared
    
    
    // Validar credenciales
    func validateCredentials(email: String, password: String, for usertype: UserType) -> Bool {
        if let registeredUser = usersRegistration.first(where: {$0.type == usertype && $0.email == email && $0.password == password }){
            print("Acceso autorizado para \(registeredUser.name)")
            return true
        } else {
            print("Credenciales incorrectar o usuario no autorizado")
            return false
        }
    }
    
    // Solicitar email y contraseña y validar con validateCredentials()
    func logInSolicitude(for userType: UserType) -> Bool{
        print("Introduzca su email: ")
        guard let email = readLine(), !email.isEmpty else {
            print("El email no puede estar vacio")
            return false
        }
        print("Introduzca contraseña: ")
        guard let password = readLine(), !password.isEmpty else {
            print("La contraseña esta vacia")
            return false
        }
        return validateCredentials(email: email, password: password, for: userType)
        
    }
        
    
    //Formula Haversine
    func haversineDistance(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
        let pi = Double.pi
        let radiusEarth = 6371000.00
        let lat1Rad = lat1 * pi / 180
        let lat2Rad = lat2 * pi / 180
        let deltaLat = (lat2 - lat1) * .pi / 180
        let deltaLon = (lon2 - lon1) * .pi / 180

        let a = sin(deltaLat / 2) * sin(deltaLat / 2) +
               cos(lat1Rad) * cos(lat2Rad) *
               sin(deltaLon / 2) * sin(deltaLon / 2)
        let c = 2 * atan2(sqrt(a), sqrt(1 - a))

        return radiusEarth * c
    }
    
    //Haversine + Pitagora
    func distanceWithAltitude(lat1: Double, lon1: Double, alt1: Double, lat2: Double? = nil, lon2: Double? = nil, alt2: Double? = nil) -> Double {
        let lat2Final = lat2 ?? lat1
        let lon2Final = lon2 ?? lon1
        let alt2Final = alt2 ?? alt1
        
        
        let surfaceDistance = haversineDistance(lat1: lat1, lon1: lon1, lat2: lat2Final, lon2: lon2Final)
        let altitudeDiference = alt2Final - alt1
        let result = sqrt(pow(surfaceDistance, 2) + pow(altitudeDiference, 2)) / 1000
        return (result * 100).rounded() / 100
    }
    
    
    //User-Funcion de mostrar rutas (las muestra en consola y te lleva al menu de usuario normal)
    func showPaths() -> [String] {
        let dataSource = TopographicDataSource.shared
        
        var totalPaths: [String] = []
        
        for route in dataSource.routes {
            var totalDistance = 0.0
            
            let routePoints = route.points.compactMap{ pointName in dataSource.topographicPoints.first{$0.name == pointName}}
            
            
            for i in 0..<(routePoints.count - 1 ) {
                let point1 = routePoints[i]
                let point2 = routePoints[i + 1]
                
                totalDistance += distanceWithAltitude(lat1: point1.latitude, lon1: point1.longitude, alt1: point1.elevation, lat2: point2.latitude, lon2: point2.longitude, alt2: point2.elevation)
            }
            
            let distanceString = String(format: "%.2f", totalDistance)
            totalPaths.append("\(route.name) - \(distanceString) km")
        }
        return totalPaths
    }
    
    
    //User-Funcion de obtener ruta mas corta (en construcción mientras no saque lo básico)
    
    //Admin-mostrar usuarios
    func showUsers() -> [String] {
        var result:[String] = []
        for user in usersRegistration {
            result.append("\(user.type.rawValue): \(user.name)--- Email: \(user.email)")
        }
        return result 
    }
    
    // Crear usuario en el registro
    func createUser(newUser: User) {
        usersRegistration.append(newUser)
        print("Usuario \(newUser.name) con email \(newUser.email) añadido satisfactoriamente")
    }
    
    
    //Admin-añadir usuario
    func addUser() {
        
       
        print("Introduce el nombre de usuario que quieres añadir")
        guard let nombre = readLine(), !nombre.isEmpty else {
            print("El nombre no puede estar vacio")
            return
        }
        
        print("Introduce el email del usuario que quieres añadir")
        guard let email = readLine(), !email.isEmpty else {
            print("El email no puede estar vacio")
            return
        }
        
        print("Introduce la contraseña del usuario que quieres añadir")
        guard let password = readLine(), !password.isEmpty else{
            print("La contraseña no puede estar vacia")
            return
        }
        
        let newUser = User(type: .normal, name: nombre, email: email, password: password)
        return createUser(newUser: newUser)
    }
    
    // Admin- solicitar usuario para eliminar
    func nameForDeleting() {
        print("¿Que usuario quieres eliminar?")
        guard let name = readLine(), !name.isEmpty else {
            print("Debes introducir un nombre de usuario")
            return
        }
        return deleteUser(userName: name)
    }
    
    //Admin- eliminar usuario
    func deleteUser(userName: String) {
        var initialCount = usersRegistration.count
        usersRegistration.removeAll(where: {$0.name == userName})
        if initialCount == usersRegistration.count {
            print("No se encontro un usuario con el nombre \(userName)")
        } else {
            print("Usuario \(userName) eliminado correctamente")
        }
    }
    
    //Admin- añadir punto a una ruta(en construcción mientras no saque lo básico)
    
    //Admin- loggout
    
}

