import 'package:idosotech/model/video.dart';

class Categoria {
  final String id;
  final String nomeCategoria;
  final String idCategoria;
  final List<Video> videos; // ✅ Agora é uma lista de objetos Video

  Categoria({
    required this.id,
    required this.nomeCategoria,
    required this.idCategoria,
    required this.videos,
  });

  // 🔹 Método para converter JSON em um objeto Categoria
  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['id'] ?? '',
      nomeCategoria: json['nome_categoria'] ?? '',
      idCategoria: json['id_categoria'] ?? '',
      videos: (json['videos'] as List<dynamic>).map((video) => Video.fromJson(video)).toList(),
    );
  }

  // 🔹 Método para converter um objeto Categoria para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome_categoria': nomeCategoria,
      'id_categoria': idCategoria,
      'videos': videos.map((video) => video.toJson()).toList(),
    };
  }
}
