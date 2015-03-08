# Generators

A __generator__ is a special type of function that works as a __factory for iterators__. A function becomes a generator if it
contains one or more yield expressions.

Generators are supported by [Rhino][2] and [Nodejs][1] (execute with `--harmony` option). Nodejs requires that a generator
function is signed with an asterisk `*`. You can put it anywhere between the function keyword and the function name, it does
not matter exactly where.

Likewise regular functions, generator functions can also be defined using `GeneratorFunction` constructors or a
`function*` expression.

    function *foo() {
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
The `next` method returns an iterator object `{value: VALUE_FROM_YIELD, done: IS_THIS_FINISHED}` (Nodejs
[iterator protocol][3]) or just `VALUE_FROM_YIELD` (Rhino).

### Notes

The `yield` expression can only be __inside of a generator function__. Hence the following does not work, as
`yield` is within a non-generator function:

    function *bar() {
      [1,2].forEach(function(i) {                     // non-generator function
        yield i;                                      // [SyntaxError]
      })
    }

## The for...of Statement

The `for...of` statement allows to loop over iterable objects. While `for...in` iterates over __property names__,
`for...of` iterates over __property values__.

The `for...of` statement is __not__ supported in Rhino.

    for(f of foo()) {
      console.log(f);                               // (4) foo, (5) undefined
    }

## Delegating Generators

A `yield *` expression allows to delegate iteration control from one generator to another one. 

The `yield *` expression can `yield` iterables (arrays, strings, ...) and generator objects. `yield *` is 
an __expression__, __not a statement__. It evaluates to a value.

    function *g1() {
      yield 1;
      yield* g2();
      yield* [3, 4];
      yield* [].slice.apply(arguments);
    }
    function *g2() {
      yield 2;
    }

    for(g of g1('foo', 5)){
      console.log(g);                                 // (6) 1, (7) 2, (8) 3, (9) 4, (10) foo, (11) 5
    }

## Use Cases

Generators primary use case is in representing lazy (possibly infinite) __sequences__.

### Fibonacci Sequence

    function *fibonacci(limit) {
      var n1 = n2 = 1;
      while(1) {
        var curr = n1;
        n1 = n2;
        n2 = n1 + curr;
        if(limit && curr > limit) return;
        yield curr;
      }
    }
    for(n of fibonacci(10)) {
      console.log(n);                                 // (12) 1, ..., (17) 8
    }

### Range

    function *range(max, step) {
      var count = 0;
      step = step || 1;
      for (var i = 0; i < max; i += step) {
        count++;
        yield i;
      }
      return count;
    }

    var gen = range(10, 3), info;
    while (!(info = gen.next()).done) {
      console.log(info.value);                        // (18) 0, ..., (21) 9
    }
    console.log("steps taken: " + info.value);        // (22) steps taken: 4


[1]: http://nodejs.org
[2]: https://developer.mozilla.org/de/docs/Rhino
[3]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols
