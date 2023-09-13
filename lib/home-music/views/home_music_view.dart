import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ldfjgjkdh/home-music/components/list_item.dart';
import 'package:ldfjgjkdh/state/album_bloc.dart';

class HomeMusicView extends StatelessWidget {
  const HomeMusicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Günaydın'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_alert),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.timer),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          GridView.builder(
            itemCount: 6,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: MediaQuery.of(context).size.width / 80,
            ),
            itemBuilder: (context, index) {
              return BlocProvider(
                create: (context) => AlbumBloc(),
                child: ListItem(
                  index: index,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
