import 'package:blip/screens/services/auth.dart';
import 'package:blip/models/curr_user.dart';
import 'package:blip/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:blip/screens/pages/home.dart';
import 'package:blip/screens/pages/write.dart';
import 'package:blip/screens/pages/view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CurrUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/home': (context) => Home(),
          '/write': (context) => AddBlog(),
          '/view': (context) => View()
        }
      )
    );
  }
}

