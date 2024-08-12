import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class Product {
  final String name;
  final String description;
  final int price;
  final String image;
  Product(this.name, this.description, this.price, this.image);
  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(Product(
        "iPhone", "iphone is the stylist phone ever", 1000, "iphone.jpg"));
    items.add(Product(
        "Pixel", "Pixel is the most featureful phone ever", 800, "pixel.jpg"));
    items.add(Product("Laptop", "Laptop is most productive development tool",
        2000, "laptop.jpg"));
    items.add(Product(
        "Tablet",
        "Tablet is the most useful device ever for meeting",
        1500,
        "tablet.jpg"));
    items.add(Product(
        "Pendrive", "Pendrive is useful storage medium", 100, "pendrive.png"));
    items.add(Product("Floppy Drive",
        "Floppy drive is useful rescue storage medium", 20, "floppy.jpg"));

    return items;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  final items = Product.getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Product Listing")),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ProductBox(item: items[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(item: items[index])),
                );
              },
            );
          },
        ));
  }
}

class ProductPage extends StatelessWidget {
  ProductPage({super.key, required this.item});

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.item.name),
        ),
        body: Center(
            child: Container(
                padding: EdgeInsets.all(0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(this.item.image),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    this.item.name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(this.item.description),
                                  Text("Price: " + this.item.price.toString()),
                                  RatingBox(),
                                ],
                              )))
                    ]))));
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({super.key, required this.item});
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(this.item.image),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(this.item.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(this.item.description),
                  Text("Price:" + this.item.price.toString()),
                  RatingBox(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }

  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }

  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }

  void _setRatingAsFour() {
    setState(() {
      _rating = 4;
    });
  }

  void _setRatingAsFive() {
    setState(() {
      _rating = 5;
    });
  }

  Widget build(BuildContext context) {
    double _size = 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              icon: (_rating >= 1
                  ? Icon(
                      Icons.star,
                      size: _size,
                    )
                  : Icon(Icons.star_border, size: _size)),
              color: Colors.red[500],
              onPressed: _setRatingAsOne,
              iconSize: _size,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              icon: (_rating >= 2
                  ? Icon(
                      Icons.star,
                      size: _size,
                    )
                  : Icon(Icons.star_border, size: _size)),
              color: Colors.red[500],
              onPressed: _setRatingAsTwo,
              iconSize: _size,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              icon: (_rating >= 3
                  ? Icon(
                      Icons.star,
                      size: _size,
                    )
                  : Icon(Icons.star_border, size: _size)),
              color: Colors.red[500],
              onPressed: _setRatingAsThree,
              iconSize: _size,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              icon: (_rating >= 4
                  ? Icon(
                      Icons.star,
                      size: _size,
                    )
                  : Icon(Icons.star_border, size: _size)),
              color: Colors.red[500],
              onPressed: _setRatingAsFour,
              iconSize: _size,
            ),
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 5
                ? Icon(
                    Icons.star,
                    size: _size,
                  )
                : Icon(Icons.star_border, size: _size)),
            color: Colors.red[500],
            onPressed: _setRatingAsFive,
            iconSize: _size,
          ),
        ))
      ],
    );
  }
}
