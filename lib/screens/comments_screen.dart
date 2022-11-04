
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model_widgets/layout_commenti.dart';

class CommentsScreen extends StatefulWidget {
  final Widget upperRightIcon;

  const CommentsScreen({
    Key? key,
    required this.upperRightIcon
  }) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {

  List<String> commenti = [];

  TextEditingController commentsController = TextEditingController();
  FocusNode myFocusNode = new FocusNode();

  void addToText(String emoticon, TextEditingController controller){
    setState(() {
      controller.text+= emoticon;
    });
  }

  void addComment(TextEditingController controller){
    setState(() {
      commenti.add(controller.text);
      controller.clear();
    });
  }

  void removeComment(int index){
    setState(() {
      commenti.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // commenti.add(" ${widget.comments[0].body}");
    // commenti.add(" ${widget.comments[1].body}");

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('Commenti',
            style: TextStyle(
              color: Colors.white,
              fontSize:  20,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_outlined,
              color: Colors.white,),
          ),
          actions: [
            IconButton(
              onPressed: null,
              icon: widget.upperRightIcon,
              color: Colors.white,),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height-194-111-65,
                child: buildCommentList()),
          ],
        ),
        bottomSheet: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          color: Colors.black12,
          child: Column(
            children: [
              Container(
                height: 50,
                color: Colors.black12,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      InkWell(
                        onTap: () {
                          addToText('❤️', commentsController);
                        },
                        child: Text(
                          '❤️',
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          addToText('🙌🏼', commentsController);
                        },
                        child: Text(
                          '🙌🏼',
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          addToText('🔥', commentsController);
                        },
                        child: Text(
                          '🔥',
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          addToText('👏🏼', commentsController);
                        },
                        child: Text(
                          '👏🏼',
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          addToText('😢', commentsController);
                        },
                        child: Text(
                          '😢',
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          addToText('😍', commentsController);
                        },
                        child: Text(
                          '😍',
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          addToText('😦', commentsController);
                        },
                        child: Text(
                          '😦',
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          addToText('😂', commentsController);
                        },
                        child: Text(
                          '😂',
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                    ]
                ),
              ),
              Container(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.all(5),
                        child: Container(
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
                        ),),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(Radius.circular(60)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextField(
                                onTap: () {FocusScope.of(context).requestFocus(myFocusNode);},
                                focusNode: myFocusNode,
                                controller: commentsController,
                                textInputAction: TextInputAction.send,
                                keyboardType: TextInputType.text,
                                onSubmitted: (text) {
                                  addComment(commentsController);
                                },
                                decoration: InputDecoration(
                                  hintText: 'Commenta come ary.floris...',
                                  border: InputBorder.none,
                                  suffix: InkWell(
                                      onTap: () {
                                        addComment(commentsController);
                                      },
                                      child: Text(
                                        'Pubblica',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blue,
                                        ),
                                      )
                                  ),
                                  // suffixText: 'Pubblica',
                                  // suffixStyle: TextStyle(
                                  //   fontSize: 15,
                                  //   color: Colors.blue,
                                  // ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }


  Widget buildCommentList(){

    return ListView.builder(
      itemCount: commenti.length,
      itemBuilder: (context, index) {
        return CommentiLayout(
          text: commenti[index],
          elimina: () => removeComment(index),
          username: "ary.floris",
          index: index,
        ); //da completare
      },
    );
  }



}

