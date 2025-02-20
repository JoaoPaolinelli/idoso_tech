import 'package:flutter/material.dart';
import '../model/categoria.dart';
import '../service/api_service.dart';

class TestePage extends StatefulWidget {
  const TestePage({super.key});

  @override
  State<TestePage> createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  late Future<List<Categoria>> categorias;

  @override
  void initState() {
    super.initState();
    categorias = ApiService().fetchCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: FutureBuilder<List<Categoria>>(
        future: categorias,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro ao carregar categorias: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Nenhuma categoria encontrada."));
          }

          List<Categoria> categoriasData = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: categoriasData.length,
            itemBuilder: (context, index) {
              final categoria = categoriasData[index];

              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "📂 Categoria: ${categoria.nomeCategoria}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text("🆔 ID: ${categoria.idCategoria}",
                          style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                      const SizedBox(height: 8),
                      Text("🎬 Vídeos: ${categoria.videos.length}",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 6),

                      if (categoria.videos.isEmpty)
                        Text("Nenhum vídeo disponível.",
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]))
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: categoria.videos.map((video) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                children: [
                                  const Icon(Icons.play_circle_fill, size: 18, color: Colors.blue),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      "🎬 ${video.nome} - 🔗 ${video.link}",
                                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
