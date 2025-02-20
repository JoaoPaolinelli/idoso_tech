import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/categoria.dart';
import '../model/video.dart';
import '../widgets/category_content_list_widget.dart';

class CategoryDetailsPage extends StatefulWidget {
  final Categoria categoriaClasse;
  final String categoriaNome;
  final IconData iconeCategoria;
  final List<Video> video;


  const CategoryDetailsPage({
    Key? key,
    required this.categoriaClasse,
    required this.categoriaNome,
    required this.iconeCategoria,
    required this.video
  }) : super(key: key);

  @override
  _CategoryDetailsPageState createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  List<dynamic> videos = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {

    print('\n\n\n\n\n\n\n\n\n');

    print(widget.categoriaClasse.id);
    print(widget.categoriaClasse.idCategoria);
    print(widget.categoriaClasse.nomeCategoria);
    print(widget.categoriaClasse.videos.map((video) => "\n,nome: ${video.nome},\n, link: ${video.link}").join("\n"));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(132, 193, 243, 100),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Material(
                elevation: 4,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    height: 202,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                          FontAwesomeIcons.searchengin)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(FontAwesomeIcons.bell)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(FontAwesomeIcons.heart)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 30, bottom: 20),
                              child: Row(
                                children: [
                                  Text(
                                    widget.categoriaNome,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -23,
                left: 16,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 8,
                  ),
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 24,
                  ),
                  label: Text(
                    'Continuar',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 45),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : hasError
                ? Center(
              child: Text(
                'Erro ao carregar vídeos',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            )
                : CategoryDetailsListWidget(

              categoryName: widget.categoriaNome,
              iconeCategory: widget.iconeCategoria,
              video:  widget.video,
              idCategory: "0", categoriaClasse: widget.categoriaClasse //assando os vídeos para o widget
            ),
          ),
        ],
      ),
    );
  }
}
