import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/post_grid_profile.dart';
import '../widgets/reels_grid_profile.dart';
import '../widgets/stories_builder.dart';
import '../widgets/tagged_grid_profile.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({Key? key}) : super(key: key);

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {

  bool isHidden = true;
  List<String> immaginiPost = [];

  @override
  void initState() {

    for(int i=0; i<20; i++){
      immaginiPost.add('https://picsum.photos/200?random=${i}');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'nickname',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.add_box_outlined),
            color: Colors.white,
            disabledColor: Colors.white,
            iconSize: 30,
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.menu_rounded),
            color: Colors.white,
            disabledColor: Colors.white,
            iconSize: 30,
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _){
            return [
              SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network('https://i.postimg.cc/fbqrcsCB/photo-2022-10-06-16-06-47.jpg', fit: BoxFit.cover,),
                                  ),
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '461',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '\npost',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '416',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '\nfollower',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '1.428',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '\nseguiti',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Nome Cognome',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Biografia \nFrase filosofica'),
                          Text('Link'),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: null,
                                  child: Text(
                                    'Modifica profilo',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              ElevatedButton(
                                onPressed: null,
                                child: Icon(
                                  Icons.person_add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: StoriesBuilder(
                                number: 6,
                                isProfile: true
                            ),
                          ),
                        ],
                      ),
                    )
                  ]))
            ];
          },
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 1,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    icon: Icon(Icons.grid_on),
                  ),
                  Tab(
                    icon: Icon(Icons.movie_creation_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.contact_page_outlined),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    PostGrid(
                      postUrl: immaginiPost,
                    ),
                    ReelsGrid(
                      postUrl: immaginiPost,
                    ),
                    TaggedGrid(
                      postUrl: immaginiPost,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
