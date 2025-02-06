//
//  main.swift
//  Sprint1
//
//  Created by Ismael Sabri Pérez on 16/1/25.
//

import Foundation
import OSLog

Main().main() // Ejecutamos el programa


class Main{
    
    
    let logger = Logger(subsystem: "Sprint1", category: "main")
    
    // MARK: - Main
    func main() {
        
        let songs = SongsLoader().songs
        
        
        let dj1 = dj(songs: songs)
        
        let playlistStyle = dj1.createByStyle(style1: rockAnthems, style2: emotionalTrip)
        
        var player1 = Player(currentPlaylist: playlistStyle, logger: logger)
        player1.play(mode: .startToFinish)
        
        
    }
    
    
    
    
    
    
    
    //    songs.forEach { song in
    //        print(song.basicInfo.title)
    //    }
    //    let averagePopularity = getAveragePopularity(inSongs: songs)
    //    print(averagePopularity)
    //
    //    let songsOfEdSheeran = getSongsFromArtist("Ed Sheeran", inSongs: songs)
    //    print(songsOfEdSheeran)
    //
    //    let songsByRock = getSongsByGenre("Pop", inSongs: songs)
    //    print(songsByRock)
    //
    //    let totalDurationCatalog = getTotalDuration(songs: songs)
    //    print(totalDurationCatalog)
    
    //let topAlbum = getAlbumWithMoreSongs(songs: songs)
    //print(topAlbum)
    
    //RunLoop.main.run()
    
    
    
    //Búsquedas y filtrados básicos
    
    func getSongsFromArtist(_ artist: String, inSongs songs: [Song])-> [String] {
        var songsByArtist: [String] = []
        for song in songs {
            if song.basicInfo.artist == artist {
                songsByArtist.append(song.basicInfo.title)
            }
        }
        return songsByArtist
    }
    
    func getSongsByGenre(_ genre: String, inSongs songs: [Song]) -> [String] {
        var songsByGenre: [String] = []
        for song in songs {
            if song.basicInfo.genre == genre {
                songsByGenre.append(song.basicInfo.title)
            }
        }
        return songsByGenre
    }
    
    
    
    func getAveragePopularity(inSongs songs: [Song]) -> Int {
        var totalPopularity = 0
        let numberOfSongs = songs.count
        for song in songs {
            totalPopularity += song.metadata.popularity
        }
        
        return totalPopularity / numberOfSongs
    }
    
    
    //Calculos y estadísticas
    
    func getTotalDuration( songs: [Song]) -> Int {
        var totalDuration = 0
        for song in songs{
            totalDuration += song.basicInfo.durationMs
        }
        
        return totalDuration / 60000
    }
    
    func getAlbumWithMoreSongs( songs: [Song]) -> String {
        var albumCount: [String: Int] = [:]
        
        for song in songs{
            let album = song.basicInfo.album
            albumCount[album, default: 0] += 1
        }
        
        let albumWithMoreSongs = albumCount.max(by:{$0.value < $1.value})
        let result = albumWithMoreSongs?.key ?? "No hay album"
        return result
    }
    
    //Validaciones complejas
    
    func getSongsByBPM(bpm: Int, songs: [Song]) -> [String] {
        var songsByBPM: [String] = []
        for song in songs{
            if song.technicalInfo.bpm == bpm{
                songsByBPM.append(song.basicInfo.title)
            }
        }
        return songsByBPM
    }
    
    func songsForAllTonalities(_key: String, songs:[Song]) -> Bool {
        let tonalities: Set<String> = [
            "C", "C#", "Db", "D", "D#", "Eb", "E", "F", "F#", "Gb",
            "G", "G#", "Ab", "A", "A#", "Bb", "B"
        ]
        
        let availableKeys = Set(songs.map{$0.technicalInfo.key})
        
        return tonalities.isSubset(of: availableKeys)
        
        //        var ThereAre = false
        //        for song in songs{
        //            if song.technicalInfo.key == _key {
        //                ThereAre = true
        //            }
        //        }
        //        return ThereAre
        //    }
    }
}
