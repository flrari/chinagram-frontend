import 'package:flutter/material.dart';

import '../screens/comments_screen.dart';
import '../screens/post_layout.dart';

class PostGrid extends StatefulWidget {
  final List<String> postUrl;

  const PostGrid({Key? key, required this.postUrl}) : super(key: key);

  @override
  State<PostGrid> createState() => _PostGridState();
}

class _PostGridState extends State<PostGrid> {

  String url = 'https://picsum.photos/400?random=3';
  late bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemCount: 20,
        itemBuilder: (context, index){
          return GestureDetector(
            onLongPressStart: (details) => showMenu(
                context: context,
                position: RelativeRect.fromDirectional(
                    textDirection: TextDirection.ltr,
                    start: 50, top: 200, end: 50, bottom: 200),
                color: Colors.black38,
                items: [
                  PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: Dialog(
                      backgroundColor: Colors.black45,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text('ary.floris'),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black87, width: 2),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  'https://i.postimg.cc/fbqrcsCB/photo-2022-10-06-16-06-47.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            //tileColor: Colors.black38,
                          ),
                          Image.network(
                            widget.postUrl[index],
                            height: 300,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isLiked = !isLiked;
                                      });
                                    },
                                    child: isLiked ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border, color: Colors.white,),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => CommentsScreen(
                                              upperRightIcon: Icon(Icons.more_vert, color: Colors.white,)
                                          ),),
                                        );
                                      },
                                      child: Icon(Icons.messenger_outline_rounded, color: Colors.white,
                                      )),
                                  Icon(Icons.send_outlined,color: Colors.white,),
                                  Icon(Icons.more_vert,color: Colors.white,),
                                ],),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => PostLayout(
                      urlPhoto: widget.postUrl[index],
                      username: 'ary.floris',
                      profilePic: 'https://i.postimg.cc/fbqrcsCB/photo-2022-10-06-16-06-47.jpg',)
                )
                );
              },
              child: Image.network(
                widget.postUrl[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        }
    );
  }
}
