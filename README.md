# On Javascript

Some personal notes about javascript using [literate javascript][1].

<svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 630 630" width="80" height="80"><g id="logo"><rect id="background" x="0" y="0" width="630" height="630" fill="#f7df1e" /><path id="j" d="m 165.65,526.47375 48.2125,-29.1775 C 223.16375,513.7875 231.625,527.74 251.92,527.74 c 19.45375,0 31.71875,-7.60975 31.71875,-37.21 l 0,-201.3 59.20375,0 0,202.1375 c 0,61.32 -35.94375,89.23125 -88.385,89.23125 -47.36125,0 -74.8525,-24.52875 -88.8075,-54.13" /><path id="s" d="m 375,520.13 48.20625,-27.91125 c 12.69,20.72375 29.1825,35.9475 58.36125,35.9475 24.53125,0 40.17375,-12.26475 40.17375,-29.18125 0,-20.29875 -16.06875,-27.48875 -43.135,-39.32625 l -14.7975,-6.3475 c -42.715,-18.18125 -71.05,-41.0175 -71.05,-89.2275 0,-44.40375 33.83125,-78.2375 86.695,-78.2375 37.6375,0 64.7025,13.11125 84.15375,47.36625 l -46.09625,29.60125 c -10.15,-18.1825 -21.1425,-25.37125 -38.0575,-25.37125 -17.33875,0 -28.335,10.995 -28.335,25.37125 0,17.7625 10.99625,24.9525 36.3675,35.94875 l 14.8,6.3425 c 50.325,21.56875 78.66,43.5575 78.66,93.03375 0,53.2875 -41.86625,82.465 -98.11,82.465 -54.97625,0 -90.5,-26.2175 -107.83625,-60.47375" /></g></svg>

### Usage

Evaluate with [node][2]:

    litjs script.js.md

Evaluate with [rhino][3]:

    litjs -e rhino script.js.md

Use a file watcher with a `-w` option

### Install

    brew install node
    brew install rhino

Install `litjs`:

    make

[1]: http://en.wikipedia.org/wiki/Literate_programming
[2]: http://nodejs.org
[3]: https://developer.mozilla.org/de/docs/Rhino
