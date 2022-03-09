import UIKit

enum Pawn: CaseIterable {
    case shoe, dog, car, ketchupBottle, iron, hat
}

struct Player {
    let name: String
    let pawn: Pawn
}

extension Player {
    init(name: String) {
        self.name = name
        self.pawn = Pawn.allCases.randomElement()!
    }
}


class BoardGame {
    let players: [Player]
    let numberOfTiles: Int

    // Designated initializers
    // make sure all properties get initialized
    init(players: [Player], numberOfTiles: Int) {
        self.players = players
        self.numberOfTiles = numberOfTiles
    }

    // Convenience initializer accepting players
    convenience init(players: [Player]) {
        self.init(players: players, numberOfTiles: 20)
    }


    // Convenience initializer converting strings to players
    // default values or create a simpler initialization syntax.
    convenience init(names: [String]) {
        var players = [Player]()

        for name in names {
            players.append(Player(name: name))
        }
        self.init(players: players, numberOfTiles: 20)
    }
}



class MutabilityGame: BoardGame {
    var scoreBoard = [String: Int]()
    var winner: Player?
    var instructions: String

    // Designated initializers
    init(players: [Player], numberOfTiles: Int, instructions: String) {
        self.instructions = instructions
        super.init(players: players, numberOfTiles: numberOfTiles)
    }

//    override init(players: [Player], numberOfTiles: Int) {
//        self.instructions = "instructions"
//        super.init(players: players, numberOfTiles: numberOfTiles)
//    }

    // Convenience override init
    convenience override init(players: [Player], numberOfTiles: Int) {
        self.init(players: players, numberOfTiles: numberOfTiles, instructions: "")
    }

}

class MutabilityLandJunior: MutabilityGame {
    var sound: Bool

    // Designated init

    init(players: [Player], numberOfTiles: Int, instructions: String, sound: Bool) {
        self.sound = sound
        super.init(players: players, numberOfTiles: numberOfTiles, instructions: instructions)
    }

    // convenience override init
    convenience override init(players: [Player], numberOfTiles: Int, instructions: String) {
        self.init(players: players, numberOfTiles: numberOfTiles, instructions: instructions, sound: true)
    }

}



let players = [Player(name: "re"), Player(name: "Ahmed")]
let muGame = MutabilityGame(players: players, numberOfTiles: 10)
let mutabilityLand = MutabilityGame(players: players, numberOfTiles: 40)
let allInitGame = MutabilityGame(players: players, numberOfTiles: 3, instructions: "No Rules")

let last = MutabilityLandJunior(players: players, numberOfTiles: 12, instructions: "No Kickout", sound: true)

print(allInitGame.instructions)

//class Check {
//    var sum = 10
//    static let result = 15
//}
//
//print(Check().)

