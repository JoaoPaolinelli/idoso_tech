import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/categoria.dart';
import '../model/video.dart';
import '../pages/category_content.dart';

class CategoryDetailsListWidget extends StatefulWidget {
  final Categoria categoriaClasse;


  const CategoryDetailsListWidget({
    Key? key,
    required this.categoriaClasse,
  }) : super(key: key);

  @override
  _CategoryDetailsListWidgetState createState() =>
      _CategoryDetailsListWidgetState();
}

class _CategoryDetailsListWidgetState extends State<CategoryDetailsListWidget> {
  late List<Video> _videos;
  List<bool> isFavoritedList = []; // Lista para armazenar favoritos

  bool isFavorited = false;

  late  Video videoRender;

  @override
  void initState() {
    super.initState();
    _loadVideos(); // Carrega os vídeos ao iniciar a tela
    // 🔹 Pegando os vídeos diretamente da categoria
    isFavoritedList = List.generate(_videos.length, (index) => false); // Inicializa como falso para todos
    print('📌 Vídeos da categoria: ${widget.categoriaClasse.videos}');

    // videoList.add(widget.categoriaClasse.videos.map( (data) =>"${data.nome},  ${data.link}"));

  }

  void _loadVideos() {
      setState(() {
        _videos = widget.categoriaClasse.videos;
      });
      print("\n\n\n\n\n\n\n\\n\n");
      print("Caaaaaarregou ?");
      for(var video in _videos) {
        print("Nome: ${video.nome}, \nLink: ${video.link}");
      }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              if (_videos.isEmpty)
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
                    itemCount: widget.categoriaClasse.videos.length,
                    itemBuilder: (context, index) {
                      final video = widget.categoriaClasse.videos;
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
                                        categoriaClasse: widget.categoriaClasse,
                                        videos: _videos[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.bookmark_add),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Text(
                                      _videos[index].nome ?? 'Título não disponível',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(onPressed: () {
                                      setState(() {
                                        isFavorited = !isFavorited;
                                        isFavoritedList[index] = !isFavoritedList[index]; // Alterna o estado do item específico
                                      });
                                    },
                                    icon:
                                    Icon(
                                      isFavoritedList[index] ? Icons.star : Icons.star_border, // Ícone alternável
                                      color: isFavoritedList[index] ? Colors.amber : Colors.black54, // Cor alternável
                                    ),),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Text(
                              //   // _videos[index].isAssistido == "false"? 'ja foi assistido' : 'Nao foi assistido',
                              //   _videos[index].link ?? 'Sem link disponível',
                              //   style: const TextStyle(color: Colors.grey),
                              // ),
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
      );
  }
}
