//
//  BinaryTree.swift
//  BinaryTree
//
//  Created by Христиченко Александр on 2023-02-23.
//

import Foundation

class BinaryTree {
    var root: Node?

    func insert(key: Int) {
        root = insertItem(root, key)
    }
    
    private func insertItem(_ node: Node?, _ key: Int) -> Node {
        
        // If node is nil - set it here.
        guard let node = node else {
            let node = Node(key)
            return node
        }
        
        if key < node.key {
            node.left = insertItem(node.left, key)
        }
        if key > node.key {
            node.right = insertItem(node.right, key)
        }
        
        return node;
    }
    
    func find(key: Int) -> Int? {
        guard let root = root else { return nil }
        guard let node = find(root, key) else { return nil }
        
        return node.key
    }

    private func find(_ node: Node?, _ key: Int) -> Node? {
        guard let node = node else { return nil }
        
        if node.key == key {
            return node
        } else if key < node.key {
            return find(node.left, key)
        } else if key > node.key {
            return find(node.right, key)
        }
        return nil
        // Note: duplicate keys not allowed so don't need to check
    }
    
    func findMin() -> Int {
        guard let root = root else { return 0 }
        return findMin(root).key;
    }

    private func findMin(_ node: Node) -> Node {
        return node.min;
    }

    func delete(key: Int) {
        guard let _ = root else { return }
        root = delete(&root, key);
    }
    
    private func delete(_  node: inout Node?, _ key: Int) -> Node? {
        guard let nd = node else { return nil }

        if key < nd.key {
            nd.left = delete(&nd.left, key)
        } else if key > nd.key {
            nd.right = delete(&nd.right, key)
        } else {
            //This is the node we want to delete.
            // Case 1: No child
            if nd.left == nil && nd.right == nil {
                return nil
            }
            
            // Case 2: One child
            else if nd.left == nil {
                return nd.right // check delete(&insideNode.right, key) not necessary because we have already found
            }
            else if nd.right == nil {
                return nd.left // delete(&insideNode.left, key)
            }
            
            // Case 3: Two children
            else {
                // Find the minimum node on the right (could also find max on the left)
                let minRight = findMin(nd.right!)
                
                // Duplicate it by copying its value here
                nd.key = minRight.key
                
                // Now go ahead and delete the node we just duplicated (same key)
                nd.right = delete(&nd.right, nd.key)
            }
        }
        
        return nd
    }
}
