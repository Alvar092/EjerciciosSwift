//
//  player.swift
//  Sprint1
//
//  Created by Álvaro Entrena Casas on 3/2/25.
//

import Foundation
import OSLog

enum PlayingMode {
    case startToFinish
    case shuffle
    case endToStart
    case antiquity
    case tonality
    case popularity(order: PopularityOrder)
    case bPM
}

enum PopularityOrder {
    case ascending
    case descending
}


struct Player{
    
    var currentPlaylist: Playlist
    
    
    //CREAR INIT
    init(currentPlaylist: Playlist, logger: Logger) {
        self.currentPlaylist = currentPlaylist
    
    }
    
    func playSong(song: Song){
        print("Playing \(song.basicInfo.title) - \(song.basicInfo.artist)")
        
    }
    
    mutating func play(mode: PlayingMode = .startToFinish, withInterval: Int = 5, finalMessage: String = "No more songs available.") {
        
        let songs: [Song] = {
            
            switch mode {
            case .startToFinish:
                return currentPlaylist.songs
            case .shuffle:
                var newPlaylist = currentPlaylist.shufflePlaylist(_songs: currentPlaylist.songs)
                return newPlaylist
            case .endToStart:
                var newPlaylist = currentPlaylist.playlistInversed(songs: currentPlaylist.songs)
                return newPlaylist
            case .antiquity:
                var newPlaylist = currentPlaylist.orderByRelease()
                return newPlaylist
            case .tonality:
                var newPlaylist = currentPlaylist.orderByTonality(songs: currentPlaylist.songs)
                return newPlaylist
            case .popularity(order: let order):
                var newPlaylist = currentPlaylist.orderByPopularity(songs: currentPlaylist.songs, order: order)
                return newPlaylist
            case .bPM:
                var newPlaylist = currentPlaylist.orderByBPM(songs: currentPlaylist.songs)
                return newPlaylist
            }
        }()
        playSong(song: songs[0])
        sleep(UInt32(withInterval))
        
        
//        songs.forEach { song in
//            playSong(song: song)
//            logger.debug("\(song.basicInfo.title)")
//            sleep(UInt32(withInterval))
//        }
        //logger.info("\(finalMessage)")
    }
}
