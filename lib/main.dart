import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:wac2_flutter/data.dart';
import 'package:wac2_flutter/local_storage/local_storage_test.dart';
import 'package:wac2_flutter/local_storage/sp_helper.dart';
import 'package:wac2_flutter/local_storage/splach_screen.dart';
import 'package:wac2_flutter/navigation/page1.dart';
import 'package:wac2_flutter/navigation/page2.dart';
import 'package:wac2_flutter/navigation/page3.dart';
import 'package:wac2_flutter/product_widget.dart';
import 'package:wac2_flutter/responsive/responsive_screen.dart';
import 'package:wac2_flutter/todoApp/main_page.dart';

import 'forms/form_example.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Sphelper.sphelper.initSharedPrefrences();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/langs', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );

  // runApp(ScreenUtilInit(
  //     designSize: Size(393, 835),
  //     builder: () => LocalizedApp(
  //           child: MaterialApp(
  //               localizationsDelegates:
  //                   translator.delegates, // Android + iOS Delegates
  //               locale: translator.locale, // Active locale
  //               supportedLocales: translator.locals(),
  //               home: ResponsiveScreen()),
  //         )));
  /*
  runApp(MaterialApp(
    home: ResponsiveScreen(),
    // initialRoute: Page1.routeName,
    // routes: {
    //   Page1.routeName: (context) => Page1(),
    //   Page2.routeName: (context) => Page2(''),
    //   Page3.routeName: (context) => Page3(),
    // },
    onGenerateRoute: (RouteSettings routeSettings) {
      String routeName = routeSettings.name;
      var arguments = routeSettings.arguments;
      if (routeName == 'palestine') {
        return MaterialPageRoute(builder: (context) {
          return Page2(arguments);
        });
      } else {
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            backgroundColor: Colors.redAccent,
            body: Center(
              child: Text('404 Page Not Found'),
            ),
          );
        });
      }
    },
    onUnknownRoute: (RouteSettings routesettings) {},
  ));*/
}

class MyApp extends StatelessWidget {
  String textValue = 'hello world';
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: SplachScreen()

        // Scaffold(
        //   appBar: AppBar(),
        //   body: Container(
        //     child: Column(
        //       children: [
        //         Row(
        //           children: [
        //             Expanded(child: Text(textValue)),
        //             CupertinoSwitch(
        //                 value: switchValue,
        //                 onChanged: (value) {
        //                   print(value);
        //                 })
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
    // return
    // Scaffold(
    //     appBar: AppBar(
    //       title: Text('Products'),
    //     ),
    //     body: Column(
    //       children: [
    //         Text('Products'),
    //         Expanded(
    //           child: GridView.builder(
    //               gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //                   maxCrossAxisExtent: 200),
    //               //  SliverGridDelegateWithFixedCrossAxisCount(
    //               //   crossAxisCount: 3,
    //               //   mainAxisSpacing: 10,
    //               //   crossAxisSpacing: 10,
    //               // ),
    //               itemCount: products.length,
    //               itemBuilder: (c, index) {
    //                 return CachedNetworkImage(
    //                   imageUrl: products[index].imageUrl,
    //                   fit: BoxFit.cover,
    //                   placeholder: (c, y) {
    //                     return Center(
    //                       child: CircularProgressIndicator(),
    //                     );
    //                   },
    //                 );
    //               }),
    //         ),
    //       ],
    //     ));
  }
}

// class Page2 extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return OmarState();
//   }
// }

// class OmarState extends State<Page2> {
//   String value = 'Hello World';
//   bool switchValue = false;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(20),
//               child: Row(
//                 children: [
//                   Expanded(
//                       child: Text(
//                     switchValue ? 'DAY TIME' : 'NIGHT TIME',
//                     style: TextStyle(fontSize: 20),
//                   )),
//                   CupertinoSwitch(
//                       value: switchValue,
//                       onChanged: (value) {
//                         switchValue = value;
//                         setState(() {});
//                       })
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class Page2 extends StatefulWidget {
//   @override
//   _Page2State createState() => _Page2State();
// }

// class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
//   TabController tabController;

//   myMethod() {
//     tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   initState() {
//     super.initState();
//     myMethod();
//   }

//   int index = 0;
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Application'),
//         bottom: TabBar(controller: tabController, tabs: [
//           Tab(
//             child: Text('Home'),
//           ),
//           Tab(
//             child: Text('Studio'),
//           ),
//           Tab(
//             child: Text('Profile'),
//           ),
//         ]),
//       ),
//       body: TabBarView(controller: tabController, children: [
//         Center(
//           child: RaisedButton(
//               child: Text('Go to my profile'),
//               onPressed: () {
//                 tabController.animateTo(2);
//               }),
//         ),
//         Center(
//           child: Text('Studio'),
//         ),
//         Center(
//           child: Text('Profile'),
//         ),
//       ]),
//       bottomNavigationBar: BottomNavigationBar(
//           onTap: (index) {
//             print(index);
//             tabController.animateTo(index);

//             this.index = index;
//             setState(() {});
//           },
//           currentIndex: index,
//           fixedColor: Colors.blue,
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//             BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Gallery'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.verified_user), label: 'Profile'),
//           ]),
//     );
//   }
// }
