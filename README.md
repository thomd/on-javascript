# On Javascript

<img src="https://raw.githubusercontent.com/thomd/on-javascript/images/js.png">

Some personal notes about javascript using [literate javascript][1].

1. [on Objects](objects.js.md)
2. [on Functions](functions.js.md)
2. [on Generators](generators.js.md)

### Usage

Evaluate with [iojs][4] or [nodejs][2]:

    litjs <script>.js.md
    litjs -e node:harmony <script>.js.md

Evaluate with [rhino][3]:

    litjs -e rhino <script>.js.md

Evaluate using a file watcher with the `-w` option

### Install

Install javascript environments:

    brew install nvm
    nvm install node
    nvm install iojs
    brew install rhino

Install `litjs`:

    make

[1]: http://en.wikipedia.org/wiki/Literate_programming
[2]: http://nodejs.org
[3]: https://developer.mozilla.org/de/docs/Rhino
[4]: https://iojs.org/en/index.html
