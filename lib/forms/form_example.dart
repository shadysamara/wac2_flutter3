import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

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

  String password;

  bool isAccepted = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  sendForm() {
    bool validationResult = formKey.currentState.validate();
    if (validationResult) {
      formKey.currentState.save();
      if (isAccepted) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage(
            email: this.email,
            password: this.password,
          );
        }));
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Warning'),
                content: Text(
                    'you have to accept our conditions before sending data'),
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
                  this.password = v;
                },
                decoration: InputDecoration(
                    labelText: 'PASSWORD',
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
            ElevatedButton(
                onPressed: () {
                  sendForm();
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
