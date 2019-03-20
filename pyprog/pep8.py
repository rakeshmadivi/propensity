class Test:
    def __init__(self):
        self.foo = 11
        self._bar = 23
        self.__baz = 23

class ExtendedTest(Test):
    def __init__(self):
        super().__init__()
        self.foo = 'overridden'
        self._bar = 'overridden'
        self.__baz = 'overridden'

    def get_mangling(self):
        return self.__baz

t = Test()
print(dir(t))

t2 = ExtendedTest()
print("foo and _bar: ",t2.foo,t2._bar)
print("__baz:",t2.get_mangling())
