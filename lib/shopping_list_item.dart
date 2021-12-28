import 'package:flutter/material.dart';
import 'dart:math';

class Product {
  const Product({
    required this.name,
  });

  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class Point {
  // final double x;
  // final double y;
  // final double distanceFromOrigin;

  // Point(double x, double y)
  //     : x = x,
  //       y = y,
  //       distanceFromOrigin = sqrt(x * x + y * y);
  // Point(this.x, this.y);

  // Point.alongXAxis(double x) : this(x, 0);
  static const Point origin = Point(0, 0);

  final double x, y;

  const Point(this.x, this.y);

  getPosition() {
    return 'x = $x, y = $y';
  }

  getOrigin() {
    final originX = origin.x;
    final originY = origin.y;
    return 'origin x = $originX, y = $originY';
  }
}

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

// var logger = Logger('UI');
// logger.log('Button clicked');

// var logMap = {'name': 'UI'};
// var loggerJson = Logger.fromJson(logMap);
// print(loggerJson);

class Animal {
  final String _name;

  Animal(this._name);

  String greet(String who) => 'Hello, $who, I am $_name. \n';
}

class NoNameAnimal implements Animal {
  String get _name => '';

  String greet(String who) => 'Hi $who, Do you know who I am? \n';
}

String greebBob(Animal animal) => animal.greet('Bob');

class Cat implements Animal, Point {
  final _name;
  final x;
  final y;

  Cat(this._name, this.x, this.y);

  String greet(String who) => 'Hi $who, I am $_name, my position is $x, $y.';

  getPosition() {
    return 'x = $x, y = $y';
  }

  getOrigin() {
    return '';
  }
}

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
  }) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   onTap: () {
    //     onCartChanged(product, inCart);
    //   },
    //   leading: CircleAvatar(
    //     backgroundColor: _getColor(context),
    //     child: Text(product.name[0]),
    //   ),
    //   title: Text(
    //     product.name,
    //     style: _getTextStyle(context),
    //   ),
    // );

    return ListTile(
        onLongPress: () {
          onCartChanged(product, inCart);
        },
        onTap: () {
          // onCartChanged(product, inCart);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new ProduceDetailPage(
                        name: product.name,
                      )));
        },
        leading: CircleAvatar(
          backgroundColor: _getColor(context),
          child: Text(product.name[0]),
        ),
        // title: Text(
        //   product.name,
        //   style: _getTextStyle(context),
        // ),
        title: Row(
          children: [
            Text(
              product.name,
              style: _getTextStyle(context),
            ),
            Text(Point(2, 3).getPosition()),
            Text(greebBob(Animal('Dog'))),
            Text(greebBob(NoNameAnimal())),
            Text(Cat('mimi', 2, 3).greet('Hebi')),
          ],
        ));
    // return new Scaffold(
    //   appBar: new AppBar(
    //     title: new Text('Layout show'),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     tooltip: 'Add', // used by assistive technologies
    //     child: Icon(Icons.add),
    //     onPressed: null,
    //   ),
    //   body: ListView(
    //     children: [
    //       ListTile(
    //         onTap: () {
    //           onCartChanged(product, inCart);
    //         },
    //         leading: CircleAvatar(
    //           backgroundColor: _getColor(context),
    //           child: Text(product.name[0]),
    //         ),
    //         title: Text(
    //           product.name,
    //           style: _getTextStyle(context),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, Key? key}) : super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping List'),
        ),
        body: ListView(
          children: [
            Text('xxx'),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var product = widget.products[index];
                  return ShoppingListItem(
                      product: product,
                      inCart: _shoppingCart.contains(product),
                      onCartChanged: _handleCartChanged);
                }),
            // ListView(
            //   // padding: EdgeInsets.all(8),
            //   padding: new EdgeInsets.symmetric(vertical: 8.0),
            //   children: widget.products.map((Product product) {
            //     return ShoppingListItem(
            //         product: product,
            //         inCart: _shoppingCart.contains(product),
            //         onCartChanged: _handleCartChanged);
            //   }).toList(),
            // ),
          ],
        ));
  }
}

late int _price;

class ProduceDetailPage extends StatelessWidget {
  ProduceDetailPage({
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    _price = 5;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter Title'),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Row(
              children: [
                Container(
                  child: Text(
                    "商品名称:",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                ),
                Text(
                  this.name,
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    "商品价格:",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                ),
                Text(
                  '$_price',
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
                Text(
                  '元',
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
