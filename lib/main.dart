import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterChat());
}

class FlutterChat extends StatelessWidget {
  const FlutterChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Temp Chat',
      home: Scaffold(
        body: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
