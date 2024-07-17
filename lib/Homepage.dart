import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String myname;
  const SecondPage({super.key, required this.myname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myname),
      ),
    );
  }
}
