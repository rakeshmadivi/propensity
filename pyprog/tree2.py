#!/usr/bin/env python
class Tree(object):
        def __init__(self,value=None):
            self.left = None
            self.right = None
            self.data = value
                             
root = Tree()
root.data = "root"
root.left = Tree()
root.left.data = "left"
root.right = Tree()
root.right.data = "right"

root= Tree("-Root-")
print(root.data)
