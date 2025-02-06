//
//  Sprint1Testing.swift
//  Sprint1Testing
//
//  Created by Ismael Sabri Pérez on 20/1/25.
//

import Testing

class Sprint1Testing {
    @Test func getSongsFromArtist() async throws {
        let testData = TestData.getSongs() ?? "".data(using: .utf8)!
        let songs = SongsLoader(fromData: testData).songs
        #expect(Main().getSongsFromArtist("The Weeknd", inSongs: songs).count == 2, "Se espera que al menos haya una canción de The Weeknd")
    }
    
    @Test func getSongsFromArtistWithEmptySong() async throws {
        #expect(Main().getSongsFromArtist("The Weeknd", inSongs: []).count == 0, "Se espera un array de canciones vacías para The Weeknd porque no hemos pasado ninguna canción en la función")
    }
    
    @Test func getSongsByGenre() async throws {
        let testData = TestData.getSongs() ?? "".data(using: .utf8)
        let songs = SongsLoader(fromData: testData).songs
        #expect(Main().getSongsByGenre("Pop", inSongs: songs) == ["Blinding Lights", "Levitating", "Save Your Tears"], "Espero un array de canciones filtrado por genero.")
    }
    
    @Test func getAveragePopularity() async throws {
        let testData = TestData.getSongs() ?? "".data(using: .utf8)
        let songs = SongsLoader(fromData: testData).songs
        #expect(Main().getAveragePopularity(inSongs: songs) == Int(90), "La media de las 5 canciones debería dar eso")
    }
    
    @Test func getTotalDuration() async throws {
        let testData = TestData.getSongs() ?? "".data(using: .utf8)
        let songs = SongsLoader(fromData: testData).songs
        #expect(Main().getTotalDuration(songs: songs) == Int(20))
    }
    
    @Test func getAlbumWithMoreSongs() async throws {
        let testData = TestData.getSongs() ?? "".data(using: .utf8)
        let songs = SongsLoader(fromData: testData).songs
        #expect(Main().getAlbumWithMoreSongs(songs: songs) == "After Hours")
    }
    
    @Test func getSongsByBPM() async throws {
        let testData = TestData.getSongs() ?? "".data(using: .utf8)
        let songs = SongsLoader(fromData: testData).songs
        #expect(Main().getSongsByBPM(bpm: 170, songs: songs) == ["Good 4 U"])
    }
    
    @Test func songsForAllTonalities() async throws {
        let testData = TestData.getSongs() ?? "".data(using: .utf8)
        let songs = SongsLoader(fromData: testData).songs
        #expect(Main().songsForAllTonalities(_key: "D", songs: songs) == false, "Gracias a este test me he dado cuenta de que antes solo registraba las tonalidades que habia una vez, sin duplicidades, y daba por hecho que estaban todas.")
    }
}
