//
//  main.swift
//  SnowTrails
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Foundation
import OSLog

func main() {
    App().run()
    
    Logger().debug("Mensaje cualquiera")
    Logger().info("Mensaje informativo")
    Logger().error("Mensaje de error")
    Logger().fault("Mensaje de fallo")
    
    Logger.consoleUILogger.debug("Mensaje al usuario modo debug")
}

main()

// MARK: Ejemplo de cómo diferenciar entre logs para el usuario y logs para el desarrollador
extension Logger {
    static let consoleUILogger = Logger(subsystem: "SnowTrails", category: "LogsDelUsuario")
    static let consoleDeveloperLogger = Logger(subsystem: "SnowTrails", category: "LogsDelDesarrollador")
}

