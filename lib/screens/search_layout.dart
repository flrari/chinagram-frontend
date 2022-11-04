import 'package:flutter/material.dart';

class SearchLayout extends StatefulWidget {
  const SearchLayout({Key? key}) : super(key: key);

  @override
  State<SearchLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<SearchLayout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.search, size: 25,),
              Text('Cerca',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white38,
                  )
              ),
              SizedBox(width: 120,),
              Icon(Icons.place_outlined),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Container(
              //height: 737,
              height: ((MediaQuery.of(context).size.height)-(114+33)),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 100,
                  itemBuilder: (build, index){
                    return SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(child: Image.network('https://picsum.photos/100?random={$index}', width: 100, height: 100,)),
                          Expanded(child: Image.network('https://picsum.photos/100?random={$index+1}', width: 100, height: 100,)),
                          Expanded(child: Image.network('https://picsum.photos/100?random={$index+2}', width: 100, height: 100,)),
                          Expanded(child: Image.network('https://picsum.photos/100?random={$index+3}', width: 100, height: 100,)),
                        ],
                      ),
                    );
                  }
              ),
            ),
          )

        ],
      ),
    );
  }
}
