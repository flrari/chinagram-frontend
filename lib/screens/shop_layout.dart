import 'package:flutter/material.dart';

class ShopLayout extends StatefulWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  State<ShopLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ShopLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Shop',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.shopping_bag_outlined),
            color: Colors.white,
            disabledColor: Colors.white,
            iconSize: 30,),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.menu_rounded),
            color: Colors.white,
            disabledColor: Colors.white,
            iconSize: 30,)
        ],
      ),
      body: ListView(

      ),
    );
  }
}
