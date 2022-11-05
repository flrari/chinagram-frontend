
import 'package:chinagram/bloc/post/post_list_bloc/post_list_bloc.dart';
import 'package:chinagram/network/api.dart';
import 'package:chinagram/screens/search_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/feed_layout.dart';
import '../screens/profile_layout.dart';
import '../screens/reels_layout.dart';
import '../screens/shop_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late int _currentIndex;
  ApiCalls apiCalls = ApiCalls();

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  void changePage(int newIndex){
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              switch (_currentIndex) {
                case 0:
                  return BlocProvider<PostListBloc>(create: (context) => PostListBloc(apiCalls: apiCalls),
                    child: FeedLayout(),);
                case 1:
                  return SearchLayout();
                case 2:
                  return ReelsLayout();
                case 3:
                  return ShopLayout();
                case 4:
                  return ProfileLayout();
                default:
                  return Container();
              }
            }
        ),
        //LayoutBuilder
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            iconSize: 29,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            backgroundColor: Colors.transparent,
            onTap: changePage,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(_currentIndex == 1 ? Icons.search : Icons.search_outlined),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(_currentIndex == 2 ? Icons.movie : Icons.movie_outlined),
                  label: 'Reels'),
              BottomNavigationBarItem(
                  icon: Icon(_currentIndex == 3 ? Icons.shopping_bag : Icons.shopping_bag_outlined),
                  label: 'Shop'),
              BottomNavigationBarItem(
                  icon: Icon(_currentIndex == 4 ? Icons.person : Icons.person_outline_rounded),
                  label: 'Profile'),
            ]),
      ),
    );
  }
}