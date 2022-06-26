import UIKit

// Constructing a binary search tree
// Basic Implementation

// Viewing each node as its own seperate tree

class BinarySearchTree<Int: Comparable> {
    
// Set as optional values since not every tree/ additional class needs to have both left and right nodes.
    
    var value: Int
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    var parent: BinarySearchTree?
    
    init(value: Int) {
        self.value = value
    }
    
    // var isLeaf: Bool {
       // return left == nil && right == nil
   // }
}

extension BinarySearchTree: CustomStringConvertible {
    
    public var description: String {
        var result = ""
        if let left = left {
            result += "(\(left.description) <- "
        }
        result += "\(value)"
        if let right = right {
            result += " -> \(right.description)"
        }
        return result
    }
}


// Next we create a way to put functions in the class
// We do this by creating an extension

// Insert functions just check to see if the node exists in a given position before inserting it in that position
// Also since this is a binary search tree we need to chec the value of each incoming node to decide whether it's going to be a left or a right node

extension BinarySearchTree {
    
    func insert(value: Int) {
         insert(value: value, parent: self)
    }
    
   private func insert(value: Int, parent: BinarySearchTree) {
       
        if value < self.value {
            if let left = left {
                left.insert(value: value, parent: self)
                
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {

            if let right = right {
                right.insert(value: value, parent: self)
        } else {
            right = BinarySearchTree(value: value)
            right?.parent = self
            
            }
        }
    }
}

extension BinarySearchTree {
    
// Were iterating throughout the tree to find the search value
// This will be another recursive function
    
    func search(forValue value: Int) -> Bool {
        
        if value == self.value {
            return true
        }
        if value < self.value {
            if let left = left {
                return left.search(forValue: value)
            }
        } else {
            if let right = right {
                return right.search(forValue: value)
            }
        }
        return false
    }
  }

// Finding the minimum and maximum values of our tree
// The minimum value of the tree is normally the left most node
// THe maximum value of the tree is normally the right most node
// While let -> used when we dont know the number ofiterations ahead of time
// Functioon doesnt take in any values

extension BinarySearchTree {
    func minimum() -> Int {
        var node = self
        while let left = node.left {
            node = left
        }
        return node.value
    }
    
    func max() -> Int{
        var node = self
        while let right = node.right{
            node = right
        }
        return node.value
    }
    // base case is a tree with no nodes/ also known as a leaf
    
    func height() -> Int {
        if tree.left == nil && tree.right == nil {
            return 0 as! Int
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    func depth(ofValue: Int) -> Int {
        var depth = 0
        
        func searchandReturn(forValue value: Int) -> BinarySearchTree? {
            if value == self.value {
                print(self)
                return self
            }
            if value < self.value {
                if let left = left {
                    return left.searchandReturn(forValue: value)
                }
            } else {
                if let right = right {
                    return right.searchandReturn(forValue: value)
                }
            }
        }
      }
        return nil
}


                          

    let tree = BinarySearchTree(value: 7 )

tree.insert(value: 8)
tree.insert(value: 6)
tree.insert(value: 10)
tree.insert(value: 2)
tree.insert(value: 12)
tree.insert(value: 22)

print(tree)

tree.search(forValue: 8)

tree.minimum()
tree.maximum()


