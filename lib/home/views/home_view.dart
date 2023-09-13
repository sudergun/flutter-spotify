import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ldfjgjkdh/home-music/views/home_music_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: IndexedStack(
        children: [
          HomeMusicView(),
          Text('Arama'),
          Text('Kitaplık'),
        ],
        index: index,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'AnaSayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Arama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Kitaplık',
          ),
        ],
      ),
    ));
  }
}
