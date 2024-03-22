import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shouper/constants/constants.dart';

class FirebaseAuthHelper{
 static FirebaseAuthHelper instance=FirebaseAuthHelper();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  Stream<User?> get getAuthCnahge=> _auth.authStateChanges();

  Future<bool> login(
    String email,String password,BuildContext context
  )async{
    try{
      showAboutDialog(context: context);
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    Navigator.of(context).pop();
    return true;

    }on FirebaseAuthException catch(error){
          Navigator.of(context).pop();

      showMessage(error.code.toString());
    return false;
    
  }
  }



  //todo sing up

  
  Future<bool> singUp(
    String email,String password,BuildContext context
  )async{
    try{
      showAboutDialog(context: context);
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    Navigator.of(context).pop();
    return true;

    }on FirebaseAuthException catch(error){
          Navigator.of(context).pop();

      showMessage(error.code.toString());
    return false;
    
  }
  }
}