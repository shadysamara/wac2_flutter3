import 'package:flutter/material.dart';

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
  String email = '';

  String password;

  bool isAccepted = false;

  sendForm() {
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
              content:
                  Text('you have to accept our conditions before sending data'),
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: TextField(
              onChanged: (v) {
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
            child: TextField(
              obscureText: true,
              onChanged: (v) {
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
