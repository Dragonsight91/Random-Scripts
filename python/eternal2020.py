#!/usr/bin/python
import sys
from datetime import datetime

"""
2020 never ends, so this script was a joke based on exactly that. 
What if 2020 really never ended? what would the current month be called?
yes, this script can be imported and used.
yes, this script is unnecessary.
"""

months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

def get_name(n:int) -> str:
    # this function really is a base 12 converter, nothing all that fancy
    def convert(n:int, accum: str):
        if(n//12 != 0):
            return convert(n//12, months[n%12] + accum)
        else:
            return months[n%12] + accum

    return convert(n, "")

def get_date(num: bool = False ):

    # this function calculates the date, if 2020 never ended
    now = datetime.today()
    off = (12 * (now.year-2020)) + now.month -1 
    mon = get_name(off)

    # apply the user's setting
    if num:
        return f"{now.day}/{off}/2020"
    else:
        return f"{now.day} {mon} 2020"


if __name__ == "__main__":

    if not sys.argv[1] in ("--help", "-h"):
        # since this is one of my random things, i don't pay attention to readability. 
        name = get_date(len(sys.argv) > 1 and sys.argv[1] in ("--numeric" ,"-n"))
        print(name)
    else:
        # yes, it has a help function, just like every good CLI command. 
        print("""Eternal 2020
made by: https://github.com/Dragonsight91 (Friday, 29th FebJan 2020)
Get the month as if 2020 never ended.

usage: eternal2020 [options]

options:

-h  --help              get this function
-n  --numeric           get the date in numeric format dd/mm/yyyy
""")