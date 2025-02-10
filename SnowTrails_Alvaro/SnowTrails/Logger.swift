//
//  logger.swift
//  SnowTrails
//
//  Created by Álvaro Entrena Casas on 10/2/25.
//

import Foundation
import OSLog

// MARK: Ejemplo de cómo diferenciar entre logs para el usuario y logs para el desarrollador
extension Logger {
    static let consoleUILogger = Logger(subsystem: "SnowTrails", category: "LogsDelUsuario")
    static let consoleDeveloperLogger = Logger(subsystem: "SnowTrails", category: "LogsDelDesarrollador")
}
