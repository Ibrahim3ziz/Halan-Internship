// https://www.marcosantadev.com/solid-principles-applied-swift/

import UIKit
import XCTest

// Clients should'n be forced to implement interfaces that they don't use.
// Fat Interfaces(Protocols and Classes)

// FAT INTERFACE PROTOCOL

protocol GestureProtocol {
    func didTapGesture()
    func didDoubleTap()
    func didLongPress()
}

class SuperButton: GestureProtocol {
    func didTapGesture() {
        // send tap action
    }
    
    func didDoubleTap() {
        // send double tap action
    }
    
    func didLongPress() {
        // send long press tap action
    }
}


class SmallButton: GestureProtocol {
    func didTapGesture() {
        // send tap action
    }
    
    func didDoubleTap() { }
    
    func didLongPress() { }
}


// MARK: - ISP Application

protocol TapProtocol {
    func didTap()
}

protocol DoubleTapProtocol {
    func didDoubleTap()
}

protocol LongPressProtocol {
    func didLongPress()
}


class SuperButtonISP: TapProtocol, DoubleTapProtocol, LongPressProtocol {
    func didDoubleTap() {
        // send double tap action
    }
    
    func didLongPress() {
        // send long press tap action
    }
    
    func didTap() {
        // send tap action
    }

}

class SmallButtonISP: TapProtocol {
    func didTap() {
        // send tap action
    }

}


// FAT INTERFACE CLASS

class Video {
    var title: String = "My Video"
    var description: String = "This is a beautiful video"
    var author: String = "Marco Santarossa"
    var url: String = "https://marcosantadev.com/my_video"
    var duration: Int = 60
    var created: Date = Date()
    var update: Date = Date()
}


class VideoClient {
    func play(video: Video) {
        // INJECTION TOO MANY INFO.
        // load the player UI
        // load the content at video.url
        // add video.title to the player UI title
        // update the player scrubber with video.duration
    }
}


// MARK: - ISP Application

protocol Playable {
    var title: String {get}
    var url: String {get}
    var duration: Int {get}
}


class VideoISP: Playable {
    var title: String = "My Video"
    var description: String = "This is a beautiful video"
    var author: String = "Marco Santarossa"
    var url: String = "https://marcosantadev.com/my_video"
    var duration: Int = 60
    var created: Date = Date()
    var update: Date = Date()
    
    func play(video: Playable) {
        // load the player UI
        // load the content at video.url
        // add video.title to the player UI title
        // update the player scrubber with video.duration
    }
}

class VideoClientTwo {
    func play(video: Playable) {
        // load the player UI
        // load the content at video.url
        // add video.title to the player UI title
        // update the player scrubber with video.duration
    }
}



// MARK: - Unit Testing


class StubPlayable: Playable {
    private(set) var isTitledRead = false
    
    var title: String {
        self.isTitledRead = true
        return "My Video"
    }
    
    var url: String = "https://marcosantadev.com/my_video"
    
    var duration: Int = 60
    
    func test_Play_IsURLRead() {
        let stub = StubPlayable()
        VideoClientTwo().play(video: stub)
        
        XCTAssertTrue(stub.isTitledRead)
    }
    
}
