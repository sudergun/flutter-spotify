part of 'album_bloc.dart';

@immutable
abstract class AlbumEvent {
  const AlbumEvent();
}

class GetAlbums extends AlbumEvent {}

class FinishAlbum extends AlbumEvent {
  final List<AlbumModel>? albumModels;
  final String? error;

  const FinishAlbum({
    this.albumModels,
    this.error,
  });
}
