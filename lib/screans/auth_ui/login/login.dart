import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shouper/constants/constants.dart';
import 'package:shouper/constants/routes.dart';
import 'package:shouper/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:shouper/screans/auth_ui/singup/sing_up.dart';
import 'package:shouper/screans/home/home.dart';
import 'package:shouper/widgets/primaray_button.dart';
import 'package:shouper/widgets/top_title/top_title.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email=TextEditingController();
    TextEditingController password=TextEditingController();

  
  bool isShowPassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(), 
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            Center(child: TopTitle(subtitle: 'welcome back to e_commerece', title: 'Login')),
          SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.all(12.0),
             child:
              TextField(
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
           SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: PrimarayButton(
              title: 'Login',
              onPressed: () async{
              bool isValidated=  loginValidation(email.text, password.text);
                if(isValidated){
                  bool  isLogin=await FirebaseAuthHelper.instance.login(email.text,password.text,context);
                  if(isLogin){
                    Routes.instance.pushAndRemoveUntil(widget: Home(), context: context);
                  }
                }
              },
              ),
           ),
           SizedBox(height: 10,),
           Text("Don't have an account ?"),
           SizedBox(height: 12,),
           CupertinoButton(
            onPressed: (){
              Routes.instance.push(widget: const SingUp(), context: context);
            },
            child: Text('create an account',
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