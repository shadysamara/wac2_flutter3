import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  static final String routeName = 'screen3';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(title: Text('page3')),
      body: Center(
        child: ElevatedButton(
          child: Text('page3'),
          onPressed: () {},
        ),
      ),
    );
  }
}
