import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pa3/models/catatan_model.dart';

class ApiService {
  final String apiUrl = "http://192.168.254.26:8000/catatan";

  Future<List<Catatan>> fetchCatatan() async {
    var result = await http.get(Uri.parse(apiUrl));
    List<dynamic> data = json.decode(result.body);
    return data.map((json) => Catatan.fromJson(json)).toList();
  }

  Future<Catatan?> getCatatan(int id) async {
    // Implementasikan panggilan API untuk mengambil catatan berdasarkan idCatatan.
    // Misalnya menggunakan http package untuk melakukan GET request.
    final response = await http.get(Uri.parse('https://api.example.com/catatan/$id'));

    if (response.statusCode == 200) {
      return Catatan.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load catatan');
    }
  }

  Future<void> addCatatan(Catatan catatan) async {
    await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(catatan.toJson()),
    );
  }

  Future<void> updateCatatan(Catatan catatan) async {
    await http.put(
      Uri.parse("$apiUrl/${catatan.id}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(catatan.toJson()),
    );
  }

  Future<void> deleteCatatan(int id) async {
    await http.delete(Uri.parse("$apiUrl/$id"));
  }
}
