import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../models/album_model.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumInitial()) {
    on<GetAlbums>(onGetAlbums);
    on<FinishAlbum>(onFinishAlbum);

    getAlbums();
  }

  void getAlbums() async {
    try {
      add(GetAlbums());

      Uri url = Uri.https("jsonplaceholder.typicode.com", "photos");
      var http = Client();

      var response = await http.get(url);

      var json = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      List<AlbumModel> albumModels =
          json.map((model) => AlbumModel.fromJson(model)).toList();

      add(FinishAlbum(albumModels: albumModels));
    } catch (e) {
      add(FinishAlbum(error: e.toString()));
    }
  }

  void onGetAlbums(GetAlbums event, Emitter<AlbumState> emit) {
    emit(AlbumInProgress());
  }

  void onFinishAlbum(FinishAlbum event, Emitter<AlbumState> emit) {
    if (event.albumModels != null) {
      emit(AlbumSuccess(albumModels: event.albumModels!));
    } else {
      emit(AlbumError(error: event.error!));
    }
  }
}
