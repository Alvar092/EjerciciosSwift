//
//  playlistTesting.swift
//  Sprint1Testing
//
//  Created by Álvaro Entrena Casas on 5/2/25.
//

import Foundation
import Testing

class PlaylistTesting {
    
    @Test func testInitializePlaylist_withUniqueName() async throws {
        let playlist1 = Playlist(name: "PartyMix", songs: [])
        let playlist2 = Playlist(name: "PartyMix", songs: [])
        
        #expect(playlist1.name == "PartyMix", "El nombre debería ser PartyMix")
        #expect(playlist2.name == "PartyMix_1", "El segundo playlist debería ajustarse a PartyMix_1 para evitar duplicados")
    }
    
    @Test func testAddSong() async throws {
        var playlist = Playlist(name: "PlaylistVacia", songs: [])
        let maxSong = Song(id:"100", basicInfo: BasicInfo(title: "One step forward", artist: "Max Romeo", durationMs: 219000, genre: "Reggae", album: "Best of", releaseDate: "2003-11-13", isExplicit: false), technicalInfo: TechnicalInfo(bpm: 320, key: "F#", isrc: "USUM123456789"), metadata: Metadata(tags: ["80s", "reggae"], language: "en", popularity: 80))
        playlist.addSong(song: maxSong)
        #expect(playlist.songs == [maxSong])
    }
    
    @Test func testAddPlaylist() async throws {
        var playlist = Playlist(name: "PlaylistVacia", songs: [])
        let testData = TestData.getSongs() ?? "".data(using: .utf8)
        let songs = SongsLoader(fromData: testData).songs
        playlist.addPlaylist(newSongs: songs)
        #expect(playlist.songs == songs)
    }
    
    
    @Test func orderByTonality() async throws {
        // Saco los titulos del array ordenado por tonalidad y comparo con lo que espero.
        let testData = TestData.getSongs() ?? "".data(using: .utf8)
        let songs = SongsLoader(fromData: testData).songs
        let playlist = Playlist(name: "Tonalidades", songs: songs)
        let result = playlist.orderByTonality(songs: songs)
        let expectedTitles = ["Industry Baby", "Good 4 U", "Blinding Lights", "Save Your Tears", "Levitating", "Peaches"]
        
        let resultTitles = result.map{$0.basicInfo.title}
        #expect(resultTitles == expectedTitles)
    }
    
    
    @Test func orderByPopularity() async throws {
        let testData = TestData.getSongs() ?? "".data(using: .utf8)
        let songs = SongsLoader(fromData: testData).songs
        let playlist = Playlist(name: "Popus", songs: songs)
        let populares = playlist.orderByPopularity(songs: songs, order: .ascending)
        let expectedTitles = ["Save Your Tears", "Peaches", "Levitating", "Good 4 U", "Industry Baby", "Blinding Lights"]
        let resultPopus = populares.map{$0.basicInfo.title}
        #expect(resultPopus == expectedTitles)
    }
}
