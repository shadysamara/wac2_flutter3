import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wac2_flutter/navigation/page2.dart';

class Page1 extends StatelessWidget {
  static final String routeName = 'screen1';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Alert'),
                content: Text('you will close the app, are you sure?'),
                actions: [
                  ElevatedButton(
                    child: Text('Yes'),
                    onPressed: () {
                      exit(0);
                    },
                  ),
                  ElevatedButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      },
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('O'),
                  ),
                  accountName: Text('omar'),
                  accountEmail: Text('omar@gmail.com')),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                title: Text('Home'),
                subtitle: Text('Go to home'),
                leading: Icon(Icons.home),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                title: Text('Favourite'),
                subtitle: Text('Go to favourite'),
                leading: Icon(Icons.favorite),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {},
                title: Text('Profile'),
                subtitle: Text('Go to profile'),
                leading: Icon(Icons.perm_identity),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
        appBar: AppBar(title: Text('page1')),
        body: Center(
          child: ElevatedButton(
            child: Text('page1'),
            onPressed: () async {
              var data = await Navigator.of(context)
                  .pushNamed('omar', arguments: 'test arguemnts');
              print(data);
            },
          ),
        ),
      ),
    );
  }
}
