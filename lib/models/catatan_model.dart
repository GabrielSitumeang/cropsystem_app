class Catatan {
  int id;
  String judul;
  String isi;
  String tanggal;

  Catatan({
    required this.id,
    required this.judul,
    required this.isi,
    required this.tanggal,
  });

  factory Catatan.fromJson(Map<String, dynamic> json) {
    return Catatan(
      id: json['id'],
      judul: json['judul'],
      isi: json['isi'],
      tanggal: json['tanggal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'isi': isi,
      'tanggal': tanggal,
    };
  }
}
