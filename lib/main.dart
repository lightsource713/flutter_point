import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text("Product Listing")
      ),
      body:ListView(
        shrinkWrap: true,
        padding:const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: [
          ProductBox(
            name:"iPhone",description:"iphone is the stylist phone ever",price:1000,image:"iphone.jpg"
          ),
          ProductBox(
              name: "Pixel",
              description: "Pixel is the most featureful phone ever",
              price: 800,
              image: "pixel.jpg"
          ),
          ProductBox(
              name: "Laptop",
              description: "Laptop is most productive development tool",
              price: 2000,
              image: "laptop.jpg"
          ),
          ProductBox(
              name: "Tablet",
              description: "Tablet is the most useful device ever for meeting",
              price: 1500,
              image: "tablet.jpg"
          ),
          ProductBox(
              name: "Pendrive",
              description: "Pendrive is useful storage medium",
              price: 100,
              image: "pendrive.png"
          ),
          ProductBox(
              name: "Floppy Drive",
              description: "Floppy drive is useful rescue storage medium",
              price: 20,
              image: "floppy.jpg"
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget{
  ProductBox({super.key,required this.name,required this.description,required this.price,required this.image});

  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context){
    return Container(
      padding:const EdgeInsets.all(2),
      height:180,
      child:Card(
        child:Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children:[
            Image.asset(
              "assets/" + image,
              width: 220.0, // Set the desired width
            ),
            Expanded(child: Container(
              padding:EdgeInsets.all(5),
              child:Column(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  Text(this.name,style:TextStyle(fontWeight: FontWeight.bold)),
                  Text(this.description),Text("Price: "+this.price.toString()),
                  RatingBox()
                ],
              )
            ))
          ]
        )
      )
    );
  }
}
class RatingBox extends StatefulWidget{
  @override
  _RatingBoxState createState ()=>_RatingBoxState();
}
class _RatingBoxState extends State<RatingBox>{
  int _rating = 0;
  void _setRatingAsOne(){
    setState(() {
      _rating =1;
    });
  }
  void _setRatingAsTwo(){
    setState(() {
      _rating = 2;
    });
  }
  void _setRatingAsThree(){
    setState(() {
      _rating = 3;
    });
  }
  void _setRatingAsFour(){
    setState(() {
      _rating = 4;
    });
  }
  void _setRatingAsFive(){
    setState(() {
      _rating = 5;
    });
  }
  Widget build(BuildContext context){
    double _size = 20;
    return Row(

      mainAxisAlignment:MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: Container(
          padding: EdgeInsets.all(0),
          child:IconButton(
            icon:(_rating>=1?Icon(
              Icons.star,size:_size,
            )
                :Icon(Icons.star_border,size:_size)
            ),
            color:Colors.red[500],
            onPressed: _setRatingAsOne,
            iconSize: _size,
          ),
        ), ),
        Expanded(child:Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating>=2?
            Icon(Icons.star,size: _size,):
            Icon(Icons.star_border,size:_size)
            ),
            color:Colors.red[500],
            onPressed: _setRatingAsTwo,
            iconSize: _size,
          ),
        ), ),
        Expanded(child:Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating>=3?
            Icon(Icons.star,size: _size,):
            Icon(Icons.star_border,size:_size)
            ),
            color:Colors.red[500],
            onPressed: _setRatingAsThree,
            iconSize: _size,
          ),
        ), ),
        Expanded(child: Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating>=4?
            Icon(Icons.star,size: _size,):
            Icon(Icons.star_border,size:_size)
            ),
            color:Colors.red[500],
            onPressed: _setRatingAsFour,
            iconSize: _size,
          ),
        ),),
        Expanded(child: Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating>=5?
            Icon(Icons.star,size: _size,):
            Icon(Icons.star_border,size:_size)
            ),
            color:Colors.red[500],
            onPressed: _setRatingAsFive,
            iconSize: _size,
          ),
        ))
      ],
    );
  }
}
