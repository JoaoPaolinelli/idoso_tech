import 'package:idosotech/model/video.dart';

class Categoria {
  String id;
  String nomeCategoria;
  String idCategoria;
  List<Video> videos;

  Categoria({required this.id, required this.nomeCategoria, required this.idCategoria, required this.videos});

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['id'],
      nomeCategoria: json['nomeCategoria'],
      idCategoria: json['idCategoria'],
      videos: (json['videos'] as List<dynamic>) // Converte a lista de vídeos
          .map((videoJson) => Video.fromJson(videoJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomeCategoria': nomeCategoria,
      'idCategoria': idCategoria,
      'videos': videos.map((video) => video.toJson()).toList(),
    };
  }
}
