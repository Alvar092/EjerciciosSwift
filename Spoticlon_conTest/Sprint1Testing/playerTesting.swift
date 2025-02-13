//
//  playerTesting.swift
//  Sprint1Testing
//
//  Created by Álvaro Entrena Casas on 6/2/25.
//

import Foundation
import Testing
import OSLog


@Suite("Player")
class PlayerTesting {
    
    var logger : Logger
    var testData: Data?
    var songs : [Song]
    
    
    init(){
        logger = Logger(subsystem: "Sprint1", category: "main")
        testData = TestData.getSongs() ?? "".data(using: .utf8)!
        songs = SongsLoader(fromData: testData).songs
    }
    deinit{
        testData = nil
        songs = []
        Playlist.usedNames = []
    }
    
   @Test func testInitPlayer_whenPlaylistEmptyAndNameUnique() async throws {
        let playlist = Playlist(name: "Prueba", songs: [])
        let player = Player(currentPlaylist: playlist, logger: logger)
       #expect(player.currentPlaylist.name == playlist.name)
       #expect(player.currentPlaylist.songs == [])
    }
    
    @Test func play_caseFromEndToStart() async throws{
        let playlist = Playlist(name: "Prueba", songs: songs)
        var player = Player(currentPlaylist: playlist,songsPlayed: [], logger: logger)
        player.play(mode: .endToStart, withInterval: 1)
        #expect(player.songsPlayed == ["Save Your Tears","Industry Baby","Good 4 U","Peaches","Levitating","Blinding Lights"])
    }
    @Test func play_caseOrderByBPM() async throws{
        let playlist = Playlist(name: "Prueba", songs: songs)
        var player = Player(currentPlaylist: playlist,songsPlayed: [], logger: logger)
        player.play(mode: .bPM, withInterval: 1)
        #expect(player.songsPlayed == ["Peaches","Industry Baby","Levitating","Save Your Tears","Good 4 U","Blinding Lights"])
    }
    
    @Test func play_shuffling() async throws {
        let playlist = Playlist(name: "Prueba", songs: songs)
        var player = Player(currentPlaylist: playlist,songsPlayed: [], logger: logger)
        player.play(mode: .shuffle, withInterval: 1)
        #expect(player.songsPlayed.count == songs.count)
    }
}
