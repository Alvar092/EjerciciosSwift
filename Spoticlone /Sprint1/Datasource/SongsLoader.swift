//
//  SongsLoader.swift
//  Sprint1
//
//  Created by Ismael Sabri Pérez on 16/1/25.
//

import Foundation
import OSLog

class SongsLoader {
    
    // MARK: Properties
    let logger: Logger
    var songs: [Song]
    
    
    // MARK: Init
    init() {
        // Inicializamos las variables (para eso está el init)
        self.songs = []
        self.logger = Logger(subsystem: "Sprint1", category: "SongsLoader")
        
        // Cargamos las canciones del JSON y tratamos el error imprimiéndolo por pantalla
        guard let loadedSongs = loadSongs() else {
            logger.info("Unable to load songs in the initializer of SongsLoader")
            return
        }
        // Si se han podido cargar las canciones, las tenemos en SongsLoader
        self.songs = loadedSongs
    }
    
    // MARK: Functions
    private func loadSongs() -> [Song]? {
        guard let filePath = Bundle.main.path(forResource: "songs", ofType: "json", inDirectory: "Datasource/songs") else {
            print("Error: No se encontró el archivo songs.json en el bundle.")
            return nil
        }
        let url = URL(fileURLWithPath: filePath)
        
        guard FileManager.default.fileExists(atPath: url.path) else {
            print("Error: No se encontró el archivo songs.json en la ruta.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            // Configurar el DateFormatter
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.locale = Locale(identifier: "en_US_POSIX")
            decoder.dateDecodingStrategy = .formatted(formatter)
            
            let songsResponse = try decoder.decode(SongsResponse.self, from: data)
            return songsResponse.songs
        } catch {
            print("Error al cargar o decodificar songs.json: \(error)")
            return nil
        }
    }
}
