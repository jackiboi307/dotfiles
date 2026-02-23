#!/bin/python

import argparse

DEFAULT_EYES = "O"
DEFAULT_MOUTH = "w"
DEFAULT_BORDER_H = "-"
DEFAULT_BORDER_V = "|"
DEFAULT_TAB_SIZE = 4

# cat = f"""
#  /\\/\\
# /    \\  {message}
# | oo  | /           _
# \\> - <\\______       \\\\
#  \\           \\      //
#   \\___________X====/
# """[1:-1]


def catsay(
        message,
        eyes=DEFAULT_EYES,
        mouth=DEFAULT_MOUTH,
        borderh=DEFAULT_BORDER_H,
        borderv=DEFAULT_BORDER_V,
        tab_size=DEFAULT_TAB_SIZE,
        do_print=True):

    # remove tabs
    message = [line.replace("\t", " " * tab_size) for line in message]

    longest = 0
    for line in message:
        if longest < len(line):
            longest = len(line)

    borderh = borderh * (longest+2)

    cat = r"""
  /\_/\
 ( R R )
 ( >R< )     R
/  , ,  \  /
|| | | ||     _
\| | | |/____//
 (_)-(_)------
"""[1:-1].replace("R", "{}").format(
        eyes if len(eyes) == 1 else eyes[0],
        eyes if len(eyes) == 1 else eyes[1],
        mouth,
        borderh,
    )

    cat = "\n" * (len(message) - 1) + cat
    cat = cat.splitlines()

    for i in range(len(message) + 1):
        if len(cat[i]) < 12:
            cat[i] += " " * (12 - len(cat[i]))

        if i != 0:
            cat[i] += borderv + " " + message[i-1] + \
                " " * (longest - len(message[i-1])) + " " + borderv

    cat[0] += " " + borderh

    cat = "\n".join(cat)

    if do_print:
        print(cat)

    return cat


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument(
            '--eyes',     type=str, metavar="string", dest="eyes",    default=DEFAULT_EYES,
            help="eyes, may be two characters long (default: 'O')")
    parser.add_argument(
            '--mouth',    type=str, metavar="string", dest="mouth",   default=DEFAULT_MOUTH,
            help="mouth (default: 'w')")
    parser.add_argument(
            '--border-h', type=str, metavar="string", dest="borderh", default=DEFAULT_BORDER_H,
            help="horizontal border (default: '-')")
    parser.add_argument(
            '--border-v', type=str, metavar="string", dest="borderv", default=DEFAULT_BORDER_V,
            help="vertical border (default: '|')")
    parser.add_argument(
            '--tab-size', type=int, metavar="int",    dest="tab_size", default=DEFAULT_TAB_SIZE,
            help="tab size in spaces (default: 4)")
    parser.add_argument(
            'message', nargs='*', type=str, metavar="string",
            help="a list of strings which will be separated by spaces, if omitted stdin is used")

    args = parser.parse_args()

    assert len(args.eyes) in (1, 2)
    assert len(args.mouth) == 1
    assert len(args.borderh) == 1
    assert len(args.borderv) == 1

    if len(args.message) == 0:
        message = []
        while True:
            try:
                message.append(input())
            except EOFError:
                break

    else:
        message = " ".join(args.message).splitlines()

    catsay(message, args.eyes, args.mouth, args.borderh, args.borderv, args.tab_size)

