import 'package:flutter/material.dart';
import 'package:provider_flutter_demo/basic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Provider"),
          centerTitle: true,
        ),
        body: BasicProvider(),
      ),
    );
  }
}
