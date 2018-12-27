import unittest
import react_refactor as sut


@unittest.skip("Don't forget to test!")
class ReactRefactorTests(unittest.TestCase):

    def test_example_fail(self):
        result = sut.react_refactor_example()
        self.assertEqual("Happy Hacking", result)
