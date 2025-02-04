//
//  playlists.swift
//  Sprint1
//
//  Created by Álvaro Entrena Casas on 2/2/25.
//

import Foundation

struct Playlist{
    let name : String?
    var songs: [Song]
    
    static var usedNames: Set<String> = []
    
    init?(name: String?, songs: [Song]) {
        //Si no hay nombre, se asigna uno
        let finalName = name ?? "Unknown name"
        
        //Verifico si esta en el set de nombres
        guard Playlist.usedNames.contains(finalName) else {
            print("Error: There's already a playlist with that name.")
            return nil
        }
        
        self.name = name
        self.songs = songs
        
        Playlist.usedNames.insert(finalName)
    }
    
    
    
    
    
    
    mutating func addSong(song: Song) {
        songs.append(song)
    }
    
    mutating func addPlaylist(newSongs: [Song]) {
       return songs = newSongs
    }
    
    mutating func removeSong(song:Song) {
        if let indexSong = songs.firstIndex(of: song) {
            songs.remove(at: indexSong)
        }
    }
    
    mutating func totalSongs(_ songs: [Song]) -> Int {
        return songs.count
    }
    
    
    mutating func emptyPlaylist() {
        self.songs.removeAll()
    }
    
    //Mezclar lista de manera aleatoria
    func shufflePlaylist(_songs: [Song]) -> [Song] {
        var result = songs
        result.shuffle()
        return result
    }
    
    func playlistInversed(songs: [Song]) -> [Song] {
        var result = songs
        result.reverse()
        return result
    }
    
   
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
    
    
    func orderByBPM(songs: [Song]) -> [Song] {
        let songsByBPM = songs.sorted{$0.technicalInfo.bpm < $1.technicalInfo.bpm}
        return songsByBPM
    }
}
  

