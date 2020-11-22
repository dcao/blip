import 'package:blip/screens/auth/authenticate.dart';
import 'package:blip/screens/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blip/models/curr_user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CurrUser>(context);
    
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}