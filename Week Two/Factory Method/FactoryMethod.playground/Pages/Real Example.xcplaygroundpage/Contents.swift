import UIKit

// MARK: - CREATOR

protocol ProjectorFactory {
    
    func createProjector() -> Projector
    
    func syncedProjector(with projector: Projector) -> Projector
}


extension ProjectorFactory {
    /// Base implementation of ProjectorFactory
    func syncedProjector(with projector: Projector) -> Projector {
        /// Every instance creates an own projector
        let newProjector = createProjector()
        /// sync projectors
        newProjector.sync(with: projector)
        
        return newProjector
    }
}


// INTERFACE OF CREATOR
protocol Projector {
    
    /// Abstract projector interface
    var currentPage: Int {get}
    func present(info: String)
    func sync(with projector: Projector)
    func update(with page: Int)
     
}


extension Projector {
    /// Base implementation of Projector methods
    func sync(with projector: Projector) {
        update(with: projector.currentPage)
    }
    
}


// MARK: - CONCREATE CREATOR

class WifiFactory: ProjectorFactory {
    func createProjector() -> Projector {
        return WifiProjector()
    }
    
}


class BluetoothFactory: ProjectorFactory {
    func createProjector() -> Projector {
        return BluetoothProjector()
    }
    
}


// to add a new product type to the app, you’ll only need to create a new creator subclass and override the factory method in it.

class TVFactory: ProjectorFactory {
    func createProjector() -> Projector {
        return TVProjevtor()
    }
    
}



// MARK: - CONCREATE PRODUCT

class WifiProjector: Projector {
    var currentPage: Int = 0
    
    func present(info: String) {
        print("Info is presented over wifi: \(info)")
    }
    
    func update(with page: Int) {
        currentPage = page
    }
}


class BluetoothProjector: Projector {
    var currentPage: Int = 0
    
    func present(info: String) {
        print("Info is presented over bluetooth: \(info)")
    }
    
    func update(with page: Int) {
        currentPage = page
    }
}


class TVProjevtor: Projector {
    var currentPage: Int = 0
    
    func present(info: String) {
        print("Info is presented over: \(info)")
    }
    
    func update(with page: Int) {
        currentPage = page
    }
}


// MARK: - CLIENT

private class ClientCode {
    private var currentProjector: Projector?
    
    func present(info: String, with factory: ProjectorFactory) {
        
        guard let projector = currentProjector else {
            /// 'currentProjector' variable is nil. Create a new projector and
            /// start presentation.
            
            let projector = factory.createProjector()
            projector.present(info: info)
            self.currentProjector = projector
            return
        }
        // Now, Client code already has a projector, sync pages of the old
        self.currentProjector = factory.syncedProjector(with: projector)
        self.currentProjector?.present(info: info)
    }
}


private let clientCode = ClientCode()

print(clientCode.present(info: "Very important info of the presentation", with: WifiFactory()))
