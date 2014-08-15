# On Javascript

## Usage

evaluate [literate javascript][1] using [node][2]:

    litjs script.js.md

evaluate literate javascript using [rhino][3]:

    litjs -e rhino script.js.md

use a watcher with a `-w` option

# Install

    brew install node
    brew install rhino

Install `lijs`:

    make

[1]: http://en.wikipedia.org/wiki/Literate_programming
[2]: http://nodejs.org
[3]: https://developer.mozilla.org/de/docs/Rhino
