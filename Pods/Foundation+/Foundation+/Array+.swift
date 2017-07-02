//
//  Array+.swift
//  Elegant
//
//  Created by Steve on 2017/5/18.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation

public extension Array {
    /// The array length property sets or returns the number of elements in an array.
    var length: Int {
        return count
    }

    /// Returns an array containing this sequence shuffled
    var shuffled: Array {
        var elements = self
        return elements.shuffle()
    }

    /// Returns an element from this sequence shuffled
    var random: Element {
        return shuffled[0]
    }

}

public extension Array {

    /// The every method executes the provided transform closure once for each element present in the array until it finds one where transform returns a falsy value. If such an element is found, the every method immediately returns false. Otherwise, if transform returns a truthy value for all elements, every returns true.
    ///
    /// - Parameter transform: condition
    /// - Returns: the result of the condition
    @discardableResult
    func every(transform: (Element) -> Bool) -> Bool {
        for e in self {
            while !transform(e) {
                return false
            }
        }
        return true
    }

    /// The fill() method fills all the elements of an array from a start index to an end index with a static value.
    ///
    /// - Parameter element: the static Value
    /// - Returns: array
    @discardableResult
    func fill(element: Element) -> Array {
        let count = self.count
        return Array(repeating: element, count: count)
    }

    /// Removes and returns the last element of the array.
    ///
    /// - Returns: The last element of the array if the array is not empty;
    ///   otherwise, `nil`.
    ///
    /// - Complexity: O(*n*) if the array is bridged, where *n* is the length
    ///   of the array; otherwise, O(1).
    /// - SeeAlso: `removeLast()`
    mutating func pop() -> Element? {
        return popLast()
    }

    /// The push() method adds one or more elements to the end of an array and returns the new length of the array.
    ///
    /// - Parameter elements: The elements to add to the end of the array.
    /// - Returns: The new length property of the object upon which the method was called.
    @discardableResult
    mutating func push(_ elements: Element...) -> Array {
        return self + elements
    }

    /// The entries() method returns a new Array Iterator object that contains the key/value pairs for each index in the array.
    ///
    /// - Returns: A new Array iterator object.
    @discardableResult
    func entries() -> [(Int, Element)] {
        var temp: [(Int, Element)] = []
        for idx in 0 ..< count {
            temp.append((idx, self[idx]))
        }
        return temp
    }

    /// The concat method creates a new array consisting of the elements in the object on which it is called, followed in order by, for each argument, the elements of that argument (if the argument is an array) or the argument itself (if the argument is not an array). It does not recurse into nested array arguments.

    ///
    /// - Parameter elements: Arrays and/or values to concatenate into a new array. See the description below for details
    /// - Returns: A new Array instance.
    @discardableResult
    mutating func concat(_ elements: [Element]) -> [Element] {
        return self + elements
    }

    /// Shuffles this sequence in place
    ///
    /// - Returns: A new shuffled Array
    @discardableResult
    mutating func shuffle() -> Array {
        indices.dropLast().forEach {
            guard case let index = Int(arc4random_uniform(UInt32(count - $0))) + $0, index != $0 else { return }
            // self.swapAt($0, index)
            swap(&self[$0], &self[index])
        }
        return self
    }
}

public extension Array where Element: CustomStringConvertible {

    ///  Returns a string representing the Array.
    var toString: String {
        var temp: String = ""
        forEach { e in
            temp += String(describing: e)
        }
        return temp
    }
}

public extension Array where Element == String {

    /// The join property joins all elements of an array into a string.
    var join: String {
        return joined()
    }
}

public extension Array where Element: Equatable {

    /// The index method returns the first index at which a given element can be found in the array, or -1 if it is not present.
    ///
    /// - Parameter element: a given element
    /// - Returns: The index of the element at the array
    @discardableResult
    func index(of element: Element) -> Int {
        return index(of: element) ?? -1
    }

    /// Remove first collection element that is equal to the given `object`:
    ///
    /// - Parameter object: The element will remove form the array
    mutating func remove(_ object: Element) {
        remove(at: index(of: object))
    }
}

