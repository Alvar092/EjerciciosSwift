//
//  playlists.swift
//  Sprint1
//
//  Created by Álvaro Entrena Casas on 2/2/25.
//

import Foundation

struct Playlist{
    var songs: [Song]
    
    
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
//        for item in songs {
//                  songs.removeAll(where: {$0 == item})
//              }
    }
    
    //Eliminar canciones de muchas en muchas
    
    mutating func totalSongs(_ songs: [Song]) -> Int {
        return songs.count
    }
    
    
    mutating func emptyPlaylist() {
        self.songs.removeAll()
    }
    
    //Mezclar lista de manera aleatoria
    mutating func shufflePlaylist(_songs: [Song]) {
        return songs.shuffle()
    }
    
    mutating func playlistInversed(playlist: Playlist) {
        return songs.reverse()
    }
    
   
    mutating func orderByRelease(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        
        self.songs.sort{
            guard let date1 = formatter.date(from: $0.basicInfo.releaseDate),
                    let date2 = formatter.date(from: $1.basicInfo.releaseDate)
            else {
                return false
            }
            return date1 < date2
        }
    }
    
    mutating func orderByTonality(songs: [Song]) -> [Song] {
        let tonalitiesOrder: [String] = [
            "C", "C#", "Db", "D", "D#", "Eb", "E", "F", "F#", "Gb",
            "G", "G#", "Ab", "A", "A#", "Bb", "B"
        ]
       return songs.sorted{
            guard
                let index1 = tonalitiesOrder.firstIndex(of: $0.technicalInfo.key),
                let index2 = tonalitiesOrder.firstIndex(of: $1.technicalInfo.key)
            else {
                return false
            }
            return index1 < index2
        }
    }
    
    mutating func orderByPopularity(songs: [Song]) -> [Song] {
        let songsByPopularity = songs.sorted{$0.metadata.popularity < $1.metadata.popularity}
        return songsByPopularity
    }
    
    
    mutating func orderByBPM(songs: [Song]) -> [Song] {
        let songsByBPM = songs.sorted{$0.technicalInfo.bpm < $1.technicalInfo.bpm}
        return songsByBPM
    }
}
  

