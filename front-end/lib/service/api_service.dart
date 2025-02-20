import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:idosotech/model/categoria.dart';

class ApiService {
  final Dio dio = Dio();
  final String apiUrl = "http://localhost:8080/categoria/listar";

  Future<List<Categoria>> fetchCategorias() async {
    try {
      final response = await dio.get(apiUrl);
      print("MUNDAOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
      if (response.statusCode == 200) {
        print("MUNDAOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
        List<dynamic> jsonList = response.data; // Já vem como lista de Map
        return jsonList.map((json) => Categoria.fromJson(json)).toList();
       // List<String> jsonList = jsonDecode(response.data);
        // print("📌 Categorias recebidas: $categorias"); // Debug
        print("HEY API");
        for (String x in jsonList) {
          print(x);
        }
        return response.data;
        // List<Categoria> categorias = data.map((item) => Categoria.fromJson(item)).toList();
        // return jsonList.map((json) => Categoria.fromJson(json)).toList();
        // return categorias;
      } else {
        throw Exception('Erro ao carregar categorias: ${response.statusCode}');
      }
    } catch (e) {
      print('⚠ Erro ao buscar categorias: $e');
      return [];
    }
  }
}
