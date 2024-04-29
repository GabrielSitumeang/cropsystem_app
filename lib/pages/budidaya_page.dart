import 'package:flutter/material.dart';
import 'package:pa3/pages/budidaya/irigasi_page.dart';
import 'package:pa3/pages/budidaya/panen_pasca_page.dart';
import 'package:pa3/pages/budidaya/pemantauan_page.dart';
import 'package:pa3/pages/budidaya/penanaman_page.dart';
import 'package:pa3/pages/budidaya/persiapan_page.dart';
import 'package:pa3/pages/budidaya/rotasi_tanaman_page.dart';
import 'package:pa3/pages/pupuk/pupuk_page.dart';
import 'package:pa3/theme.dart';

class BudidayaPage extends StatelessWidget {
  final String? namaTanaman;

  const BudidayaPage({Key? key, this.namaTanaman}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      appBar: AppBar(
        backgroundColor: backgroundWhite,
        title: Text(
          'Budidaya Tanaman',
          style: primaryTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15),
        child: InformasiList(namaTanaman: namaTanaman),
      ),
    );
  }
}

class InformasiList extends StatelessWidget {
  final String? namaTanaman;

  const InformasiList({Key? key, this.namaTanaman}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lihat informasi relevan tentang',
            style: subtitleTextStyle.copyWith(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Pilih Tanaman',
            style: subtitleTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                _buildListTile(
                  context,
                  title: 'Rotasi Tanaman',
                  page: RotasiTanamanPage(
                    namaTanaman: namaTanaman ?? '',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                _buildListTile(
                  context,
                  title: 'Pemantauan',
                  page: PemantauanPage(
                    namaTanaman: namaTanaman ?? '',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                _buildListTile(
                  context,
                  title: 'Persiapan Lahan',
                  page: PersiapanPage(
                    namaTanaman: namaTanaman ?? '',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                _buildListTile(
                  context,
                  title: 'Penanaman',
                  page: PenanamanPage(namaTanaman: namaTanaman ?? ''),
                ),
                SizedBox(
                  height: 5,
                ),
                _buildListTile(
                  context,
                  title: 'Pemupukan',
                  page: PupukPage(),
                ),
                SizedBox(
                  height: 5,
                ),
                _buildListTile(
                  context,
                  title: 'Irigasi',
                  page: IrigasiPage(
                    namaTanaman: namaTanaman ?? '',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                _buildListTile(
                  context,
                  title: 'Panen dan Pasca Panen',
                  page: PanenPascaPage(namaTanaman: namaTanaman ?? ''),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile _buildListTile(BuildContext context,
      {required String title, required Widget page}) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_right),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
