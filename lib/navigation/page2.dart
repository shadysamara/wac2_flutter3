import 'dart:io';

import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  static final String routeName = 'screen2';
  String name;
  Page2(this.name);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, 'data from pop');
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(title: Text(name)),
        body: Center(
          child: ElevatedButton(
            child: Text('page2'),
            onPressed: () {
              exit(0);
              // Navigator.pop(context, 'data from pop');
            },
          ),
        ),
      ),
    );
  }
}
