import 'package:dio/dio.dart';
import 'package:idosotech/model/categoria.dart';

class ApiService {
  final Dio dio = Dio();
  final String apiUrl = "http://localhost:8080/categoria/listar";

  Future<List<Categoria>> fetchCategorias() async {
    try {
      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Categoria> categorias = data.map((item) => Categoria.fromJson(item)).toList();

        print("📌 Categorias recebidas: $categorias"); // Debug
        return categorias;
      } else {
        throw Exception('Erro ao carregar categorias: ${response.statusCode}');
      }
    } catch (e) {
      print('⚠ Erro ao buscar categorias: $e');
      return [];
    }
  }
}
