import UIKit
import Foundation

struct Run {
    
    let id: String
    let startingTime: Date
    var endTime: Date?
    
    var elipsedTime: TimeInterval {
        return Date().timeIntervalSince(startingTime)
    }
    
    var isFinished: Bool {
        return endTime != nil
    }
    
    mutating func setFinished() {
        endTime = Date()
    }
    
    init(id: String, startingTime: Date) {
        self.id = id
        self.startingTime = startingTime
        self.endTime = nil
    }
    
}

var run = Run(id: "123", startingTime: Date())

//print(run.elipsedTime)
//print(run.elipsedTime)
//print(run.elipsedTime.description)
//print(run.id)
//
//print(run.elipsedTime)


struct LearningPlan {
    
    var level: Int
    var description: String
    
//    var content: String {
//        // smart algo. calc. simulated here
//        print("I'm tanking my time to calc.")
//        //  Simulate a two-second delay for the algorithm.
//        sleep(2)
//
//        switch level {
//        case ..<25: return "Watch an English documentary"
//        case ..<50: return "Translate a newspaper article to English and transcribe one song"
//        case 100...: return "Read two academic papers and translate them into your native language."
//        default: return "try to read English for 30 minutes."
//        }
//    }
    
    // now it can't be mutated from outside (Read-only)
    lazy private(set) var content: String = {
        // smart algo. calc. simulated here
        print("I'm tanking my time to calc.")
        //  Simulate a two-second delay for the algorithm.
        sleep(2)

        switch level {
        case ..<25: return "Watch an English documentary"
        case ..<50: return "Translate a newspaper article to English and transcribe one song"
        case 100...: return "Read two academic papers and translate them into your native language."
        default: return "try to read English for 30 minutes."
        }
    }()
    
    
    init(level: Int, description: String) {
        self.level = level
        self.description = description
    }
}

//var planA = LearningPlan(level: 13, description: "A special one for today.")
//
//
//print(Date())
//for _ in 0..<5 {
//    planA.content
//}
//print(Date())


//var intensePlan = LearningPlan(level: 138, description: "A special plan for today.")
////intensePlan.content
//var easyPlan = intensePlan
//easyPlan.level = 0
//print(easyPlan.content)
//print(intensePlan.content)





struct Song: Decodable {
    let duration: Int
    let track: String
    let year: Int
}

struct Artist {
    var name: String
    var birthOfDate: Date
    let songFileName: String

    var age: Int? {
        let years = Calendar.current.dateComponents([.year], from: Date(), to: birthOfDate).day
        return years
    }

    lazy private(set) var songs: [Song] = {
        guard let fileURL = Bundle.main.url(forResource: songFileName, withExtension: "plist"),
              let data = try? Data(contentsOf: fileURL),
              let songs = try? PropertyListDecoder().decode([Song].self, from: data)
        else {
            return []
        }
        return songs
    }()


    mutating func songsReleasedAfter (year: Int) -> [Song] {
        return songs.filter { (song: Song) -> Bool in
            return song.year > year
        }
    }

    init(name: String, birthOfDate: Date, songFileName: String) {
        self.name = name
        self.birthOfDate = birthOfDate
        self.songFileName = songFileName
    }
}


var billWithers = Artist(name: "billWithers", birthOfDate: Date(), songFileName: "Fly me to the moon")

billWithers.songs
//billWithers.songFileName = "oldSong"

//print(billWithers.songs)
//print(billWithers.songFileName)
//print(billWithers.songs.count)


//    func getAge() -> Int? {
//        let years = Calendar.current
//            .dateComponents([.year], from: Date(), to: birthOfDate)
//            .day
//
//        return years
//    }


//    func loadSongs() -> [Song] {
//        guard let fileURL = Bundle.main.url(forResource: songFileName, withExtension: "plist"),
//              let data = try? Data(contentsOf: fileURL),
//              let songs = try? PropertyListDecoder().decode([Song].self, from: data)
//        else {
//            return []
//        }
//        return songs
//    }


class Player {
    let id: Int
    
    var name: String
    {
        didSet {
            print("my pervious name was \(oldValue)m")
            name = name.trimmingCharacters(in: .whitespaces)
        }
    }
    
    init(name: String, id: Int) {
        defer { self.name = name }
        self.name = name
        self.id = id
    }
    
}

let ahmed = Player(name: "Ahmed   ", id: 12)

print(ahmed.name.count)

//    private var text: String {
//        willSet {
//            trimmingWhiteSpaces(string: newValue)
//        }
//    }
    
//    func trimmingWhiteSpaces(string: String) -> String {

//        var trimmedName: String {
//
//            didSet {
//                print("my old name \(oldValue)")
//                trimmedName = name.trimmingCharacters(in: .whitespaces)
//            }
//        }
        
//        var stringContainer: String = ""
//        for character in string {
//            if character != " " {
//                stringContainer.append(character)
//            }
//        }
//        return stringContainer
//    }


//}


//var ahmed = Player(name: "Ahmed     ", id: 1)
////ahmed.name = "Ahmed     "
//print(ahmed.name)
//print(ahmed.name.count)


