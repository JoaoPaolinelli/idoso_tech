import 'package:flutter/material.dart';
import 'package:idosotech/widgets/category_details_header_widget.dart';

class CategoryContent extends StatelessWidget {
  final String categoryName;
  final IconData itemCurso;
  final String topicCategory;
  final String linkYoutube;

  // const ContentCategory(required String categoryName,  IconData itemCurso, {super.key});

  const CategoryContent(
      {Key? key,
      required this.categoryName,
      required this.itemCurso,
      required this.topicCategory,
      required this.linkYoutube})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CategoryDetailsHeaderWidget(
            categoryName: categoryName,
            itemCurso: itemCurso,
            topicCategory: topicCategory,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Introducao',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 300,
            height: 350,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.play_arrow,
              size: 50,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Classifique essa aula',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star_border, size: 30),
                        const Icon(Icons.star_border, size: 30),
                        const Icon(Icons.star_border, size: 30),
                        const Icon(Icons.star_border, size: 30),
                        const Icon(Icons.star_border, size: 30),
                      ],
                    )
                  ],
                ),
                Divider(
                  color: Colors.black, // Cor da linha
                  thickness: 1, // Espessura da linha
                  indent: 10, // Recuo no início
                  endIndent: 10, // Recuo no final
                ),
                const SizedBox(height: 10),
                const Text(
                  'Ficou alguma dúvida? Clique aqui',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 30,
          ),

          // Botões "Sair" e "Próximo"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context); // Voltar para a tela anterior
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(132, 193, 243, 100),
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context); // Voltar para a tela anterior
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(132, 193, 243, 100),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Proximo',
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
