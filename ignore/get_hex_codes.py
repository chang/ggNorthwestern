import re
import urllib.request
from bs4 import BeautifulSoup


def matches_regex(s, regex_list):
    """Returns True if the input string matches any regex in regex_list, False otherwise."""
    if not isinstance(regex_list, list):
        regex_list = [regex_list]
    for regex in regex_list:
        if re.findall(regex, s):
            return True


def parse_rgb(s):
    """Converts RGB string to tuple"""
    s = s.strip().replace('RGB: ', '').replace(' ', '')
    rgb_list = s.split(',')
    rgb_str = tuple([int(x) for x in rgb_list])
    return rgb_str


def format_r_code_assignments(hex_dict):
    """Prints R code to assign hex codes to stdout."""
    for color, hex_ in hex_dict.items():
        var_name = color.upper().replace('PURPLE ', 'PUR_')
        statement = "{var} = '{hex_}'".format(var=var_name, hex_=hex_)
        print(statement)


# Converting between RGB and Hexadecimal color codes
_NUMERALS = '0123456789abcdefABCDEF'
_HEXDEC = {v: int(v, 16) for v in (x + y for x in _NUMERALS for y in _NUMERALS)}
LOWERCASE, UPPERCASE = 'x', 'X'


def rgb(triplet):
    return _HEXDEC[triplet[0:2]], _HEXDEC[triplet[2:4]], _HEXDEC[triplet[4:6]]


def triplet(rgb, lettercase=LOWERCASE):
    return '#' + format(rgb[0] << 16 | rgb[1] << 8 | rgb[2], '06' + lettercase)


if __name__ == "__main__":
    # Get HTML content
    URL_BRAND_TOOLS = "http://www.northwestern.edu/brand/visual-identity/color/index.html"
    html_page = urllib.request.urlopen(URL_BRAND_TOOLS)
    soup = BeautifulSoup(html_page, 'html.parser')
    html_pretty = soup.prettify()
    lines = html_pretty.split('\n')

    # Parse and store codes
    purple_codes = ['Purple Main']
    rgb_codes = []

    regex_rgb = 'RGB:.*'
    regex_purple = 'Purple [0-9]+'
    rgb_max_line_len = 50
    color_max_line_len = 20

    for line in lines:
        if matches_regex(line, regex_rgb) and len(line) < rgb_max_line_len:
            rgb_code = parse_rgb(line)
            rgb_codes.append(rgb_code)
        elif matches_regex(line, regex_purple) and len(line) < color_max_line_len:
            purple_codes.append(line.strip())

    rgb_dict = dict(zip(purple_codes, rgb_codes[0:16]))
    hex_dict = {color: triplet(rgb) for (color, rgb) in rgb_dict.items()}
    format_r_code_assignments(hex_dict)
