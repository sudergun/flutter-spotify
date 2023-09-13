part of 'album_bloc.dart';

@immutable
abstract class AlbumState {
  const AlbumState();
}

class AlbumInitial extends AlbumState {}

class AlbumInProgress extends AlbumState {}

class AlbumSuccess extends AlbumState {
  final List<AlbumModel> albumModels;

  const AlbumSuccess({required this.albumModels});
}

class AlbumError extends AlbumState {
  final String error;

  const AlbumError({required this.error});
}
