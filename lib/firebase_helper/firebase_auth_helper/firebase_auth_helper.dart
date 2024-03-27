import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shouper/constants/constants.dart';
import 'package:shouper/models/user_models.dart';

class FirebaseAuthHelper{
 static FirebaseAuthHelper instance=FirebaseAuthHelper();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  //todo this down code as account page
  final FirebaseFirestore  _firestore=FirebaseFirestore.instance;
  ////todo into ku ekyahy
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
   String name, String email,String password,BuildContext context
  )async{
    try{
      showAboutDialog(context: context);
   UserCredential userCredential =await _auth
   .createUserWithEmailAndPassword(email: email, password: password);
   UserModel userModel=UserModel(
    id: userCredential.user!.uid,name: name,email: email,image: null,
   );


_firestore.collection("users").doc(userModel.id).set(userModel.toJson());




    Navigator.of(context).pop();
    return true;

    }on FirebaseAuthException catch(error){
          Navigator.of(context).pop();

      showMessage(error.code.toString());
    return false;
    
  }

  //todo logout page 
  }
  void signOut() async{
   await _auth.signOut();

  }
}