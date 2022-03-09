import UIKit


class BaseVC: UIViewController, MessageSubscriber {
    
    func accept(new messages: [Message]) {
        // Handle new messages in the base class
    }
    
    func accept(removed messages: [Message]) {
        // Handle removed messages in the base class
    }
    
    func startReceivingMessages() {
        
        // Calling Singleton
        FriendsChatService.shared.add(subscriber: self)

    }
    
}


class MessagesListVC: BaseVC {
    override func accept(new messages: [Message]) {
        print("MessagesListVC accepted 'new messages'")
        /// handle new messages in the child class

    }
    
    override func accept(removed messages: [Message]) {
        print("MessagesListVC accepted 'removed messages'")
        /// handle removed messages in the child class

    }
    
    override func startReceivingMessages() {
        super.startReceivingMessages()
    }
}


class ChatVC: BaseVC {
    override func accept(new messages: [Message]) {
        print("ChatVC accepted 'new messages'")
        /// handle new messages in the child class
    }
    
    
    override func accept(removed messages: [Message]) {
        print("ChatVC accepted 'removed messages'")
        /// handle removed messages in the child class
    }
    
    override func startReceivingMessages() {
        print("ChatVC starts receive messages")
        super.startReceivingMessages()
    }
    
}


protocol MessageSubscriber {
    func accept(new messages: [Message])
    func accept(removed messages: [Message])
}

protocol MessagesService {
    func add(subscriber: MessageSubscriber)
}


//MARK: - Singleton

class FriendsChatService: MessagesService {
    
    static let shared = FriendsChatService()
    private init () {}
    private var subscribers = [MessageSubscriber]()
    
    func add(subscriber: MessageSubscriber) {
        subscribers.append(subscriber)
        
        startFetching()
    }
    
    private func startFetching() {
        let newMessages = [Message(id: 1, text: "Message 1"),
                           Message(id: 2, text: "Message 2"),
                           Message(id: 3, text: "Message 3")]
        
        let removedMessages = [Message(id: 1, text: "Message 1")]
        
        receivedNew(messages: newMessages)
        receivedRemoved(messages: removedMessages)
    }
    
    private func receivedNew(messages: [Message]) {
        subscribers.forEach { item in
            item.accept(removed: messages)
        }
    }
    
    private func receivedRemoved(messages: [Message]) {
        subscribers.forEach { item in
            item.accept(removed: messages)
        }
    }
    
}


// MARK: - Not Cloneable

extension FriendsChatService: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}



// Model
struct Message {
    let id: Int
    let text: String
}


