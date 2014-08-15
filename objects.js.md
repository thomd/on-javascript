# Objects in Javascript

useful object-oriented concepts:

* encapsulation: distinguishing between internal complexity and external interface




Javascript allows two ways of creating objects:

## Object Literal

    var object = {}
    object.property = 'foo'
    object.method = function(){
      console.log(this.property);
    }
    object.method()                                                  // foo

When a function is called as a method, as in `object.method()`, the special variable `this` in its body will refer to 
the calling object.

With `call` (which is inherited from `Function`), you can write a method once and then inherit it in another object, 
without having to rewrite the method for the new object:

    var otherObject = {}
    otherObject.property = 'bar'

    object.method.call(otherObject)                                  // bar

CAUTION: if you extract a new function from an object, then the object is
lost, `this` will then refer to the global object:

    var extractedFunction = object.method
    extractedFunction()                                              // undefined

In this case you need to create a new function bound to `object` using `Function.prototype.bind()`:

    var extractedFunction = object.method.bind(object)
    extractedFunction()                                              // foo







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

    console.log(cheese.print())
    console.log(fun.print())



