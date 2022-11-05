import 'dart:convert';

import 'package:chinagram/bloc/post/post_list_bloc/post_list_event.dart';
import 'package:chinagram/bloc/post/post_list_bloc/post_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post/post_list_bloc/post_list_bloc.dart';
import '../model/post.dart';
import '../model_widgets/post_model.dart';
import '../widgets/stories_builder.dart';
import 'directs_screen.dart';

class FeedLayout extends StatefulWidget {
  const FeedLayout({Key? key}) : super(key: key);

  @override
  State<FeedLayout> createState() => _FeedLayoutState();
}

class _FeedLayoutState extends State<FeedLayout> {

  late List<Post> postList = [];
  bool liked = false;
  late PostListBloc _postListBloc;


  @override
  void initState() {
    _postListBloc = BlocProvider.of<PostListBloc>(context)
      ..add(GetPostListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostListBloc, PostListState>(
      listener: (context, state) {
        if(state is GetPostListStateLoading){
          showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              ));
        }
        if(state is GetPostListStateSuccess){
          if(state.response.statusCode == 200){
            final fetchedItems = jsonDecode(state.response.body);
            postList.clear();
            for(var item in fetchedItems){
              postList.add(Post.fromJson(item));
            }
          }
        }
        if(state is GetPostListStateFailure){
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: SizedBox(
                    width: 300,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Text('ERRORE',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.black38,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding:
                              EdgeInsets.only(bottom: 11.0, top: 18),
                              child: Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                                'Si è verificato un errore. StatusCode errore: ${state.response.statusCode}')
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }
      },
      child: Scaffold(
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
                        postList: postList,
                      )),
                ],
              ),
            ),
            const Divider(height: 1, color: Colors.white),
            postList.isEmpty
                ? Center(child: Text("Non hai amici"))
                : postBuilder(),
          ],
        ),
      ),
    );
  }

  Widget postBuilder() {
    return Flexible(
      child: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (build, index) {
            return PostModel(
              postList: postList,
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
