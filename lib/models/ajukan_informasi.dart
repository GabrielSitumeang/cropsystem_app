class AjukanInformasi {
  final int id;
  final String namatanaman;
  final String judul;
  final String isi;
  final String gambarTanaman;
  final String keterangan;
  final String jenisinformasi;
  final String? tahapan;
  final String? gejala;
  final String? rekomendasi;
  final String? penyebab;
  final String? tindakanpencegahan;

  AjukanInformasi({
    required this.id,
    required this.namatanaman,
    required this.judul,
    required this.isi,
    required this.gambarTanaman,
    required this.keterangan,
    required this.jenisinformasi,
    this.tahapan,
    this.gejala,
    this.rekomendasi,
    this.penyebab,
    this.tindakanpencegahan,
  });

  factory AjukanInformasi.fromJson(Map<String, dynamic> json) {
    return AjukanInformasi(
      id: json['id'],
      namatanaman: json['namatanaman'],
      judul: json['judul'],
      isi: json['isi'],
      gambarTanaman: json['gambar_tanaman'],
      keterangan: json['keterangan'],
      jenisinformasi: json['jenisinformasi'],
      tahapan: json['tahapan'],
      gejala: json['gejala'],
      rekomendasi: json['rekomendasi'],
      penyebab: json['penyebab'],
      tindakanpencegahan: json['tindakanpencegahan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'namatanaman': namatanaman,
      'judul': judul,
      'isi': isi,
      'gambar_tanaman': gambarTanaman,
      'keterangan': keterangan,
      'jenisinformasi': jenisinformasi,
      'tahapan': tahapan,
      'gejala': gejala,
      'rekomendasi': rekomendasi,
      'penyebab': penyebab,
      'tindakanpencegahan': tindakanpencegahan,
    };
  }
}
