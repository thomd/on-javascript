# The `this` Keyword

## What is `this` ?

`this` is a binding for each function invocation based on it's __call-site__. 

    var object = {}
    object.property = 'foo'
    object.method = function() {
      console.log(this.property)                                     // `this` is the calling object `object`
    }
    object.method()                                                  // (1) foo

### Implicit Binding

When a function is called as a method, as in `object.method()`, then `object` is the __receiver__ of the method call and 
is accessible via `this` inside the method. The special variable `this` is a reference to the calling object, which 
can be used for the duration of that function's execution. This process is called __Implicit Binding__.

__CAUTION__: be aware that the __call-site__ is what matters. If you have a reference (or alias), you will __lose that
binding__. In this case you need to create a new function hard-bound to `object`:

    object.method()                                                  // (2) foo

    var extreactedMethod = object.method
    extreactedMethod()                                               // (3) undefined

    var extreactedMethod = object.method.bind(object)
    extreactedMethod()                                               // (4) foo

### Default Binding

If no calling object is given, as in `method()`, then `this` is a reference to the global object. This is
called the __Default Binding__. Be aware that the global object is only eligible for the default binding, when
the contents of `method` are __not__ running in __strict mode__.

### Explicit Binding

With `call` or `apply` (which is inherited from `Function` prototype), you can force `this` to be another object. This allows to
write a method once and then inherit it in another object, without having to rewrite the method for the new object. 
This process is called __Explicit Binding__.

    var otherObject = {}
    otherObject.property = 'bar'

    object.method.call(otherObject)                                  // (5) bar

If you pass primitives to `call`, then they will be wrapped in its object form (often called _boxing_):

    var name = new String("alice")
    name.out = function(){
      console.log(this)
    }
    name.out()                                                       // (6) alice
    name.out.call("bob")                                             // (7) bob

Binding of `this` happens on runtime, not at author-time. It is only contextual based on the
conditions of the function's invocation, not on where a function is declared.

### Hard Binding

When using an objects method as a callback (callbacks are often used with asynchronous function like Timers, DOM events or XHR 
request) or as a reference/alias, then you will lose the implicit binding.

To circumvent this, use a new callback function bound to the object using `bind`:

    setTimeout(object.method, 0)                                     // (8) undefined
    setTimeout(object.method.bind(object), 0)                        // (9) foo

# Scope vs Context

READ: http://reactkungfu.com/2015/07/why-and-how-to-bind-methods-in-your-react-component-classes/

READ: http://ryanmorr.com/understanding-scope-and-context-in-javascript/
