import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:wac2_flutter/wac_firebase/auth_helper.dart';

class FormExample extends StatefulWidget {
  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  String textContent = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('FormExample')),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                onChanged: (v) {
                  this.textContent = v;
                  setState(() {});
                },
                onSubmitted: (v) {
                  print(v);
                },
                // onChanged: (v) {
                // textContent = v;
                // },
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueAccent,
                    suffix: Icon(Icons.email),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'UserName'),
              ),
              Text(textContent)
            ],
          )),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
/*
1- replace textfield with textformfield
2- wrap all your textFotmFields with Form Widget
3- define validator and onsave for each textFormField
4- defile global key 
5- assign the defined global key for the form
6- excute globalKey.currentState.validate() 
7- excute globalKey.currentState.save() 



*/

  String email = '';

  String oldPassword;
  String password;
  String password2;

  bool isAccepted = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  sendForm() async {
    bool validationResult = formKey.currentState.validate();
    if (validationResult) {
      formKey.currentState.save();
      if (password == password2) {
        await AuthHelpers.authHelpers.login(email, oldPassword);
        AuthHelpers.authHelpers.resetPassword(password);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Passwords are not matched'),
                actions: [
                  TextButton(
                      onPressed: () {
                        this.isAccepted = true;
                        setState(() {});
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage(
                            email: this.email,
                            password: this.password,
                          );
                        }));
                      },
                      child: Text('Accept')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancle')),
                ],
              );
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        ));
                  },
                );
              }).toList(),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: TextFormField(
                onChanged: (v) {
                  this.email = v;
                },
                validator: (v) {
                  if (v.length == 0 || v == null) {
                    return 'Required Field';
                  } else if (!isEmail(v)) {
                    return 'Invalid Email syntax';
                  }
                },
                onSaved: (v) {
                  this.email = v;
                },
                decoration: InputDecoration(
                    labelText: 'EMAIL',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: TextFormField(
                obscureText: true,
                validator: (v) {
                  if (v.length <= 6) {
                    return 'the password must be larger than 6 letters';
                  }
                },
                onSaved: (v) {
                  this.oldPassword = v;
                },
                decoration: InputDecoration(
                    labelText: 'OLD PASSWORD',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: TextFormField(
                obscureText: true,
                validator: (v) {
                  if (v.length <= 6) {
                    return 'the password must be larger than 6 letters';
                  }
                },
                onSaved: (v) {
                  this.password = v;
                },
                decoration: InputDecoration(
                    labelText: 'NEW PASSWORD',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: TextFormField(
                obscureText: true,
                validator: (v) {
                  if (v.length <= 6) {
                    return 'the password must be larger than 6 letters';
                  }
                },
                onSaved: (v) {
                  this.password2 = v;
                },
                decoration: InputDecoration(
                    labelText: 'CONFIRM PASSWORD',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            CheckboxListTile(
                title: Text('Accept'),
                value: isAccepted,
                onChanged: (v) {
                  this.isAccepted = v;
                  setState(() {});
                }),
            TextButton(
                onPressed: () {
                  AuthHelpers.authHelpers.sendVeriificationCode();
                },
                child: Text('Forget Password?')),
            ElevatedButton(
                onPressed: () {
                  AuthHelpers.authHelpers.checkUser();
                  // print(user.email);
                },
                child: Text('SEND'))
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  String email;
  String password;
  HomePage({
    this.email,
    this.password,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN DATA'),
      ),
      body: Column(
        children: [
          Text(this.email),
          Text(this.password),
        ],
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carousel with indicator controller demo')),
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 50.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
