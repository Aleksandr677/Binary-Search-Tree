//
//  Node.swift
//  BinaryTree
//
//  Created by Христиченко Александр on 2023-02-23.
//

import Foundation

class Node: Identifiable {
    var key: Int = 0
    var left: Node?
    var right: Node?
    
    init(_ key: Int) {
        self.key = key
    }
    
    var min: Node {
        if left == nil {
            return self
        } else {
            return left!.min
        }
    }
}
