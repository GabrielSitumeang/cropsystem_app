import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TahapanPage extends StatefulWidget {
  final String? namaTanaman;

  const TahapanPage({Key? key, this.namaTanaman}) : super(key: key);

  @override
  _TahapanPageState createState() => _TahapanPageState();
}

class _TahapanPageState extends State<TahapanPage> {
  late Future<List<dynamic>> _futureTahapan;

  @override
  void initState() {
    super.initState();
    _futureTahapan = _fetchTahapan();
  }

  Future<List<dynamic>> _fetchTahapan() async {
    final String baseUrl =
        'https://cropsystem.cloud/api/hama?nama_tanaman=${widget.namaTanaman}';
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Gagal mengambil data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Gagal mengambil data: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.namaTanaman ??
            'Hama dan Penyakit'), // Menggunakan widget.namaTanaman sebagai judul AppBar
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder<List<dynamic>>(
          future: _futureTahapan,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Card(
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              'https://cropsystem.cloud/gambar_tanaman/${snapshot.data?[index]['gambar_tanaman']}',
                              width: 550,
                              height: 120,
                            ),
                            ListTile(
                              title: Text(
                                '${snapshot.data?[index]['keterangan']}',
                              ),
                            ),
                            ListTile(
                              title: Text(
                                '${snapshot.data?[index]['judul']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPupukPage(
                                      data: snapshot.data?[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class DetailPupukPage extends StatelessWidget {
  final dynamic data;

  const DetailPupukPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${data['tahapanPupuk']}'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 400, // Lebar card
          height: 320,
          padding: EdgeInsets.all(16),
          child: Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    '${data['keterangan']}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Image.network(
                  'https://cropsystem.cloud/gambar_tanaman/${data['gambar_tanaman']}',
                  width: 500,
                  height: 100,
                ),
                ListTile(
                  title: Text('${data['judul']}'),
                ),
                ListTile(
                  title: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullDetailPupukPage(data: data),
                        ),
                      );
                    },
                    child: Text(
                      'Baca lebih lanjut',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FullDetailPupukPage extends StatelessWidget {
  final dynamic data;

  const FullDetailPupukPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${data['judul']}',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://cropsystem.cloud/gambar_tanaman/${data['gambar_tanaman']}',
              width: 500,
              height: 100,
            ),
            SizedBox(height: 10),
            Text('${data['isi']}'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement bagikan functionality
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green, // Text color
                    ),
                    child: Text('Bagikan'),
                  ),
                ),
                SizedBox(width: 10), // Spacer antara tombol
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate back to previous page
                      Navigator.pop(context);
                    },
                    child: Text('Mengerti'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
