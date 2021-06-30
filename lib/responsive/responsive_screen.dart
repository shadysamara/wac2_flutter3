import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:easy_localization/easy_localization.dart';

class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.setLocale(context.locale == Locale('en')
                    ? Locale('ar')
                    : Locale('en'));
              },
              icon: Icon(Icons.language))
        ],
        title: Text('name'.tr()),
      ),
      body: Column(
        children: [
          Text('name'.tr()),
          Text('address'.tr()),
          Text('course'.tr()),
        ],
      ),
    );
  }
}

class PhoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('phone'),
      ),
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
      )),
      body: Container(
        color: Colors.redAccent,
      ),
    );
  }
}

class TabletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Tablet'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
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
          Expanded(
            flex: 2,
            child: Container(color: Colors.redAccent),
          )
        ],
      ),
    );
  }
}
