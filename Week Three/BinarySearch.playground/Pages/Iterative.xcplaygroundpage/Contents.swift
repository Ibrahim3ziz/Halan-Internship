
import Foundation
import UIKit



class BinarySearch {
        
    func firstIndex(_ arr: [Int], value: Int) -> Int {
        var start = 0
        var end = arr.count - 1
        var middle = 0
        var firstIndex = -1
        
        while start <= end {
            middle = start + (end - start) / 2
            
            if value == arr[middle] {
                firstIndex = middle
                end = middle - 1
            } else if value > arr[middle] {
                start = middle + 1
            } else if value < arr[middle] {
                end = middle - 1
            }
        }
        
        if firstIndex == -1 {
            print("The elemnt is not found")
        } else {
            print("First index of elemnt \(value) is at \(firstIndex)")
        }
        
        return firstIndex
    }
    
    
    func lastIndex(_ arr: [Int], value: Int) -> Int {
        var start = 0
        var end = arr.count - 1
        var middle = 0
        var lastIndex = -1
        
        while start <= end {
            middle = start + (end - start) / 2
            
            if value == arr[middle] {
                lastIndex = middle
                start = middle + 1
            } else if value > arr[middle] {
                start = middle + 1
            } else if value < arr[middle] {
                end = middle - 1
            }
        }
        
        if lastIndex == -1 {
            print("The elemnt is not found")
        } else {
            print("First index of elemnt \(value) is at \(lastIndex)")
        }
        return lastIndex
    }
    
}


BinarySearch().firstIndex([1, 1, 2, 2, 4, 4, 4, 20, 20], value: 1)
BinarySearch().lastIndex([1, 1, 2, 2, 4, 4, 4, 20, 20], value: 1)
