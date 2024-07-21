import 'package:flutter/material.dart';
import 'package:temphumidity/screens/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ESP32 temperature and humidity",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.blueGrey,
          useMaterial3: true),
      home: const Home(),
    );
  }
}
