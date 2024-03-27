
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shouper/constants/theme.dart';
import 'package:shouper/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:shouper/firebase_options.dart';
import 'package:shouper/provider/app_provider.dart';
import 'package:shouper/screans/auth_ui/welcome/welcome.dart';
import 'package:shouper/screans/custom_bottom/custom_bottom_bar.dart';

void main() async {
  //firebase setup😶
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);


  
  runApp( MultiProvider(
    providers: [ChangeNotifierProvider(create: (context)=>AppProvider())],
    child: MaterialApp(
    
      debugShowCheckedModeBanner: false,
      title: "e commerce",
      //theme: themeData,
      theme: themeData,
      home: StreamBuilder(
        stream: FirebaseAuthHelper.instance.getAuthCnahge,
       // initialData: initialData,
        builder: ( context,  snapshot) {
          if(snapshot.hasData){
            return const Welcome ();
    
          }
          return const CusttomBottomBar();
        },
        
      ),
    ),
  ));
  
}


