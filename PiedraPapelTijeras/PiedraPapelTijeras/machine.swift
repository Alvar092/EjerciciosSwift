//
//  machine.swift
//  PiedraPapelTijeras
//
//  Created by Álvaro Entrena Casas on 26/1/25.
//

import Foundation


struct Machine {
  
    
    mutating func pc() -> Option {
        let pcChoice = Option.allCases.randomElement()!
       return pcChoice
    }
    
    func gameLoop(playerOption: Option, pcChoice: Option) -> String {
        
        var result = ""
        let victories = [(Option.rock, Option.scissors), (Option.scissors, Option.paper), (Option.paper, Option.rock)]
        let game = (playerOption, pcChoice)
        
        if playerOption == pcChoice {
            result = "It's a draw, play again"
        } else if game == victories[0] || game == victories[1] || game == victories[2] {
            result = "Human: \(playerOption) vs machine: \(pcChoice): \n------\n Human wins! \n ------"
        } else {
            result = "Human: \(playerOption) vs machine: \(pcChoice): \n------\n Machine wins! \n------"
        }
        return result
    }

}
