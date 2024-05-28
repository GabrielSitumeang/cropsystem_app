import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pa3/models/ajukan_informasi.dart';

class AjukanProvider with ChangeNotifier {
  final String _baseUrl = 'http://192.168.25.158:8000/api/ajukaninformasi';

  List<AjukanInformasi> _information = [];

  List<AjukanInformasi> get information => _information;

  Future<void> fetchInformation() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _information =
          data.map((item) => AjukanInformasi.fromJson(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load information');
    }
  }

  Future<void> addInformation(AjukanInformasi info) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(info.toJson()),
    );

    if (response.statusCode == 201) {
      fetchInformation();
    } else {
      throw Exception('Failed to add information');
    }
  }

  Future<void> updateInformation(AjukanInformasi info) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/${info.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(info.toJson()),
    );

    if (response.statusCode == 200) {
      fetchInformation();
    } else {
      throw Exception('Failed to update information');
    }
  }

  Future<void> deleteInformation(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode == 200) {
      fetchInformation();
    } else {
      throw Exception('Failed to delete information');
    }
  }
}
