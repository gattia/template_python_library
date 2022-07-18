# {update_here}
from dbm import dumb

import template_python_library
from template_python_library.main import dummy_function


def test_fake_1(timing=False):
    if timing is True:
        tic = time.time()

    for i in range(10):
        assert i == template_python_library.dummy_function(i)

    if timing is True:
        toc = time.time()
        print("Test took: {}s".format(toc - tic))


if __name__ == "__main__":
    import time

    test_fake_1(timing=True)
