import UIKit


class Device {
    let room: String
    let serialNumber: String
    
    
    init(room: String, serialNumber: String) {
        self.room = room
        self.serialNumber = serialNumber
    }
    
    convenience init() {
        self.init(room: "room", serialNumber: "serialNumber")
    }
    
    convenience init(room: String) {
        self.init(room: room, serialNumber: "serialNumber")
    }
    
    convenience init(serialNumber: String) {
        self.init(room: "room", serialNumber: serialNumber)
    }
}


class Television: Device {
    enum Resolution {
        case SD, HD, FHD, UHD, Unkown
    }
    
    enum ScreenType {
        case led, oled, lcd, Unkown
    }
    
    var resolution: Resolution
    var screenType: ScreenType
    
    
    init(room: String, serialNumber: String, resolution: Resolution, screenType: ScreenType) {
        self.resolution = resolution
        self.screenType = screenType
        super.init(room: room, serialNumber: serialNumber)
    }
    
    override init(room: String, serialNumber: String) {
        self.resolution = .Unkown
        self.screenType = .Unkown
        super.init(room: room, serialNumber: serialNumber)
    }
}

class HandHelderTelevision: Television {
    let weight: Int
    
    // Designated init
     init(room: String, serialNumber: String, resolution: Television.Resolution, screenType: Television.ScreenType, weight: Int) {
        self.weight = weight
        super.init(room: room, serialNumber: serialNumber, resolution: resolution, screenType: screenType)
    }
    
    // convenience override init
    convenience override init(room: String, serialNumber: String, resolution: Television.Resolution, screenType: Television.ScreenType) {
        self.init(room: room, serialNumber: serialNumber, resolution: resolution, screenType: screenType, weight: 0)
    }
    
    // init with special parameter
    convenience init(serialNumber: String) {
        self.init(room: "room",serialNumber: serialNumber, resolution: .Unkown, screenType: .Unkown)
    }
    
    
}



let Tv1 = Television()
let Tv2 = Television(room: "Two", serialNumber: "124")
let Tv3 = Television(room: "One")
let Tv4 = Television(serialNumber: "000")

let newTv = Television(room: "", serialNumber: "", resolution: .FHD, screenType: .oled)
let tv = Television(serialNumber: "143")

let tvHandler = HandHelderTelevision(serialNumber: "32495tj43")
