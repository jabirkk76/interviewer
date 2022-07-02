import 'package:flutter/material.dart';

import 'package:interview/views/home_view.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homescreen(),
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}
