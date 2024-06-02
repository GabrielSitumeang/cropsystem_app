import 'package:flutter/material.dart';
import 'package:pa3/models/catatan_model.dart';
import 'package:pa3/pages/services/api_service.dart';

class ShowCatatan extends StatefulWidget {
  final int id;

  const ShowCatatan({required this.id, Key? key}) : super(key: key);

  @override
  _ShowCatatanState createState() => _ShowCatatanState();
}

class _ShowCatatanState extends State<ShowCatatan> {
  late Future<Catatan?> _catatan;

  @override
  void initState() {
    super.initState();
    _catatan = ApiService().getCatatan(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Catatan'),
      ),
      body: FutureBuilder<Catatan?>(
        future: _catatan,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('Catatan tidak ditemukan.'));
          } else {
            final catatan = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    catatan.judul,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Tanggal: ${catatan.tanggal}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    catatan.isi,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
