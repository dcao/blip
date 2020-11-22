import 'package:blip/screens/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: (){
              widget.toggleView();
            }
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                }
              ),
              SizedBox(height:20),
              TextFormField(
                obscureText: true,
                onChanged:(val){
                  setState(() {
                    password = val;
                  });
                }
              ),
              SizedBox(height:20),
              RaisedButton(
                color: Colors.pink[400],
                child:Text(
                  'sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                    print(email);
                    print(password);
                },
              )
            ],
          )
        )
      ),
    );
  }
}