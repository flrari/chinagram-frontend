import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoriesBuilder extends StatelessWidget {
  final int number;
  bool isProfile;

  //bool isProfile

  StoriesBuilder({Key? key,
    required this.number,
    required this.isProfile,
    })
      : super(key: key);

  //late List<Users>? users;
  bool thereAreUsers = false;

  @override
  Widget build(BuildContext context) {
    return isProfile
        ? profileStories(number)
        : feedStories(number);
  }

  Widget feedStories(int number) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      //itemCount: userList?.isNotEmpty == true ? userList!.length : 0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (build, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: index == 0 ? Colors.transparent : Colors.grey,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: index == 0 ? Colors.grey : Colors.pink, width: 2),
                  //borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    index == 0
                        ? 'https://i.postimg.cc/fbqrcsCB/photo-2022-10-06-16-06-47.jpg'
                        : 'https://picsum.photos/200?random=$index+1',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                index == 0 ? 'La tua storia' : 'user${index}',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget profileStories(int number) {
    return number == 0
        ? noStories(
      numbers: number,
    )
        : yesStories(number);
  }

  Widget yesStories(int number) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: number,
              scrollDirection: Axis.horizontal,
              itemBuilder: (build, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: index == number
                              ? Colors.black
                              : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 2),
                          //borderRadius: BorderRadius.circular(50),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: index == number - 1
                              ? Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          )
                              : Image.network(
                            'https://picsum.photos/200?random={$index+1}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        index == number - 1 ? 'Nuova' : 'Titolo $index',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class noStories extends StatefulWidget {
  late int numbers;

  noStories({Key? key, required this.numbers}) : super(key: key);

  @override
  State<noStories> createState() => _noStoriesState();
}

class _noStoriesState extends State<noStories> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Storie in evidenza',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text:
                        '\nConserva le tue storie preferite sul tuo profilo',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
                IconButton(
                    onPressed: () => {
                      setState(() {
                        isHidden = !isHidden;
                      })
                    },
                    icon: Icon(
                      isHidden
                          ? Icons.keyboard_arrow_up_outlined
                          : Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                    ))
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          Visibility(
            visible: isHidden,
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Row(
                children: [
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (build, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: index == 0
                                      ? Colors.transparent
                                      : Colors.grey,
                                  shape: BoxShape.circle,
                                  border:
                                  Border.all(color: Colors.grey, width: 2),
                                  //borderRadius: BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: index == 0
                                      ? Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )
                                      : Container(),
                                ),
                              ),
                              Text(
                                index == 0 ? 'Nuova' : ' ',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
