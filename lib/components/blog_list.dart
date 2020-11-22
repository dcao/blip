import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';


class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  @override
  Widget build(BuildContext context) {

    final blogs = Provider.of<QuerySnapshot>(context);
    
    for (var doc in blogs.docs){
      print(doc.data());
    }

    return Container(
      
    );
  }
}