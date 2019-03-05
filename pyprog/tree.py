class Node:

    def __init__(self, data):

        self.left = None
        self.right = None
        self.data = data

    # INSERT
    def insert(self,data):
        if self.data:
            if data < self.data:
                if self.left is None:
                    self.left = Node(data)
                else:
                    self.left.insert(data)
            elif data > self.data:
                if self.right is None:
                    self.right = Node(data)
            else:
                self.right.insert(data)
        else:
            self.data = data

    # Print the tree
    def PrintTree(self):
        # Infix Printing
        if self.left:
            self.left.PrintTree()
        #print( self.data),
        if self.right:
            self.right.PrintTree()
        print( self.data),

#root = Node(10)
#root.PrintTree()

# Use the insert method to add nodes
root = Node(12)
root.insert(6)
root.insert(14)
root.insert(3)

root.PrintTree()
