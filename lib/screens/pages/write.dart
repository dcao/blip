import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddBlog extends StatefulWidget {
  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  TextEditingController titleController;
  TextEditingController textController;
  String text = "";
  final _formKey = GlobalKey<FormState>();


  void initState(){
    super.initState();
    titleController = TextEditingController();
    textController = TextEditingController();
  }

  void dispose(){
    titleController.dispose();
    textController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write a Post!'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                icon: Icon(Icons.title),
                hintText: 'What do you want this to be called',
                labelText: 'Title *'
              ),

              validator: (value) {
                if(value.isEmpty){
                  return 'Please enter some text';
                }
                return null;
              }
            ),
            TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                icon: Icon(Icons.text_snippet),
                hintText: 'Your content',
                labelText: 'Content *'
              ),
              validator: (value) {
                if(value.isEmpty){
                  return 'Please enter some text';
                }
                return null;
              }
            ),
            ElevatedButton(
              onPressed: () {
                if(_formKey.currentState.validate()) {
                  FirebaseFirestore.instance.collection('blogs').add({
                    'title' : titleController.text,
                    'text': textController.text,
                  }).then((value){
                    print(value);
                  });
                };
              },
              child: Text('Submit')
              ), 
            ]
          )
        ),
      );
  }
}