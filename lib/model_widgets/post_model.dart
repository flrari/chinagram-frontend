import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/comments_screen.dart';


class Post extends StatefulWidget {

  final String urlProfilePic;
  final String photoUrl;
  final int index;
  final Widget upperRightIcon;

  const Post({Key? key,
    required this.urlProfilePic,
    required this.photoUrl,
    required this.upperRightIcon,
    required this.index,

  }) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {

  bool liked = false;
  bool isSlider = false;

  @override
  Widget build(BuildContext context) {

    // if(widget.photos![widget.index].url!.length > 0){
    //   isSlider = true;
    // }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(5),
          visualDensity: VisualDensity.compact,
          title: Text('username'),
          subtitle: Text('place'),
          leading:
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              widget.urlProfilePic,
              width: 40,
              height: 40,
            ),
          ),
          trailing: Icon(
            Icons.more_vert_outlined,
            size: 18,
          ),
        ),
        //isSlider ? slide(widget.photos![widget.index].url!) : photo(widget.photos![widget.index].url!),
        photo(widget.photoUrl),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      liked = !liked;
                    });
                  },
                  icon: Icon(
                    liked ? Icons.favorite : Icons.favorite_border_outlined,
                    color: Colors.white,
                    size: 30,)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommentsScreen(upperRightIcon: widget.upperRightIcon,)),
                    );
                  },
                  icon: Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: Colors.white,
                    size: 30,)),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.send_outlined,
                    color: Colors.white,
                    size: 30,)),
              SizedBox(width: 150,),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.bookmark_border_outlined,
                    color: Colors.white,
                    size: 30,)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
          child: Row(
            children: [
              Text.rich(
                TextSpan(
                  text: 'piace a ',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'username ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: 'e ',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: 'altri',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
          child: Text.rich(
            TextSpan(
              text: 'username  ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'didscalia',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network('https://i.postimg.cc/fbqrcsCB/photo-2022-10-06-16-06-47.jpg', fit: BoxFit.cover,),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommentsScreen(
                        upperRightIcon: widget.upperRightIcon
                    )),);
                },
                child: Text('Aggiungi un commento...',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget photo(String url){
    return InkWell(
      onDoubleTap: () {
        setState(() {
          liked = !liked;
        });
      },
      child: Image.network(
        url,
        height: 420,
        width: 420,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget slide(String url){

    List<String> urlList = [
      url,
      'https://picsum.photos/400?random=10',
      'https://picsum.photos/400?random=15',
      'https://picsum.photos/400?random=17'
    ];

    return CarouselSlider(
        options: CarouselOptions(
          enableInfiniteScroll: false,
          height: 420,
          autoPlay: false,
          enlargeCenterPage: false,
          viewportFraction: 1,
        ),
        items: [0, 1, 2, 3].map((i) {
          return Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              InkWell(
                onDoubleTap: () {
                  setState(() {
                    liked = !liked;
                  });
                },
                child: Image.network(
                  urlList[i],
                  // height: 420,
                  width: 420,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 38,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('${i+1}/4',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),),
                ),
              ),
            ],
          );
        }
        ).toList()
    );
  }

}
