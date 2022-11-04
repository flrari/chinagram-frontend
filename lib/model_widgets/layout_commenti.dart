import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class CommentiLayout extends StatefulWidget {

  final String text;
  final VoidCallback? elimina;
  final String username;
  final int index;

  const CommentiLayout({Key? key,
    required this.text,
    this.elimina,
    required this.username,
    required this.index,
  }) : super(key: key);

  @override
  State<CommentiLayout> createState() => _CommentiLayoutState();
}

class _CommentiLayoutState extends State<CommentiLayout> {

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return FocusedMenuHolder(
        child: ListTile(
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
          title: Text.rich(
            TextSpan(
              text: widget.username,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: widget.text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.start,
          ),
          subtitle:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('n min',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),),
              isLiked ? Text('1 \"Mi piace\"', style: TextStyle(color: Colors.grey, fontSize: 12,),) : Container(),
              Text('Rispondi',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),),
              SizedBox(width: 60,),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      size: 17,
                      color: isLiked ? Colors.red : Colors.grey,)
                ),
              ),
            ],
          ),

        ),
        onPressed: (details) => () {},
        menuItems: <FocusedMenuItem>[
          FocusedMenuItem(
            backgroundColor: Colors.black87,
            title: Text('Elimina', style: TextStyle(fontSize: 20, color: Colors.white),),
            trailingIcon: Icon(Icons.delete_outline),
            onPressed: widget.elimina != null ? widget.elimina! : () {},
          ),
        ]
    );
  }
}
