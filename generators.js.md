# Generators

A __generator__ is a special type of function that works as a __factory for iterators__. A function becomes a generator if it
contains one or more yield expressions.

Generators are supported by [Rhino][2] and [Nodejs][1] (execute with `--harmony` option). Nodejs requires that a generator
function is signed with an asterisk `*`. You can put it anywhere between the function keyword and the function name, it does
not matter exactly where.

Likewise regular functions, generator functions can also be defined using `GeneratorFunction` constructors or a
`function*` expression.

    function* foo() {
      var stop = yield 'foo';
      console.log(stop);                              // (2) baz-2
    }
    var G = foo();

    console.log( G.next('bar-1') );                   // (1) { value: 'foo', done: false }
    console.log( G.next('baz-2') );                   // (3) { value: undefined, done: true }

Calling a generator function (`var G = foo()`) does not execute its body immediately; an `iterator` object for the function is
returned instead.
Generators are functions which can be stopped while in process and run later as many times as you want (_Run - Stop - Run_).

Calling `next` of the generator `G` starts execution, then pauses at the `yield` expression and returns the
yield value and the state. Calling `next` again continues execution until the next `yield` statement.
The `next` method returns an object `{value: VALUE_FROM_YIELD, done: IS_THIS_FINISHED}` (Nodejs) or 
`VALUE_FROM_YIELD` (Rhino).

## Examples

### Fibonacci Sequence

    function* fibonacci() {
      var n1 = n2 = 1;
      while(1) {
        var curr = n1;
        n1 = n2;
        n2 = n1 + curr;
        yield curr;
      }
    }
    for(n of fibonacci()) {
      if(n > 10) break;
      console.log(n);                                 // (4) 1, ..., (9) 8
    }

[1]: http://nodejs.org
[2]: https://developer.mozilla.org/de/docs/Rhino
