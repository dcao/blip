import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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