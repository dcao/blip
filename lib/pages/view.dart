import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class View extends StatelessWidget {

  Widget _buildListItem(BuildContext context, DocumentSnapshot doc) {
    return ListTile(
      title: Row(
        children: [
          Text(
            doc['title'],
          ),
          Expanded(
            child: Text(
              doc['text']
            )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Blogs"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("blogs").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return const Text("Loading...");
          return ListView.builder(
            itemExtent: 80,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) =>
              _buildListItem(context, snapshot.data.documents[index]),
          );
        }
      ),
    );
  }
}