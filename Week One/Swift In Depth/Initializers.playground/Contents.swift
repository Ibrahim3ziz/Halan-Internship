import UIKit

enum Pawn: CaseIterable {
    case shoe, dog, car, ketchupBottle, iron, hat
}

struct Player {
    let name: String
    let pawn: Pawn
    
//    init(name: String) {
//        self.name = name
//        self.pawn = Pawn.allCases.randomElement() ?? .shoe
//    }
}

let playerOne = Player(name: "Ibrahim", pawn: .shoe)
//let playerTwo = Player(name: "Ibrahim")
//print(playerTwo)

extension Player {
    init(name: String) {
        self.name = name
        self.pawn = Pawn.allCases.randomElement()!
    }
}

let playerThree = Player(name: "hima", pawn: .car)
//let playerFour = Player(name: "Raia")
//print(playerFour.pawn)


//struct Pancakes {
//    enum SyrupType {
//        case corn, molasses, maple
//    }
//
//    let syrupType: SyrupType
//    let stackSize: Int
//}
//
//
//extension Pancakes {
//    init(syrupType: SyrupType) {
//        self.stackSize = 10
//        self.syrupType = syrupType
//    }
//}
//
//
//let fullPancake = Pancakes(syrupType: .corn, stackSize: 20)
//let smallPancake = Pancakes(syrupType: .maple)
//
//print(fullPancake)
//print(smallPancake)

class BoardGame {
    let players: [Player]
    let numberOfTiles: Int
    
    // Designated initializers
    init(players: [Player], numberOfTiles: Int) {
        self.players = players
        self.numberOfTiles = numberOfTiles
    }
    
    // Convenience initializer accepting players
    convenience init(players: [Player]) {
        self.init(players: players, numberOfTiles: 20)
    }
    
    
    // Convenience initializer converting strings to players
    convenience init(names: [String]) {
        var players = [Player]()
        
        for name in names {
            players.append(Player(name: name))
        }
        self.init(players: players, numberOfTiles: 20)
    }
}

let players = [playerOne, playerThree]

let game = BoardGame(players: [playerOne, playerThree], numberOfTiles: 30)
let game2 = BoardGame(names: ["Ahmed", "Ibrahim"])
let game3 = BoardGame(players: players)
print(game.players[0].name)


class MutabilityLand: BoardGame {
    
}
