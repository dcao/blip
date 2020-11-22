import 'package:blip/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:blip/services/database.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseAuth auth = FirebaseAuth.instance;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Blip"),
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("Logout"),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/write');
                }, 
                icon: Icon(Icons.comment_outlined), 
                label: Text("Write New Journal Entry")
              ),
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/view');
                }, 
                icon: Icon(Icons.comment_outlined), 
                label: Text("View Entries")
              ),
            ],
          )
        )
    );
  }
}