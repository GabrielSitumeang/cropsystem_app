import 'package:flutter/material.dart';
import 'package:pa3/theme.dart';
import 'package:pa3/models/catatan_model.dart';
import 'package:pa3/pages/services/api_service.dart';
import 'package:pa3/pages/catatan/create_catatan.dart'; 

class IndexCatatan extends StatefulWidget {
  const IndexCatatan({super.key});

  @override
  _IndexCatatanState createState() => _IndexCatatanState();
}

class _IndexCatatanState extends State<IndexCatatan> {
  late Future<List<Catatan>> _catatanList;

  @override
  void initState() {
    super.initState();
    _catatanList = ApiService().fetchCatatan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      appBar: AppBar(
        backgroundColor: backgroundWhite,
        title: Text(
          'Catatan',
          style: primaryTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<List<Catatan>>(
        future: _catatanList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada catatan.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final catatan = snapshot.data![index];
                return ListTile(
                  title: Text(catatan.judul),
                  subtitle: Text(catatan.isi),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        ApiService().deleteCatatan(catatan.id);
                        _catatanList = ApiService().fetchCatatan();
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateCatatan(catatan: catatan),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateCatatan()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
