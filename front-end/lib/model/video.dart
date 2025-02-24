class Video {
  String nome;
  String link;

  Video({required this.nome, required this.link});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      nome: json['Nome'], // "Nome" no JSON tem "N" maiúsculo
      link: json['Link'], // "Link" no JSON tem "L" maiúsculo
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Nome': nome,
      'Link': link,
    };
  }

  String getLink() {
    return this.link;
  }

  String getNome() {
    return this.nome;
  }

}
