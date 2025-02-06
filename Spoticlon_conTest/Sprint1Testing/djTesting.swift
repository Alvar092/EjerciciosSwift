//
//  djTesting.swift
//  Sprint1Testing
//
//  Created by Álvaro Entrena Casas on 6/2/25.
//

import Foundation
import Testing
import OSLog

@Suite("DJ")
class DjTesting{
    var testData :Data?
    var songs: [Song]

    
    init(){
        testData = TestData.getSongs() ?? "".data(using: .utf8)!
        songs = SongsLoader(fromData: testData).songs
    
    }
    
    deinit{
        testData = nil
        songs = [] 
    }
    
    @Test func uniqueTags() async throws {
//        let testData = TestData.getSongs() ?? "".data(using: .utf8)
//        let songs = SongsLoader(fromData: testData).songs
        let dj = dj(songs: songs)
        let tags = dj.uniqueTags()
        let expectedTags:Set<String> = ["80s", "synthwave", "dance",
        "disco", "summer",
        "chill", "pop",
        "angry", "rock", "breakup",
        "pride", "anthem", "confidence", "nostalgia","heartbreak"
    ]
        #expect(Set(tags) == expectedTags)
    }
    
    @Test func createByTag() async throws {
        let dj = dj(songs: songs)
        let playlist = dj.createByTag(tag: "80s")
        #expect(playlist == [Song(id: "1", basicInfo: BasicInfo(title: "Blinding Lights", artist: "The Weeknd", durationMs: 200000, genre: "Pop", album: "After Hours", releaseDate: "2019-11-29", isExplicit: false), technicalInfo: TechnicalInfo(bpm: 171, key: "F#", isrc: "USUM71920298"), metadata: Metadata(tags: ["80s", "synthwave", "dance"], language: "en", popularity: 95))])
    }
    
    @Test func createByStyle() async throws{
        let dj = dj(songs: songs)
        let newPlaylist = dj.createByStyle(style1: chillVibes,style2: partyStarter)
        print(newPlaylist.songs)
      
        #expect(newPlaylist == Playlist(name: "Chill Vibes&Party Starter", songs:[Song(id: "1", basicInfo:BasicInfo(title: "Blinding Lights", artist: "The Weeknd", durationMs: 200000, genre: "Pop", album: "After Hours", releaseDate: "2019-11-29", isExplicit: false), technicalInfo: TechnicalInfo(bpm: 171, key: "F#", isrc: "USUM71920298"), metadata: Metadata(tags: ["80s", "synthwave", "dance"], language: "en", popularity: 95)), Song(id: "2", basicInfo: BasicInfo(title: "Levitating", artist: "Dua Lipa", durationMs: 203000, genre: "Pop", album: "Future Nostalgia", releaseDate: "2020-03-27", isExplicit: false), technicalInfo: TechnicalInfo(bpm: 103, key: "A", isrc: "GBUM72001564"), metadata: Metadata(tags: ["disco", "dance", "summer"], language: "en", popularity: 90)),Song(id: "3", basicInfo: BasicInfo(title: "Peaches", artist: "Justin Bieber", durationMs: 198000, genre: "R&B", album: "Justice", releaseDate: "2021-03-19", isExplicit: false), technicalInfo: TechnicalInfo(bpm: 90, key: "A", isrc: "USUM72103145"), metadata: Metadata(tags: ["summer", "chill", "pop"], language: "en", popularity: 88)), Song(id: "15", basicInfo: BasicInfo(title: "Save Your Tears", artist: "The Weeknd", durationMs: 215000, genre: "Pop", album: "After Hours", releaseDate: "2020-08-05", isExplicit: false), technicalInfo: TechnicalInfo(bpm: 118, key: "F#", isrc: "USUM72006936"), metadata: Metadata(tags: ["heartbreak", "nostalgia", "pop"], language: "en", popularity: 85))]), "Lo he intentado, pero no entiendo como sacar el array que debería salir de canciones, he hecho un copypaste marronero de lo que sacaría la función pero no me lo coge.... ")
    }

    
}
