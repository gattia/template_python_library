import argparse

import template_python_library


def main(number=10):
    for i in range(number):
        template_python_library.dummy_function(i)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Example example")
    parser.add_argument(
        "-n",
        "--number",
        type=int,
        nargs="+",
        default=10,
        help="Number of times to call the example function",
    )
    args = parser.parse_args()
    print(args)

    main(**vars(args))
