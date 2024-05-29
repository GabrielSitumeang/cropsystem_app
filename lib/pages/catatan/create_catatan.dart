import 'package:flutter/material.dart';
import 'package:pa3/models/catatan_model.dart';
import 'package:pa3/pages/services/api_service.dart';

class CreateCatatan extends StatefulWidget {
  final Catatan? catatan;

  const CreateCatatan({this.catatan});

  @override
  _CreateCatatanState createState() => _CreateCatatanState();
}

class _CreateCatatanState extends State<CreateCatatan> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _judulController;
  late TextEditingController _isiController;
  late TextEditingController _tanggalController;

  @override
  void initState() {
    super.initState();
    _judulController = TextEditingController(
        text: widget.catatan != null ? widget.catatan!.judul : '');
    _isiController = TextEditingController(
        text: widget.catatan != null ? widget.catatan!.isi : '');
    _tanggalController = TextEditingController(
        text: widget.catatan != null ? widget.catatan!.tanggal : '');
  }

  @override
  void dispose() {
    _judulController.dispose();
    _isiController.dispose();
    _tanggalController.dispose();
    super.dispose();
  }

  void _saveCatatan() {
    if (_formKey.currentState!.validate()) {
      final id = widget.catatan?.id_catatan ?? 0;
      final catatan = Catatan(
        id_catatan: id,
        judul: _judulController.text,
        isi: _isiController.text,
        tanggal: _tanggalController.text,
      );

      if (widget.catatan == null) {
        ApiService().addCatatan(catatan);
      } else {
        ApiService().updateCatatan(catatan);
      }

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catatan == null ? 'Tambah Catatan' : 'Edit Catatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _judulController,
                decoration: InputDecoration(labelText: 'Judul'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _isiController,
                decoration: InputDecoration(labelText: 'Isi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Isi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tanggalController,
                decoration: InputDecoration(labelText: 'Tanggal'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveCatatan,
                child: Text(widget.catatan == null ? 'Tambah' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
