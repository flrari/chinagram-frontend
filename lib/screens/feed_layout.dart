
import 'package:flutter/material.dart';

import '../model_widgets/post_model.dart';
import '../widgets/stories_builder.dart';
import 'directs_screen.dart';

class FeedLayout extends StatefulWidget {
  const FeedLayout({Key? key}) : super(key: key);

  @override
  State<FeedLayout> createState() => _FeedLayoutState();
}

class _FeedLayoutState extends State<FeedLayout> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'not Instagram',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: 'Billabong',
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_box_outlined),
              color: Colors.white,
              iconSize: 28,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined),
              color: Colors.white,
              iconSize: 28,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Direct(username: 'ary.floris'),
                  ),
                );
              },
              icon: Icon(Icons.send_outlined),
              color: Colors.white,
              iconSize: 28,
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Flexible(
                      child: StoriesBuilder(
                        number: 0,
                        isProfile: false,
                      )),
                ],
              ),
            ),
            const Divider(height: 1, color: Colors.white),
            postBuilder(),
            // postList.isEmpty
            //     ? Center(child: Text("Non hai amici"))
            //     : postBuilder(),
          ],
        ),
    );
  }

  Widget postBuilder() {
    return Flexible(
      child: ListView.builder(
          itemCount: 15,
          itemBuilder: (build, index) {
            return Post(
              urlProfilePic: 'https://picsum.photos/200?random=${index}',
              photoUrl: 'https://picsum.photos/200?random=${index}',
              index: index,
              upperRightIcon: Icon(
                Icons.send_outlined,
                color: Colors.white,
              ),
            );
          }),
    );
  }
}
