import 'package:flutter/material.dart';
import 'package:pa3/theme.dart';

class KomunitasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      appBar: AppBar(
        backgroundColor: backgroundWhite,
        title: Text(
          'Komunitas',
          style: primaryTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15),
      ),
    );
  }
}
