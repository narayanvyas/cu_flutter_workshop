// To create stateless page, Type - stl
// To create stateful page, Type - stf

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
