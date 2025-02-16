import 'package:flutter/material.dart';
import '../pages/category_content.dart';

class CategoryDetailsListWidget extends StatelessWidget {
  // const ContentListPage(String categoryName, {Key? key}) : super(key: key);
  final String categoryName;
  final IconData iconeCategory;

  const CategoryDetailsListWidget({
    Key? key,
    required this.categoryName,
    required this.iconeCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      '01 - Introdução',
      '02 - Enviar imagens',
      '03 - Enviar áudio',
      '04 - Enviar documentos',
      '05 - Enviar mensagens',
      '06 - Compartilhar Post',
      '07 - Compartilhar Storys',
      '08 - Fazer Storys',
      '09 - Fazer Posts',
    ];

    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Stack(
            children: [
              // Lista de itens
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 80), // Espaço para o botão fixo
                child: ListView.builder(
                  padding: const EdgeInsets.all(32),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color.fromARGB(255, 255, 253, 253),
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
                            // Título
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryContent(
                                      categoryName: categoryName,
                                      itemCurso: iconeCategory,
                                      topicCategory: items[index],
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    items[index],
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
                            // Progresso e descrição
                            const Text(
                              '5/5 Completo',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            // Linha de progresso
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
              // Botão fixo no final
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(16),
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
            ],
          ),
        ),
      ),
    );
  }
}
