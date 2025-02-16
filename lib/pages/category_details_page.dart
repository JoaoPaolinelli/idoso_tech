import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/category_content_list_widget.dart';

class CategoryDetailsPage extends StatelessWidget {
  // final Object categoryName;
  final String categoriaNome;
  final IconData iconeCategoria;

  const CategoryDetailsPage(
      {Key? key, required this.categoriaNome, required this.iconeCategoria})
      : super(key: key);

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
                      // alignment: Alignment.center,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.arrow_back)),
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
                              )),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, bottom: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      categoriaNome,
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
                      )),
                ),
              ),
              Positioned(
                bottom: -23,

                left: 16,
                //  MediaQuery.of(context).size.width / 2 - 80,
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
          SizedBox(
            height: 45,
          ),
          // Text('Teste do Joao'),

          CategoryDetailsListWidget(
            categoryName: categoriaNome,
            iconeCategory: iconeCategoria,
          ),
        ],
      ),
    );
  }
}
