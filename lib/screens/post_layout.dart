import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model_widgets/post_model.dart';

class PostLayout extends StatefulWidget {
  final String urlPhoto;
  final String username;
  final String profilePic;

  const PostLayout({Key? key, required this.urlPhoto, required this.username, required this.profilePic}) : super(key: key);

  @override
  State<PostLayout> createState() => _PostLayoutState();
}

class _PostLayoutState extends State<PostLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text('Post',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              size: 25,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height)-56-38,
              color: Colors.black87,
              child:
              PostModel(
                postList: [],
                index: 0,
                upperRightIcon: (Icon(Icons.more_vert_outlined, color: Colors.white,)),
              ),),
          ],
        ),
      ),
    );
  }
}
