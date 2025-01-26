//
//  main.swift
//  PiedraPapelTijeras
//
//  Created by Álvaro Entrena Casas on 24/1/25.
//

import Foundation

func main() {
    var continuar = true
    
    var player = Player()
    var machine = Machine()
    while continuar {
        let playerChoice = player.readPlayer()
        let computer = machine.pc()
        if playerChoice == .quit {
            print("Thanks for playing!")
            continuar = false
        } else {
            let result = machine.gameLoop(playerOption: playerChoice, pcChoice: computer)
        print(result)
        }
    }
}





main()



//enum Option: String, CaseIterable {
//    case rock = "rock"
//    case paper = "paper"
//    case scissors = "scissors"
//    case quit = "quit"
//}


//func player() -> Option {
//    var playerChoiceEnum : Option
//    let validAnswer = ["0", "1", "2", "3"]
//    var playerChoice = ""
//    repeat {
//        print("Select an option: \n 0 - Rock \n 1 - Paper,\n 2 - Scissors,\n 3 - Quit \n --------")
//        if let input = readLine() {
//            if validAnswer.contains(input){
//                playerChoice = input
//            } else {
//                print("Invalid choice, please choose a number option.")
//            }
//            }
//        } while playerChoice == ""
//    
//        switch playerChoice {
//        case "0":
//            playerChoiceEnum = .rock
//            break
//            
//        case "1":
//            playerChoiceEnum = .paper
//            break
//            
//        case "2":
//            playerChoiceEnum = .scissors
//            break
//            
//        case "3":
//            playerChoiceEnum = .quit
//            break
//            
//        default :
//            playerChoiceEnum = .quit
//        }
//    return playerChoiceEnum
//}

//func pc() -> Option {
//    let pcChoice = Option.allCases.randomElement()!
//   return pcChoice
//}

//func gameLoop(playerChoice: Option, pcChoice: Option) -> String {
//    
//    var result = ""
//    let victories = [(Option.rock, Option.scissors), (Option.scissors, Option.paper), (Option.paper, Option.rock)]
//    let game = (playerChoice, pcChoice)
//    
//    if playerChoice == pcChoice {
//        result = "It's a draw, play again"
//    } else if game == victories[0] || game == victories[1] || game == victories[2] {
//        result = "Human: \(playerChoice) vs machine: \(pcChoice): \n------\n Human wins! \n ------"
//    } else {
//        result = "Human: \(playerChoice) vs machine: \(pcChoice): \n------\n Machine wins! \n------"
//    }
//    return result
//}

//func main() {
//    var continuar = true
//    
//    while continuar {
//       var playerChoice = Player.playerChoice
//        if playerChoice == Option.quit {
//            continuar = false
//            print("Thanks for playing!")
//        } else {
//            let machine.pcChoice
//            let result = Machine.gameLoop(playerOption: playerChoice , pcChoice: pcChoice)
//            print(result)
//        }
//    }
//}

func main() {
    var continuar = true
    
    var player = Player()
    var machine = Machine()
    while continuar {
        let playerChoice = player.readPlayer()
        let computer = machine.pc()
        if playerChoice == .quit {
            print("Thanks for playing!")
            continuar = false
        } else {
            let result = machine.gameLoop(playerOption: playerChoice, pcChoice: computer)
        print(result)
        }
    }
}





main()
