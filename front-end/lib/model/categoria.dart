class Categoria {
  final String id;
  final String nomeCategoria;
  final String idCategoria;
  final List<String>? videos;

  Categoria({
    required this.id,
    required this.nomeCategoria,
    required this.idCategoria,
    this.videos,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['id'],
      nomeCategoria: json['nome_categoria'],
      idCategoria: json['id_categoria'],
      videos: json['videos'] != null ? List<String>.from(json['videos']) : null,
    );
  }
}
