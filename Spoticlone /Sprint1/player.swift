//
//  player.swift
//  Sprint1
//
//  Created by Álvaro Entrena Casas on 3/2/25.
//

import Foundation


enum PlayingMode {
    case StartToFinish
    case Shuffle
    case EndToStart
}


enum PlayingCriteria{
    case Antiquity
    case Tonality
    case Popularity
    case BPM
}

struct Player{
    
    private var currentPlaylist: Playlist
    private var currentSong : Song
    private var timer: Timer
    
   
    mutating func play(currentPlaylist: Playlist, mode: PlayingMode) {
        
        switch mode {
        case .StartToFinish:
            showNowPlaying(playlist: currentPlaylist)
        case .Shuffle:
            self.currentPlaylist.shufflePlaylist(_songs: currentPlaylist.songs)
            showNowPlaying(playlist: currentPlaylist)
        case .EndToStart:
            self.currentPlaylist.playlistInversed(playlist: currentPlaylist)
            showNowPlaying(playlist: currentPlaylist)
        }
    }
    
    //Reproducir una canción mostrandolo en consola
    mutating func showNowPlaying(playlist: Playlist, seconds: Int = 5) {
        
        guard !currentPlaylist.songs.isEmpty else {
            print("There are no more songs available.")
            return
        }
        
        var currentSong = currentPlaylist.songs[0]
        
        //Temporizador
        timer.invalidate()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            print("Playing \(currentSong.basicInfo.title) - \(currentSong.basicInfo.artist)")
        }
        
        
        
        func changePlayingOrder(playlist: Playlist, criteria: PlayingCriteria) {
            switch criteria {
            case . Antiquity:
                self.currentPlaylist.orderByRelease()
                
            case . Tonality:
                currentPlaylist.songs = self.currentPlaylist.orderByTonality(songs: self.currentPlaylist.songs)
                
            case .Popularity:
                currentPlaylist.songs = self.currentPlaylist.orderByPopularity(songs: self.currentPlaylist.songs)
                
            case .BPM:
                currentPlaylist.songs = self.currentPlaylist.orderByBPM(songs: self.currentPlaylist.songs)
            }
        }
    }
}
