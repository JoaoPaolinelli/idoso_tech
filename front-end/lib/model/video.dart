class Video {
  final String nome;
  final String link;

  Video({required this.nome, required this.link});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      nome: json['Nome'] ?? 'Sem nome',
      link: json['Link'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Nome': nome,
      'Link': link,
    };
  }
}
