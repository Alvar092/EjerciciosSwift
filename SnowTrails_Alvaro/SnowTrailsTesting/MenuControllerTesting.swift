//
//  Test.swift
//  SnowTrailsTesting
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Testing

class MenuControllerTesting {
    
    @Suite("Number of menus")
    class NumberOfMenusTests {
        
        var menuController: MenuController?
        var logger: Logging
        
        init() {
            logger = AppLogger(subsystem: "SnowTrails")
            menuController = MenuController(logger: logger)
        }
        
        deinit {
            menuController = nil
        }
        
//        @Test func whenCalled_return3() async throws {
//            #expect(menuController!.getNumberOfMenus() == 3, "The number of menus is not 3")
//        }
    }
}
