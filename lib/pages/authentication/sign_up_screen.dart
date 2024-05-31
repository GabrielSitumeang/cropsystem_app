import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pa3/helper/firebase_auth.dart';
import 'package:pa3/pages/authentication/login_screen.dart';
import 'package:pa3/pages/nav_page.dart';
import 'package:pa3/theme.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: primaryTextStyle.copyWith(
                fontSize: 34,
                fontWeight: semiBold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 2),
            Text(
              '',
              style: subtitleTextStyle,
            ),
            SizedBox(height: 50),
            Form(
              key: _registerFormKey,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Name",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon_email.png',
                            width: 17,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              style: primaryTextStyle,
                              controller: _nameTextController,
                              decoration: InputDecoration.collapsed(
                                hintText: 'Your Name',
                                hintStyle: subtitleTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email Address",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon_email.png',
                            width: 17,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              style: primaryTextStyle,
                              controller: _emailTextController,
                              decoration: InputDecoration.collapsed(
                                hintText: 'Your Email',
                                hintStyle: subtitleTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon_password.png',
                            width: 17,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              style: primaryTextStyle,
                              controller: _passwordTextController,
                              obscureText: true,
                              decoration: InputDecoration.collapsed(
                                hintText: 'Your Password',
                                hintStyle: subtitleTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 44.0),
                  _isProcessing
                      ? CircularProgressIndicator()
                      : Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    _isProcessing = true;
                                  });

                                  if (_registerFormKey.currentState!.validate()) {
                                    User? user = await FirebaseAuthHelper.registerUsingEmailPassword(
                                      name: _nameTextController.text,
                                      email: _emailTextController.text,
                                      password: _passwordTextController.text,
                                    );

                                    setState(() {
                                      _isProcessing = false;
                                    });

                                    if (user != null) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Success'),
                                          content: Text('Akun berhasil ditambahkan!'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (context) => NavPage(),
                                                  ),
                                                  ModalRoute.withName('/'),
                                                );
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Error'),
                                          content: Text('Gagal membuat akun'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  } else {
                                    setState(() {
                                      _isProcessing = false;
                                    });
                                  }
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                  SizedBox(height: 10),
                  SizedBox(height: 12.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sudah memiliki akun? Login disini',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
