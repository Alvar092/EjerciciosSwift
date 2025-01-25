//
//  main.swift
//  PiedraPapelTijeras
//
//  Created by Álvaro Entrena Casas on 24/1/25.
//

import Foundation


enum Option: String, CaseIterable {
    case piedra = "piedra"
    case papel = "papel"
    case tijeras = "tijeras"
    case salir = "salir"
}

func player() -> Option {
    let playerChoiceEnum : Option
    
    print("Elige una opción: \n 1· Piedra,\n 2· Papel, \n 3· Tijera ,4· Salir del juego ")
    
    guard let playerChoice = readLine()?.lowercased() else {
        print("Entrada no válida, elige Piedra, Papel o Tijera.")
        return Option.salir
    }
    switch playerChoice {
    case "piedra":
        playerChoiceEnum = Option.piedra
    case "papel":
        playerChoiceEnum = Option.papel
    case "tijeras":
        playerChoiceEnum = Option.tijeras
    default:
        playerChoiceEnum = Option.salir
    }
    return playerChoiceEnum
}

func pc() -> Option {
    let pcChoice = Option.allCases.randomElement()!
   return pcChoice
}




func gameLoop(playerChoice: Option, pcChoice: Option) -> String {
    
    var result = ""
    var victories = [(Option.piedra, Option.tijeras), (Option.tijeras, Option.papel), (Option.papel, Option.piedra)]
    var game = (playerChoice, pcChoice)
        
    if playerChoice == pcChoice {
        result = "Es un empate, juega de nuevo"
    } else if game == victories[0] || game == victories[1] || game == victories[2] {
        result = "Victoria para el humano"
    } else {
        result = "Victoria para la máquina"
    }
    return result
}



func main() {
    
}

main()


