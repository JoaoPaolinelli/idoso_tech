import 'package:flutter/material.dart';
import '../model/categoria.dart';
import '../model/video.dart';
import '../pages/category_content.dart';

class CategoryDetailsListWidget extends StatefulWidget {
  final Categoria categoriaClasse;
  final String categoryName;
  final IconData iconeCategory;
  final String idCategory;
  final List<Video> video;

  const CategoryDetailsListWidget({
    Key? key,
    required this.categoriaClasse,
    required this.categoryName,
    required this.iconeCategory,
    required this.idCategory,
    required this.video,
  }) : super(key: key);

  @override
  _CategoryDetailsListWidgetState createState() =>
      _CategoryDetailsListWidgetState();
}

class _CategoryDetailsListWidgetState extends State<CategoryDetailsListWidget> {
  late List<Video> videos;

  @override
  void initState() {
    super.initState();
    // 🔹 Pegando os vídeos diretamente da categoria
    videos = widget.video ?? [];

    print('📌 Vídeos da categoria: ${widget.categoriaClasse.videos}');
    print(videos);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              if (videos.isEmpty)
                const Center(
                  child: Text(
                    'Nenhum vídeo disponível',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                )
              else
                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 80), // Espaço para o botão
                  child: ListView.builder(
                    padding: const EdgeInsets.all(32),
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      final video = videos[index];

                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoryContent(
                                        categoryName: widget.categoryName,
                                        itemCurso: widget.iconeCategory,
                                        topicCategory: video.nome ?? 'Sem título',
                                        linkYoutube: video.link ?? '',
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      video.nome ?? 'Título não disponível',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.star_border,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                video.link ?? 'Sem link disponível',
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 2,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color.fromRGBO(132, 193, 243, 100),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Voltar',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
