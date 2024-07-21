import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

import '../api/api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AfterLayoutMixin<Home> {
  double distance = 0;
  bool visible = false;
  void get1() async {
    try {
      String dist = await Api.get("distance");
      if (dist.contains("Error")) {
        setState(() {
          visible = true;
        });
      } else {
        distance = double.parse(dist);
        setState(() {
          visible = true;
        });
      }
    } catch (e) {
      debugPrint("Se genero un error");
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ESP32 distance"),
      ),
      body: Center(
        child: Visibility(
          visible: visible,
          replacement: const CircularProgressIndicator(
            semanticsValue: "Cargando",
          ),
          child: Builder(
            builder: (BuildContext context) {
              if (distance == 0) {
                return ListTile(
                  leading: CupertinoButton(
                      onPressed: () => get1(), child: Icon(Icons.download)),
                  title: const Text("Cargar de nuevo"),
                );
              } else {
                return ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.social_distance),
                      title: Text("Distance"),
                      subtitle: Text("$distance"),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    get1();
  }
}
