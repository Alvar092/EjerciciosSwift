//
//  SnowTrailsTesting.swift
//  SnowTrailsTesting
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Testing

// Aquí podéis cambiarle el nombre y añadir más tests de otra clase, struct o archivo
struct SnowTrailsTesting {
    
    class programmTesting{
        
        
        
        
        @Test func distanceWithAltitud() async throws {
            let dataSource = TopographicDataSource.shared
            
            let pointConnections: [String: [String]] = [
                "Alpina Grande": ["Pico Nevado", "Valle Blanco", "Cumbre Azul", "Alpina Pequeña"],
                "Alpina Pequeña": ["Alpina Grande"],
                "Pico Nevado": ["Alpina Grande", "Lago Helado", "Cerro Plateado"],
                "Valle Blanco": ["Alpina Grande", "Refugio Alpino"],
                "Cumbre Azul": ["Alpina Grande", "Cerro Plateado"],
                "Lago Helado": ["Pico Nevado", "Bosque Nevado"],
                "Bosque Nevado": ["Lago Helado", "Cascada Blanca", "Cerro Plateado"],
                "Cerro Plateado": ["Pico Nevado", "Cumbre Azul", "Bosque Nevado", "Cascada Blanca"],
                "Cascada Blanca": ["Cerro Plateado", "Bosque Nevado"],
                "Refugio Alpino": ["Valle Blanco"],
                "Refugio Aislado": [] // No tiene conexiones
            ]
            
            let program = Program()
            
            guard let point3 = dataSource.topographicPoints.first(where: {$0.name == "Alpina Grande"}),
                  let point4 = dataSource.topographicPoints.first(where: {$0.name == "Alpina Pequeña"}) else {
                #expect(false, "No hay puntos")
                return
            }
            
            let point1 = TopographicPoint(name: "Alpina Grande", latitude: 46.0000, longitude: 7.5000, elevation: 1500.0, connections: pointConnections["Alpina Grande"] ?? [] )
            
            let point2 = TopographicPoint(name: "Alpina Pequeña", latitude: 46.0022, longitude: 7.5200, elevation: 1200.0, connections: pointConnections["Alpina Pequeña"] ?? [] )
            
            let distance = program.distanceWithAltitude(lat1: point1.latitude, lon1: point1.longitude, alt1: point1.elevation, lat2: point2.latitude, lon2: point2.longitude, alt2: point2.elevation)
            
            let distance2 = program.distanceWithAltitude(lat1: point3.latitude, lon1: point3.longitude, alt1: point3.elevation, lat2: point4.latitude, lon2: point4.longitude, alt2: point4.elevation)
            
            #expect(distance == 1.59)
            #expect(distance2 == 1.59)
        }
        
        @Test func distanceWithAltitud_when_only_one_point() async throws {
            let datasource = TopographicDataSource.shared
            let program = Program()
            guard let point = datasource.topographicPoints.first(where: {$0.connections.isEmpty}) else{
                #expect(false, "No hay puntos")
                return
            }
            let distance = program.distanceWithAltitude(lat1: point.latitude, lon1: point.longitude, alt1: point.elevation, lat2: nil, lon2: nil, alt2: nil)
            
            #expect(distance == 0 )
        }
        
        
        @Test func showPaths() async throws {
            
            let dataSource = TopographicDataSource.shared
            
            let program = Program()
            let paths = program.showPaths()
            
            #expect(paths.count == dataSource.routes.count)
        }
        
        @Test func validateCredentials_forNormalUser() async throws {
            let program = Program()
            let email = normalUserDefault.email
            let password = normalUserDefault.password
            let userType = normalUserDefault.type
            
            let isNormal = program.validateCredentials(email: email, password: password, for: .normal)
            #expect(isNormal == true)
        }
        
        @Test func validateCredentials_forAdminUser() async throws {
            let program = Program()
            let email = administratorUserDefault.email
            let password = administratorUserDefault.password
            
            let isAdmin = program.validateCredentials(email: email, password: password, for: .admin)
            #expect(isAdmin == true)
        }
        
        @Test func showUsers() async throws {
            let program = Program()
            let users = program.showUsers()
            #expect(users == ["User: : Regularuserkeepcoding1--- Email: regularuser@keepcoding.es", "Admin: : Adminuserkeepcoding1--- Email: adminuser@keepcoding.es"])
            #expect((users.count == usersRegistration.count))
        }
        
        @Test func addUser() async throws {
            let program = Program()
            let actualNumber = usersRegistration.count
            program.createUser(newUser: User(type:.normal, name: "UsuarioNuevo", email: "usuarionuevo@keepcoding.es",password: "123456"))
            #expect(usersRegistration.count == actualNumber + 1)
        }
        
        @Test func deleteUser() async throws {
            let program = Program()
            program.createUser(newUser: User(type:.normal, name: "UsuarioNuevo", email: "usuarionuevo@keepcoding.es",password: "123456"))
            print(usersRegistration)
            program.deleteUser(userName: "UsuarioNuevo")
            print(usersRegistration)
            #expect(usersRegistration.count == 2)
        }
    }
}
