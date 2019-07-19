#!/usr/bin/env python
class Tree(object):
    def __init__(self):
        self.left = None
        self.right = None
        self.data = None
    def insert(self,value):
        if self.left is None:
            node = Tree()
            self.left = node
            node.left = None
            node.right = None
        else:
            self.left = insert(self.left)

        if self.right is None:
            node = Tree()
            self.right = node
            node.left = None
            node.right = None
        else:
            self.right = insert(self.right)

root = Tree()
root.data = "root"
root.left = Tree()
root.left.data = "left"
root.right = Tree()
root.right.data = "right"

print(root.left.data)
