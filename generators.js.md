# Generators

Generators are functions which can be stopped while in process and run later as many times as you want (_Run - Stop - Run_).

A generator function is signed with an asterisk `*`. You can put it anywhere between the function keyword and
the function name, it does not matter exactly where.

Likewise regular functions, generator functions can also defined using `GeneratorFunction` constructors or a
`function*` expression.

Generators are supported by [nodejs][1] and must be executed with the `--harmony` option.

    function *foo() {
      var stop = yield 'foo';
      console.log(stop);                              // (2) baz-2
    }
    var G = foo();

    console.log( G.next('bar-1') );                   // (1) { value: 'foo', done: false }
    console.log( G.next('baz-2') );                   // (3) { value: undefined, done: true }

A generator has a `next` method that returns an object like `{value: VALUE_FROM_YIELD, done:
IS_THIS_FINISHED}`.

The execution of the generator function (`*foo`) creates a generator `G`, but does not execute the statements
within the function.
Calling `next` of the generator `G` starts execution, then pauses at the `yield` expression and returns the
yield value and the state. Calling `next` again continues execution until the next `yield` statement.

Context between all run -> stop -> run will be saved.

## Examples

### Fibonacci Sequence

    function *fibonacci() {
      var n1 = n2 = 1;
      while(1) {
        var curr = n1;
        n1 = n2;
        n2 = n1 + curr;
        yield curr;
      }
    }
    var fi = fibonacci();
    console.log(fi.next().value);                     // (4) 1
    console.log(fi.next().value);                     // (5) 1
    console.log(fi.next().value);                     // (6) 2
    console.log(fi.next().value);                     // (7) 3

[1]: http://nodejs.org
