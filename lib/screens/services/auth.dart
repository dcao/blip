import 'package:blip/models/curr_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FireBase User
  CurrUser _userFromFirebaseUser(User user){
    return user != null ? CurrUser(uid:user.uid) : null;
  }

  //auth change user stream
  Stream<CurrUser> get user {
    return _auth.authStateChanges()
      .map(_userFromFirebaseUser);
  }


  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email pass

  //register with email pass
  Future registerWithEmailAndPassword(String email, String password) async {
    
    print('trying...');
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );

      User user = userCredential.user;
      // return _userFromFirebaseUser(user);

    } on PlatformException catch (e){
      print(e.toString());
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print(e.toString());
      }
      // return null;
    } catch (e) {
      print(e);
      // return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

}