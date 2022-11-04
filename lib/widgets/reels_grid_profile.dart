import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReelsGrid extends StatelessWidget {
  final List<String> postUrl;

  const ReelsGrid({Key? key, required this.postUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: (2/3),
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemCount: 5,
        itemBuilder: (context, index){
          return Image.network(
            postUrl[index],
            fit: BoxFit.cover,
          );
        }
    );
  }
}
