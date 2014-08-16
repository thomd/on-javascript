# Objects in Javascript

Useful object-oriented concepts:

* encapsulation: distinguishing between internal complexity and external interface




Javascript allows two ways of creating objects:

## Object Literal

    var object = {}
    object.property = 'foo'
    object.method = function(){
      console.log(this.property);
    }
    object.method()                                                  // (1) foo

When a function is called as a method, as in `object.method()`, the special variable `this` in its body will 
refer to the calling object.

With `call` (which is inherited from `Function`), you can write a method once and then inherit it in another 
object, without having to rewrite the method for the new object:

    var otherObject = {}
    otherObject.property = 'bar'

    object.method.call(otherObject)                                  // (2) bar

CAUTION: if you extract a new function from an object, then the object is lost, `this` will then refer to the
new context, in this case the global object:

    var extractedFunction = object.method
    extractedFunction()                                              // (3) undefined

In this case you need to create a new function bound to `object` using `Function.prototype.bind()`:

    var extractedFunction = object.method.bind(object)
    extractedFunction()                                              // (4) foo

Another pitfall is when using an objects method as a callback for an asynchronous function (like Timers, 
DOM events or XHR requests). This case also requires to use a new callback function bound to the object:

    var asyncMethod = function(callback){
      callback()
    }
    object._method = function() {
      asyncMethod(this.method)                                       // (5) undefined
      asyncMethod(this.method.bind(object))                          // (6) foo
    }
    object._method()






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

    console.log(cheese.print())                                      // (6) feta consts 5
    console.log(fun.print())                                         // (7) robot consts 40



