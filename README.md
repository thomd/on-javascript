# On Javascript

some personal notes about javascript using [literate javascript][1].

### Usage

evaluate with [node][2]:

    litjs script.js.md

evaluate with [rhino][3]:

    litjs -e rhino script.js.md

use a file watcher with a `-w` option

### Install

    brew install node
    brew install rhino

Install `litjs`:

    make

[1]: http://en.wikipedia.org/wiki/Literate_programming
[2]: http://nodejs.org
[3]: https://developer.mozilla.org/de/docs/Rhino
