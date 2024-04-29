import 'package:flutter/material.dart';
import 'package:pa3/theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      appBar: AppBar(
        backgroundColor: backgroundWhite,
        title: Text(
          'Profile',
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
