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
    
    
    // returns self as thre make game is different for each game(subclass)
    class func makeGame(players: [Player]) -> Self {
        let boardGame = self.init(players: players, numberOfTiles: 20)
//        boardGame.locale = Locale.current
//        boardGame.timeLimit = 900
        return boardGame
    }
    
    // Designated initializers
    // make sure all properties get initialized
    required init(players: [Player], numberOfTiles: Int) {
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

protocol BoardGameType {
    init(players: [Player], numberOfTiles: Int)
}


class NewBoardGame: BoardGameType {
    required init(players: [Player], numberOfTiles: Int) {
        
    }
}


final class BoardGameFinal: BoardGameType {
    init(players: [Player], numberOfTiles: Int) {
        
    }
}
