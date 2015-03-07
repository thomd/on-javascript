# Generators

Generators are functions which can be stopped while in process and run later as many times as you want (_Run - Stop - Run_).


    function *foo() {
      var stop = yield 'foo';
      console.log(stop);
    }
    var Foo = new foo();

    console.log(Foo.next('bar'));
    console.log(Foo.next('baz'));


