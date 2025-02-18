import 'package:dio/dio.dart';
import 'package:idosotech/model/categoria.dart';

class ApiService {
  final Dio dio = Dio();
  final String apiUrl =
      "http://localhost:8080/categoria/listar"; // Use 10.0.2.2 para emuladores Android

  Future<List<Categoria>> fetchCategorias() async {
    try {
      final response = await dio.get(apiUrl);

      // Verifica se a resposta foi bem-sucedida (status code 200)
      if (response.statusCode == 200) {
        print(
            "Resposta: ${response.data}"); // Imprime o corpo da resposta (JSON)
        List<dynamic> data = response.data;
        return data.map((item) => Categoria.fromJson(item)).toList();
      } else {
        // Caso a resposta não seja 200 OK, imprime o código de status
        print('Erro: ${response.statusCode}');
        throw Exception('Falha ao carregar categorias');
      }
    } catch (e) {
      // Captura e imprime qualquer erro que ocorrer durante a requisição
      print('Erro ao fazer requisição: $e');
      rethrow;
    }
  }
}
