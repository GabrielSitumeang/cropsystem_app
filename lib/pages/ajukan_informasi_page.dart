import 'package:flutter/material.dart';
import 'package:pa3/models/ajukan_informasi.dart';
import 'package:pa3/providers/ajukan_informasi_provider.dart';
import 'package:provider/provider.dart';

class AjukanInformasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Ajukan Informasi'),
      ),
      body: Consumer<AjukanInformasiProvider>(
        builder: (context, provider, child) {
          return FutureBuilder(
            future: provider.fetchAjukanInformasi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView.builder(
                  itemCount: provider.AjukanInformasiList.length,
                  itemBuilder: (context, index) {
                    final informasi = provider.AjukanInformasiList[index];
                    return ListTile(
                      title: Text(informasi.judul),
                      subtitle: Text(informasi.isi),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showForm(context, informasi);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              provider.deleteAjukanInformasi(informasi.id);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        _showDetails(context, informasi);
                      },
                    );
                  },
                );
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showForm(context, null);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showForm(BuildContext context, AjukanInformasi? informasi) {
    final _formKey = GlobalKey<FormState>();
    final _judulController =
        TextEditingController(text: informasi?.judul ?? '');
    final _isiController = TextEditingController(text: informasi?.isi ?? '');
    final _jenisInformasiController = TextEditingController(
        text: informasi?.jenisinformasi ??
            ''); // Tambahkan controller untuk jenis informasi

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:
              Text(informasi == null ? 'Tambah Informasi' : 'Edit Informasi'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _judulController,
                    decoration: InputDecoration(labelText: 'Judul'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul harus diisi';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _isiController,
                    decoration: InputDecoration(labelText: 'Isi'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Isi harus diisi';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller:
                        _jenisInformasiController, // Tambahkan TextFormField untuk jenis informasi
                    decoration: InputDecoration(labelText: 'Jenis Informasi'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Jenis Informasi harus diisi';
                      }
                      return null;
                    },
                  ),
                  // Tambahkan form field lainnya sesuai kebutuhan
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (informasi == null) {
                    final newInformasi = AjukanInformasi(
                      id: 0,
                      judul: _judulController.text,
                      isi: _isiController.text,
                      jenisinformasi: _jenisInformasiController.text,
                      namatanaman: '',
                      gambarTanaman: '',
                      keterangan: '', // Sertakan jenis informasi
                      // Tambahkan atribut lainnya sesuai kebutuhan
                    );
                    Provider.of<AjukanInformasiProvider>(context, listen: false)
                        .addAjukanInformasi(newInformasi);
                  } else {
                    final updatedInformasi = AjukanInformasi(
                      id: informasi.id,
                      judul: _judulController.text,
                      isi: _isiController.text,
                      jenisinformasi: _jenisInformasiController.text,
                      namatanaman: '',
                      gambarTanaman: '',
                      keterangan: '', // Sertakan jenis informasi
                      // Tambahkan atribut lainnya sesuai kebutuhan
                    );
                    Provider.of<AjukanInformasiProvider>(context, listen: false)
                        .updateAjukanInformasi(updatedInformasi);
                  }
                  Navigator.of(context).pop();
                }
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _showDetails(BuildContext context, AjukanInformasi informasi) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(informasi.judul),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama Tanaman: ${informasi.namatanaman}'),
                Text('Judul: ${informasi.judul}'),
                Text('Isi: ${informasi.isi}'),
                Text('Gambar Tanaman: ${informasi.gambarTanaman}'),
                Text('Keterangan: ${informasi.keterangan}'),
                if (informasi.jenisinformasi.toLowerCase() !=
                    'hama dan penyakit') ...[
                  // Informasi khusus selain hama dan penyakit
                ] else ...[
                  // Informasi khusus hama dan penyakit
                  if (informasi.tahapan != null)
                    Text('Tahapan: ${informasi.tahapan}'),
                  if (informasi.gejala != null)
                    Text('Gejala: ${informasi.gejala}'),
                  if (informasi.rekomendasi != null)
                    Text('Rekomendasi: ${informasi.rekomendasi}'),
                  if (informasi.penyebab != null)
                    Text('Penyebab: ${informasi.penyebab}'),
                  if (informasi.tindakanpencegahan != null)
                    Text(
                        'Tindakan Pencegahan: ${informasi.tindakanpencegahan}'),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
