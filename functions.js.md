# Javascript Functions

There are three ways to define functions:

1. function declaration (function statement): `function foo(){}` [note: there is no semicolon. You need a separate invocation of foo()]

2. function [named] expression (function operator): `var foo = function(){};` or `var foo = function foo(){};`

3. Function constructor

## Constructor Function

Naming convention: uppercase

Every function has - among others - an implicit property `prototype`.

    //    +-----------------------------------------------------------------------------------+
    //    |                                                                                   |
    //    +--> function Foo(){}                    +-------> Foo.prototype = new Object()     |
    //        +-------------------+---------+      |        +--------------+---------+        |
    //        | name              | Foo     |      |        | constructor  |         |--------+
    //        +-------------------+---------+      |        +--------------+---------+
    //        | length            | 0       |      |
    //        +-------------------+---------+      |
    //        | prototype         |         |------+
    //        +-------------------+---------+




## Function.prototype.call


## Function.prototype.apply

### console.log wrapper as an example

    log = function() {
       console.log.apply(console, Array.prototype.slice.call(arguments));
    }

## CLosures 

_Funktionsabschlüsse_ (german)

https://developer.mozilla.org/de/docs/Web/JavaScript/Guide/Closures

[1]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function
