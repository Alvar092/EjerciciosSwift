//
//  Programm.swift
//  SnowTrails
//
//  Created by Álvaro Entrena Casas on 7/2/25.
//

import Foundation
import OSLog
 

struct Program {
    private let logger: Logging

    init(logger: Logging) {
        self.logger = logger
    }
    
    
    // Modo de acceso al data source mediante Singleton
    private let dataSource = TopographicDataSource.shared
    
    
    // Validar credenciales
    func validateCredentials(email: String, password: String, for usertype: UserType) -> Bool {
        var isValid = false
        
        let emailRegex = "^[A-Za-z0-9]+@[A-Za-z0-9]+\\.(es|com)$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        guard emailPredicate.evaluate(with: email) else {
            logger.logError("El email no cumple el formato adecuado", for: .developer)
            logger.logError("Email no valido, por favor introduce un email", for: .user)
            return isValid
        }
        
        if let registeredUser = usersRegistration.first(where: {
            $0.type == usertype &&
            $0.email == email &&
            $0.password == password &&
            (8...24).contains($0.name.count)
        }) {
             logger.logInfo("Acceso autorizado para  \(registeredUser.name)", for: .user)
            isValid = true
        } else {
             logger.logInfo("Credenciales incorrectas o usuario no autorizado", for: .user)
        }
        return isValid
    }
    
    // Solicitar email y contraseña y validar con validateCredentials()
    func logInSolicitude(for userType: UserType) -> Bool{
         logger.logInfo("Introduzca su email: ", for: .user)
        guard let email = readLine(), !email.isEmpty else {
            logger.logError("El email no puede estar vacio", for: .user)
            return false
        }
        logger.logInfo("Introduzca contraseña: ", for: .user)
        guard let password = readLine(), !password.isEmpty else {
            logger.logError("La contraseña esta vacia", for: .user)
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
        
        logger.logInfo("Calculando la distancia de las rutas", for: .user)
        
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
        logger.logInfo("Usuario \(newUser.name) con email \(newUser.email) añadido satisfactoriamente", for: .user)
    }
    
    
    //Admin-añadir usuario hay que mejorar el filtro para que cumpla requisitos
    func addUser() {
         logger.logInfo("Introduce el nombre de usuario que quieres añadir", for: .user)
        guard let nombre = readLine(), !nombre.isEmpty else {
            logger.logError("El nombre no puede estar vacio", for: .user)
            return
        }
        
        logger.logInfo("Introduce el email del usuario que quieres añadir", for: .user)
        guard let email = readLine(), !email.isEmpty else {
            print("El email no puede estar vacio")
            return
        }
        
         logger.logInfo("Introduce la contraseña del usuario que quieres añadir", for: .user)
        guard let password = readLine(), !password.isEmpty else{
            logger.logError("La contraseña no puede estar vacia", for: .user)
            return
        }
        
        let newUser = User(type: .normal, name: nombre, email: email, password: password)
        return createUser(newUser: newUser)
    }
    
    // Admin- solicitar usuario para eliminar
    func nameForDeleting() {
        logger.logInfo("¿Que usuario quieres eliminar?", for: .user)
        guard let name = readLine(), !name.isEmpty else {
            logger.logError("Debes introducir un nombre de usuario", for: .user)
            return
        }
        return deleteUser(userName: name)
    }
    
    //Admin- eliminar usuario
    func deleteUser(userName: String) {
        let initialCount = usersRegistration.count
        usersRegistration.removeAll(where: {$0.name == userName})
        if initialCount == usersRegistration.count {
            logger.logError("No se encontro un usuario con el nombre \(userName)", for: .user)
        } else {
            logger.logInfo("Usuario \(userName) eliminado correctamente", for: .user)
        }
    }
    
    //Admin- añadir punto a una ruta(en construcción mientras no saque lo básico)
    
    //Admin- loggout
    
}

