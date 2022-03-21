import UIKit
import Foundation


class BinarySearch {
    private var start = 0
    private var end = 0
    private var middle = 0
    private var firstIndex = -1
    private var lastIndex = -1

    
    func searchfirstIndex(arr: [Int], value: Int, start: Int, end: Int) -> Int {
        self.start = 0
        self.end = arr.count - 1
        
        middle = start + (end - start + 1) / 2

        if end >= start {
        
            if value == arr[middle] {
                firstIndex = middle
                searchfirstIndex(arr: arr, value: value, start: start, end: middle - 1)
                return firstIndex
            }
            else if arr[middle] > value {
               searchfirstIndex(arr: arr, value: value, start: start, end: middle - 1)
                return firstIndex
            }
            else if arr[middle] < value {
                searchfirstIndex(arr: arr, value: value, start: middle + 1, end: end)
                return firstIndex
            }
        }
        
        if firstIndex == -1 {
            print("The elemnt is not found")
        } else {
            print("First index of elemnt \(value) is at \(firstIndex)")
        }
        
        return firstIndex
    }
    
    
    func searchLastIndex(arr: [Int], value: Int, start: Int, end: Int) -> Int {
        self.start = 0
        self.end = arr.count - 1
        
        middle = start + (end - start) / 2

        if end >= start {

            if value == arr[middle] {
                lastIndex = middle
                searchLastIndex(arr: arr, value: value, start: middle + 1, end: end)
                return lastIndex
            }
            else if arr[middle] > value {
                searchLastIndex(arr: arr, value: value, start: start, end: middle - 1)
                return lastIndex
            }
            else if arr[middle] < value {
                searchLastIndex(arr: arr, value: value, start: middle + 1, end: end)
                return lastIndex
            }
        }
        
        if lastIndex == -1 {
            print("The elemnt is not found")
        } else {
            print("Last index of elemnt \(value) is at \(lastIndex)")
        }
        
        return lastIndex
    }
}



let array = [12, 18, 50 , 66, 100, 100, 100, 120, 122, 200]
let array2 = [12, 12, 18, 50 , 66, 100, 100, 100, 120, 122, 122, 200, 122, 122, 122, 122, 100]


BinarySearch().searchfirstIndex(arr: array2, value: 100, start: 0, end: array2.count - 1)
BinarySearch().searchLastIndex(arr: array2, value: 100, start: 0, end: array2.count - 1)
