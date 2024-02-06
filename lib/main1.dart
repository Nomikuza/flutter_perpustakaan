import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Bottom Nav Bar'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'Home',
            style: TextStyle(fontSize: 60),
          ),
        ),
      );
}
