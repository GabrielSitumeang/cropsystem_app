import 'package:flutter/material.dart';
import 'package:pa3/pages/welcome_screen.dart';
import 'package:pa3/providers/ajukan_informasi_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AjukanInformasiProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Ajukan Informasi App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WelcomeScreen(), // Set the home to your AjukanInformasiPage
      ),
    );
  }
}
