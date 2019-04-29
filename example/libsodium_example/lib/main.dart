import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:libsodium/libsodium.dart';

void main() {
  sodiumInit();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController(text: 'Hello libsodium');
  final _sha512 = Sha512();
  String sha512 = '';

  @override
  void initState() {
    super.initState();
    sha512 = _sha512.convert(utf8.encode(controller.text)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: controller,
            onChanged: (value) {
              setState(() {
                sha512 = _sha512.convert(utf8.encode(value)).toString();
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text('SHA512 value of \'${controller.text}\' is'),
          ),
          Text(sha512),
        ],
      ),
    );
  }
}
