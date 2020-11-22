import 'package:blip/components/blog_list.dart';
import 'package:blip/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blip/services/database.dart';
import 'package:provider/provider.dart';


class View extends StatelessWidget {

    final AuthService _auth = AuthService();

  Widget _buildListItem(BuildContext context, DocumentSnapshot doc) {
    return StreamProvider<QuerySnapshot>.value (
      value: DatabaseService().blogs,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('My blogs'),
          backgroundColor: Colors.brown[400],
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: BlogList()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value (
      value: DatabaseService().blogs,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('My blogs'),
          backgroundColor: Colors.brown[400],
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: BlogList()
      ),
    );
  }
}