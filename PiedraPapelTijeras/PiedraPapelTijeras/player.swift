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
    
  mutating func readPlayer() -> Option {
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

    
