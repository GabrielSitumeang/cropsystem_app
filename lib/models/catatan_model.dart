class Catatan {
  int id_catatan;
  String judul;
  String isi;
  String tanggal;

  Catatan({required this.id_catatan, required this.judul, required this.isi, required this.tanggal});

  factory Catatan.fromJson(Map<String, dynamic> json) {
    return Catatan(
      id_catatan: json['id_catatan'],
      judul: json['judul'],
      isi: json['isi'],
      tanggal: json['tanggal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_catatan': id_catatan,
      'judul': judul,
      'isi': isi,
      'tanggal': tanggal,
    };
  }
}
