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
