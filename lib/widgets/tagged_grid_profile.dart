import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class TaggedGrid extends StatelessWidget {
  final List<String> postUrl;

  const TaggedGrid({Key? key, required this.postUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemCount: 3,
        itemBuilder: (context, index){
          return Image.network(
            postUrl[index],
            fit: BoxFit.cover,
          );
        }
    );
  }
}
