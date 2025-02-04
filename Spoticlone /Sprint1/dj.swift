//
//  dj.swift
//  Sprint1
//
//  Created by Álvaro Entrena Casas on 4/2/25.
//

import Foundation

struct dj {
    
    var songs: [Song]
    
    //Sacar los tags disponibles
    func uniqueTags() -> [String] {
        var tagSet: Set<String> = []
        for song in songs{
            tagSet.formUnion(song.metadata.tags)
        }
        return Array(tagSet)
    }
    
    //Crear playlist en base a un tag
    func accessByTag(tag: String) -> [Song] {
        var tagList: [Song] = []
        tagList = songs.filter{$0.metadata.tags.contains(tag)}
        return tagList
    }
    
    
    //Crear una playlist con la posibilidad de 2 estilos
    func createByStyle(style1: DJStyle, style2: DJStyle? = nil) -> [Song]{
        var listByStyle: [Song] = []
        let combinedTags = Set(style1.tag).union(style2?.tag ?? [])
        
        listByStyle = songs.filter {song in
            let songTags = Set(song.metadata.tags)
            return !songTags.isDisjoint(with: combinedTags)
        }
        return listByStyle
    }
    
    
    
    
}
