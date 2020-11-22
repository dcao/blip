import 'package:blip/pages/canvas.dart';
import 'package:flutter/material.dart';
import 'package:blip/pages/home.dart';
import 'package:blip/pages/write.dart';
import 'package:blip/pages/view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/write': (context) => AddBlog(),
      '/view': (context) => View(),
      '/draw': (context) => MyCanvas(),
    }
  ));
}

