# The `this` Keyword

## What is `this` ?

Object properties which hold a function as value are called methods:

    object = {}
    object.property = 'foo'
    object.method = function() {
      console.log(this.property);                                    // `this` is the calling object `object`
    }
    object.method()                                                  // (1) foo

When a function is called as a method, as in `object.method()`, the special variable `this` in its body is a 
reference to the calling object, which can be used for the duration of that function's execution. This process
is called __Implicit Binding__.

With `call` or `apply` (which is inherited from `Function`), you can force `this` to be another object. This allows to
write a method once and then inherit it in another object, without having to rewrite the method for the new object. 
This process is called __Explicit Binding__.

    otherObject = {}
    otherObject.property = 'bar'

    object.method.call(otherObject)                                  // (2) bar

If you pass primitives to `call`, then they will be wrapped in its object form (often called _boxing_):

    name = new String("alice")
    name.out = function(){
      console.log(this)
    }
    name.out()                                                       // (3) alice
    name.out.call("bob")                                             // (4) bob

Binding of `this` happens on runtime, not at author-time. It is only contextual based on the
conditions of the function's invocation, not on where a function is declared.

__CAUTION__: if you extract a new function from an object, then the object is lost, `this` will then refer to
the new context, in this case the global object:

    extractedFunction = object.method                                // is now a reference / alias
    extractedFunction()                                              // (5) undefined

In this case you need to create a new function bound to `object` using `Function.prototype.bind()`. This
process is called __Hard Binding__.

    extractedFunction = object.method.bind(object)
    extractedFunction()                                              // (6) foo

Another pitfall is when using an objects method as a callback. Callbacks are often used with asynchronous 
function (like Timers, DOM events or XHR requests). This case also requires to use a new callback function 
bound to the object using `bind`:

    asyncMethod = function(callback){
      callback()
    }
    object._method = function() {
      asyncMethod(this.method)                                       // (7) undefined
      asyncMethod(this.method.bind(object))                          // (8) foo
    }
    object._method()






var foo = function(){
  console.log(this)
}
new foo()
foo()


# Scope vs Context

READ: http://ryanmorr.com/understanding-scope-and-context-in-javascript/
