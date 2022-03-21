//: [Previous](@previous)
//https://www.raywenderlich.com/books/design-patterns-by-tutorials/v3.0/chapters/4-delegation-pattern#toc-chapter-008-anchor-003
import Foundation
import UIKit

public protocol MenuViewControllerDelegate: AnyObject {
    func menuViewController(menuViewController: MenuViewController, didSelectItemAtIndex index: Int)
}

public class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let items = ["Item 1", "Item 2", "Item 3"]
    
    public weak var delegate: MenuViewControllerDelegate?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.menuViewController(menuViewController: self, didSelectItemAtIndex: indexPath.row)
    }
    
}


//: [Next](@next)
