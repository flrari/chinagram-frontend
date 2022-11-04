import 'package:flutter/material.dart';

class ReelsLayout extends StatefulWidget {
  const ReelsLayout({Key? key}) : super(key: key);

  @override
  State<ReelsLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ReelsLayout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: (MediaQuery.of(context).size.height),
        width: (MediaQuery.of(context).size.width),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (build, index){
              return Stack(
                  children: [
                    Image.network(
                      'https://picsum.photos/300/800?random={$index}',
                      width: 400,
                      height: 800,
                      fit: BoxFit.cover,
                    ),
                    ListTile(
                      title: Text(
                        index == 0 ? 'Reels' : ' ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),),
                      trailing: Icon(Icons.camera_alt_outlined),
                    ),
                  ]);
            }
        ),
      ),
    );
  }
}
