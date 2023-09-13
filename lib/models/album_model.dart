import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_model.g.dart';
part 'album_model.freezed.dart';

@freezed
class AlbumModel with _$AlbumModel {
  const factory AlbumModel({
    required int albumId,
    required int id,
    required String title,
    required String url,
    required String thumbnailUrl,
  }) = _AlbumModel;
  factory AlbumModel.fromJson(Map<String, Object?> json) =>
      _$AlbumModelFromJson(json);
}
