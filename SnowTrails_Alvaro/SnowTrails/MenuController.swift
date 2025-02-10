//
//  MenuController.swift
//  SnowTrails
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Foundation

class MenuController {
    let program = Program()
    
    func showWelcomeMenu() {
        var exit = false
        
        while !exit {
            print("===Bienvenido a Snowtrails=== \n 1. Acceder como usuario \n 2. Acceder como administrador \n 3. Salir ")
            
            if let choice = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !choice.isEmpty {
                switch choice {
                case "1":
                    if program.logInSolicitude(for: .normal) {
                        print("Sesión iniciada")
                        showUserMenu()
                    }
                case "2":
                    if program.logInSolicitude(for: .admin){
                        print("Sesión iniciada")
                        showAdminMenu()
                    }
                case "3":
                    exit = true
                default:
                    print("Opcion no valida, intente de nuevo")
                }
            }
        }
    }
    
    func showUserMenu() {
        var exitUserMenu = false
        
        while !exitUserMenu {
            print("Menú de usuario - Selecciona una opción: \n 1. Ver todas las rutas \n 2. Obtener la ruta mas corta entre dos punto \n 3. Log out")
            
            if let choice = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !choice.isEmpty {
                switch choice {
                case "1":
                    let program = Program()
                    let routes = program.showPaths()
                    for route in routes {print(route)}
                case "2":
                    print("Proximamente!")
                case "3":
                    exitUserMenu = true
                    print("Cerrando sesion...")
                default:
                    print("Opcion no valida, intente de nuevo")
                    
                }
            }
        }
    }
    
    func showAdminMenu() {
        var exitAdminMenu = false
        while !exitAdminMenu{
            print("Menu de administrador - Selecciona una opción: \n 1. Ver todos los usuarios \n 2. Añadir usuario \n 3. Eliminar usuario \n 4. Añadir punto a una ruta \n 5. Log out")
            
            if let choice = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !choice.isEmpty {
                switch choice {
                case "1":
                    let users = program.showUsers()
                    for user in users {
                        print(user)
                    }
                case "2":
                    program.addUser()
                case "3":
                    program.nameForDeleting()
                case "4":
                    print("Proximamente!...")
                case "5":
                    exitAdminMenu = true
                    print("Cerrando sesión...")
                default:
                    print("Opción no válida, intentlo de nuevo")
                }
            }
        }
    }
    
}




//    func showLoginMenu() {
//        print("Login menu. The number of menus in this app is \(getNumberOfMenus())")
//    }
//
//    func getNumberOfMenus() -> Int {
//        return 3
//    }
