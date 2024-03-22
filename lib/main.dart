import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shouper/constants/theme.dart';
import 'package:shouper/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:shouper/firebase_options.dart';
import 'package:shouper/screans/auth_ui/welcome/welcome.dart';
import 'package:shouper/screans/home/home.dart';

void main() async {
  //firebase setup😶
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);


  
  runApp( MaterialApp(
  
    debugShowCheckedModeBanner: false,
    title: "e commerce",
    //theme: themeData,
    theme: themeData,
    home: StreamBuilder(
      stream: FirebaseAuthHelper.instance.getAuthCnahge,
     // initialData: initialData,
      builder: ( context,  snapshot) {
        if(snapshot.hasData){
          return const Home();

        }
        return const Welcome();
      },
      
    ),
  ));
  
}


