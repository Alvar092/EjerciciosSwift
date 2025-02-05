//
//  player.swift
//  PiedraPapelTijeras
//
//  Created by Álvaro Entrena Casas on 26/1/25.
//

import Foundation

enum Option: Int, CaseIterable {
    case rock 
    case paper
    case scissors
    case quit
}

struct Player{
    
  mutating func readPlayer() -> Option { // FIXME: Tu función readplayer imprime las opciones del menú, una función debe únicamente realizar la funcionalidad para la que está diseñada y no mezclar cosas. Imagina que esto lo usa otro programador y se encuentra usando una función readplayer que imprime algo. No sería lo esperado ya que el noombre de la función es readPlayer. Además, qué significa readPlayer? Lo que hace es obtener la opción del jugador. Por lo tanto, debería llamarse getPlayerOption() o algo similar.
        let validAnswer = ["0", "1", "2", "3"]
        while true {
            print("Select an option: \n 0 - Rock \n 1 - Paper,\n 2 - Scissors,\n 3 - Quit \n --------")
            if let input = readLine() ,
               let number = Int(input) ,
               let playerChoice = Option(rawValue: number){
                    return playerChoice
                } else {
                    print("Invalid choice, please choose a number option.")
                }
            }
        }
    }

    
