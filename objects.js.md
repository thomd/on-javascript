# Objects in Javascript

Useful object-oriented concepts:

* __encapsulation__: distinguishing between internal complexity and external interface




Javascript allows two ways of creating objects:

(1) __declarative__ (literal form):

    object = {}

(2) __constructed__: (using a function as constructor with `new`)

    object = new Object()

## Object Literal

Objects have __properties__. Properties which hold a function as value are called methods:

    object = {}
    object.property = 'foo'
    object.method = function() {
      console.log(this.property);                                    // `this` is the calling object `object`
    }
    object.method()                                                  // (1) foo

### What is `this` ?

When a function is called as a method, as in `object.method()`, the special variable `this` in its body is a 
reference to the calling object, which can be used for the duration of that function's execution. This process
is called __Implicit Binding__.

With `call` or `apply` (which is inherited from `Function`), you can force `this` to be another object. This allows to
write a method once and then inherit it in another object, without having to rewrite the method for the new object. 
This process is called __Explicit Binding__.

    otherObject = {}
    otherObject.property = 'bar'

    object.method.call(otherObject)                                  // (2) bar

If you pass primitives to `call`, then they will be wrapped in its object form (often called "boxing"):

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


## Prototype

In addition to their set of __properties__, all objects (except `Object`) also have a __prototype__. 
A prototype is another object that is used as a fallback source of properties.

To get the prototype of an object, use `Object.getPrototypeOf()`:

    console.log(Object.getPrototypeOf(object) == Object.prototype)       // (9) true

When an object gets a request for a property that it does not have, its prototype will be searched for the 
property, then the prototypes prototype, and so on.




## Constructor based objects

## Object.prototype.create()


    function Product(name, price) {
      this.name = name;
      this.price = price;
      return this;
    }
    Product.prototype.print = function(){
      return this.name + " costs " + this.price
    }

    function Food(name, price) {
      Product.call(this, name, price);
      this.category = 'food';
    }
    Food.prototype = Object.create(Product.prototype);

    function Toy(name, price) {
      Product.call(this, name, price);
      this.category = 'toy';
    }
    Toy.prototype = Object.create(Product.prototype);

    var cheese = new Food('feta', 5);
    var fun = new Toy('robot', 40);

    console.log(cheese.print())                                      // (10) feta consts 5
    console.log(fun.print())                                         // (11) robot consts 40


Prototypal inheritance: objects inherit from objects

Take an old object as a parameter and returns an empty new object that inherits from the old one.
If we attempt to obtain a member from the new object, and it lacks that key, then the old object will supply the member.

So instead of creating classes, you make prototype objects, and then use the object function to make new instances.
Objects are mutable in JavaScript, so we can augment the new instances, giving them new fields and methods. These can then act as prototypes for even newer objects.
We don't need classes to make lots of similar objects.

### Object.prototype.create Polyfill

There is a drawback of this function: ES5 supports Object.create natively but with arity 2

    if (typeof Object.create != "function") {
      Object.create = function(obj) {
        function F(){}
        F.prototype = obj;
        return new F();
      }
    }
