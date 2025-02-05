//
//  djStyles.swift
//  Sprint1
//
//  Created by Álvaro Entrena Casas on 4/2/25.
//

import Foundation


struct DJStyle {
    var name: String
    var description: String
    var tag: [String]
}
    
//    private init(name: String, description: String, tag: [String]) {
//        self.name = name
//        self.description = description
//        self.tag = tag
//    }
    
    
let chillVibes = DJStyle (
    name: "Chill Vibes",
    description: "canciones relajantes y suaves para crear un ambiente tranquilo.",
    tag: ["chill", "soulful", "acoustic", "memories", "soft rock", "nostalgic", "peace."]
)

let partyStarte = DJStyle (
    name: "Party Starter",
    description: "centrado en levantar el ánimo y sacar a la gente a bailar.",
    tag: ["party", "dance", "energetic", "disco", "summer", "fun", "uplifting", "catchy."]
)

let rockAnthems = DJStyle (
    name: "Rock Anthems",
    description: "ideal para apasionados del rock y el heavy, tanto clásico como moderno.",
    tag: [" rock", "hard rock", "power ballad", "anthem", "epic", "alternative", "angry"]
)

let emotionalTrip = DJStyle (
    name: "Emotional Trip",
    description: "diseñado para conectar emocionalmente con la audiencia. Canciones con mensajes profundos y melancólicos.",
    tag: ["emotional", "heartbreak", "melancholic", "regret", "nostalgia", "reflective", "romantic"]
)

let energyBoost =  DJStyle (
    name: "Enery Boost",
    description: "perfecto para motivar y energizar a una multitud sin importar la hora del día.",
    tag: ["motivational", "inspiration", "freedom", "empowerment", "upbeat", "heroic", "power"]
)

let EightysLovers = DJStyle (
    name: "80's lovers",
    description: "para aquellos amantes del synth, el pop retro y la nostalgia de los años 80.",
    tag: ["80s", "synthwave", "pop", "iconic", "retro"])



    
    
    
    
    
    
    

