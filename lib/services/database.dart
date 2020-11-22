import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference blogsCollection = FirebaseFirestore.instance.collection('blogs');

  Future updateUserData(String title, String text) async {
    return await blogsCollection.doc(uid).set({
      'title': title,
      'text': text
    });
  }

  //get blogs stream
  Stream<QuerySnapshot> get blogs {
    return blogsCollection.snapshots();
  }

}