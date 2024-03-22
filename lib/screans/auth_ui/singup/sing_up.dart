import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shouper/constants/constants.dart';
import 'package:shouper/constants/routes.dart';
import 'package:shouper/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:shouper/screans/home/home.dart';
import 'package:shouper/widgets/primaray_button.dart';
import 'package:shouper/widgets/top_title/top_title.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
   TextEditingController email=TextEditingController();
    TextEditingController name=TextEditingController();
     TextEditingController phone=TextEditingController();
    TextEditingController password=TextEditingController();


  bool isShowPassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ), 
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          
          children: [
            Center(child: TopTitle(subtitle: 'welcome back to e_commerece', title: 'create Account')),
          //SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.all(12.0),
             child:
              TextField(
                controller: name,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    prefixIcon: Icon(Icons.person,
                    )
                  ),
                ),
                
           ),
            Padding(
             padding: const EdgeInsets.all(12.0),
             child:
              TextField(
               controller: email,

                keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'email',
                    prefixIcon: Icon(Icons.message_outlined,
                    )
                  ),
                ),
                
           ),
            Padding(
             padding: const EdgeInsets.all(12.0),
             child:
              TextField(
                  controller: phone,

              keyboardType: TextInputType.phone,
        
                  decoration: InputDecoration(
                    hintText: 'phone',
                    prefixIcon: Icon(Icons.phone,
                    )
                  ),
                ),
                
           ),
            Padding(
             padding: const EdgeInsets.all(12.0),
             child:
              TextField(
                    controller: password,

                obscureText: isShowPassword,
                  decoration: InputDecoration(
                    hintText: 'password',
                    prefixIcon: Icon(Icons.password,
                    ),
                    suffixIcon: CupertinoButton(
                      onPressed: (){
                        setState(() {
                           isShowPassword=!isShowPassword;
                          
                        });
                       
                      },
                      padding: EdgeInsets.zero,
                      child: Icon(Icons.visibility))
                  ),
                ),
                
           ),
           SizedBox(height: 5,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: PrimarayButton(
              title: 'Create an account',
              onPressed: () async{
                 bool isValidated=  singUpValidation(email.text, password.text,phone.text, name.text);
                if(isValidated){
                  bool  isLogin=await FirebaseAuthHelper.instance.singUp(email.text,password.text ,context);
                  if(isLogin){
                    Routes.instance.pushAndRemoveUntil(widget: Home(), context: context);
                  }
                }
                //Routes.instance.pushAndRemoveUntil(widget: Home(), context: context);
              },
              ),
           ),
           SizedBox(height: 10,),
           Text("I have an account  alredy"),
           SizedBox(height: 12,),
           CupertinoButton(
            onPressed: (){
              
            },
            child: Text('Login',
            style: TextStyle(
              color: Theme.of(context).primaryColor
            ),
            ))
           
          
          ],
        ),
      ),

    );
  }
}