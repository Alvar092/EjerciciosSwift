//
//  App.swift
//  SnowTrails
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Foundation

class App {
    
    let menuController: MenuController
    
    init() {
        self.menuController = MenuController()
    }
    
    func run() {
        menuController.showWelcomeMenu()
    }
}
