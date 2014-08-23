# On Javascript

<img src="https://raw.githubusercontent.com/thomd/on-javascript/images/js.png">

Some personal notes about javascript using [literate javascript][1].

1. [on Objects](objects.js.md)
2. [on Functions](functions.js.md)

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
