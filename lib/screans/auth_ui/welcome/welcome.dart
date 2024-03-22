import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shouper/constants/asset_image.dart';
import 'package:shouper/constants/routes.dart';
import 'package:shouper/screans/auth_ui/login/login.dart';
import 'package:shouper/screans/auth_ui/singup/sing_up.dart';
import 'package:shouper/widgets/primaray_button.dart';
import 'package:shouper/widgets/top_title/top_title.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          
          children:[
                      TopTitle(subtitle: 'bay any items from using app', title: 'welcome'),
        
            
        //           
            SizedBox(height: 20,),
            Center( child: Image.asset(AssetImages.instance.welcomeImage,height: 250,),
            ),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
             CupertinoButton(
              onPressed: (){},
              padding: EdgeInsets.zero,
               child: Image.asset(
                AssetImages.instance.facebook,
                scale: 10.0,
                
                ),
             ),
              SizedBox(width: 10,),
                  
             CupertinoButton(
              onPressed: (){},
              padding: EdgeInsets.zero,
               child: Image.asset(
                AssetImages.instance.google,
                scale: 25.0,
                
                ),
             ),
        
         
        
                ],
              ),
              SizedBox(height: 18,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: 
                PrimarayButton(title: 'Login',onPressed: () {
                  Routes.instance.push( widget:  Login(),context:  context);
                },),
                
              
              ),
              SizedBox(height: 8.0,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: PrimarayButton(title: 'SingUp',onPressed: () {
                                Routes.instance.push(widget: const SingUp(), context: context);

                },),
              ),
        
              
          ]  ,
        ),
      ),
    );
  }
}