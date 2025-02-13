//
//  playlists.swift
//  Sprint1
//
//  Created by Álvaro Entrena Casas on 5/2/25.
//

import Foundation

struct Playlist:Equatable{
    var name : String?
    var songs: [Song]
    
    //Para que no haya repetición de nombres uso un Set, que no permite duplicidades
    static var usedNames: Set<String> = []
    
    init(name: String, songs: [Song]) {
            // Si el nombre ya existe, lo ajustamos para que sea único
            var uniqueName = name
            var counter = 1
            
            // Generamos un nombre único si ya existe
            while Playlist.usedNames.contains(uniqueName) {
                uniqueName = "\(name)_\(counter)"
                counter += 1
            }
            
            // Asignamos el nombre único
            self.name = uniqueName
            self.songs = songs
            
            // Agregamos el nombre al set de nombres utilizados
            Playlist.usedNames.insert(uniqueName)
    }
    
    
    
    
    //Funcionalidades
    
    
    //Añadir cancion
    mutating func addSong(song: Song) {
        songs.append(song)
    }
    
    //Añadir grupo de canciones
    mutating func addPlaylist(newSongs: [Song]) {
       return songs = newSongs
    }
    
    //Quitar cancion
    //Esta funcion no elimina repeticiones
    mutating func removeSong(song:Song) {
        if let indexSong = songs.firstIndex(of: song) {
            songs.remove(at: indexSong)
        }
    }
    
    //Obtener total de canciones
    mutating func totalSongs(_ songs: [Song]) -> Int {
        return songs.count
    }
    
    
    //Vaciar playlist
    mutating func emptyPlaylist() {
        self.songs.removeAll()
    }
    
    //Mezclar lista de manera aleatoria
    func shufflePlaylist(_songs: [Song]) -> [Song] {
        var result = songs
        result.shuffle()
        return result
    }
    
    //Invertir la lista
    func playlistInversed(songs: [Song]) -> [Song] {
        var result = songs
        result.reverse()
        return result
    }
    
   //Ordenar por lanzamientos
    func orderByRelease() -> [Song]{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        
        
        var result = songs
        result.sort{
            guard let date1 = formatter.date(from: $0.basicInfo.releaseDate),
                    let date2 = formatter.date(from: $1.basicInfo.releaseDate)
            else {
                return false
            }
            return date1 < date2
        }
        return result
    }
    
    
    //Ordenar por tonalidades
    func orderByTonality(songs: [Song]) -> [Song] {
        let tonalitiesOrder: [String] = [
            "C", "C#", "Db", "D", "D#", "Eb", "E", "F", "F#", "Gb",
            "G", "G#", "Ab", "A", "A#", "Bb", "B"
        ]
        var result = songs
        result.sort{
            guard
                let index1 = tonalitiesOrder.firstIndex(of: $0.technicalInfo.key),
                let index2 = tonalitiesOrder.firstIndex(of: $1.technicalInfo.key)
            else {
                return false
            }
            return index1 < index2
        }
        return result
    }
    
    
    //Ordenar por popularidad
    func orderByPopularity(songs: [Song], order: PopularityOrder) -> [Song] {
        
        switch order {
        case .ascending:
            let songsByPopularity = songs.sorted{$0.metadata.popularity < $1.metadata.popularity}
            return songsByPopularity
        case .descending:
            let songsByPopularity = songs.sorted{$0.metadata.popularity > $1.metadata.popularity}
            return songsByPopularity
        }
    }
    
    //Ordenar por BPM
    func orderByBPM(songs: [Song]) -> [Song] {
        let songsByBPM = songs.sorted{$0.technicalInfo.bpm < $1.technicalInfo.bpm}
        return songsByBPM
    }
}
  

