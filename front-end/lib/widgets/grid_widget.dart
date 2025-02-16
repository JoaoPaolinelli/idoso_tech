import 'package:flutter/material.dart';
import 'package:idosotech/model/categoria.dart';
import 'package:idosotech/service/api_service.dart';

import '../pages/category_details_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Certifique-se de importar

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData getIconFromCategoryName(String categoryName) {
  switch (categoryName) {
    case 'Whatsapp':
      return FontAwesomeIcons.whatsapp;
    case 'Instagram':
      return FontAwesomeIcons.instagram;
    case 'Facebook':
      return FontAwesomeIcons.facebook;
    case 'Youtube':
      return FontAwesomeIcons.youtube;
    case 'Galeria':
      return FontAwesomeIcons.photoFilm;
    case 'Contatos':
      return FontAwesomeIcons.phone;
    default:
      return FontAwesomeIcons
          .questionCircle; // ícone default caso o nome não seja encontrado
  }
}

class GridWidget extends StatefulWidget {
  const GridWidget({super.key});

  @override
  _GridWidgetState createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  late Future<List<Categoria>> categorias;

  @override
  void initState() {
    super.initState();
    categorias = ApiService().fetchCategorias(); // Consumindo a API
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Categorias disponíveis',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ],
                  )),
              Expanded(
                child: FutureBuilder<List<Categoria>>(
                  future: categorias,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erro: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                          child: Text('Nenhuma categoria encontrada.'));
                    }

                    List<Categoria> categoriasData = snapshot.data!;

                    return GridView.builder(
                      padding: EdgeInsets.only(
                          left: 32, right: 32, top: 10, bottom: 32),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemCount: categoriasData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryDetailsPage(
                                  categoriaNome:
                                      categoriasData[index].nomeCategoria,
                                  iconeCategoria: getIconFromCategoryName(
                                      categoriasData[index].nomeCategoria),
                                ),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 24),
                                  Icon(
                                    getIconFromCategoryName(
                                        categoriasData[index].nomeCategoria),
                                    size: 40,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(height: 48),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        categoriasData[index].nomeCategoria,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Spacer(),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 20,
                                          color: Colors.black54,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
