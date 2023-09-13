import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/album_bloc.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      builder: (context, state) {
        if (state is AlbumSuccess) {
          return Container(
            color: Colors.grey,
            height: 20,
            child: Row(
              children: [
                Image.network(
                  state.albumModels[index].thumbnailUrl,
                  width: 80,
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(state.albumModels[index].id.toString()),
                ),
              ],
            ),
          );
        }

        return SizedBox();
      },
    );
  }
}
