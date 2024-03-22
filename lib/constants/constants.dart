import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message){
  Fluttertoast.showToast(
        msg: message,
        //toastLength: Toast.LENGTH_SHORT,
       // gravity: ToastGravity.CENTER,
       // timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
}
showLoaderDailog(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: Builder(builder: (context) {
      return SizedBox(
        width: 100,
        child: Column(
          children: [
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 240, 91, 91),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 7),
              child: const Text('loading....'),
            )
          ],
        ),
        
      );
    },),
  );

  showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (BuildContext context) {
      return alert;
    });

}

bool loginValidation(String email, String password){
  if(email.isEmpty && password.isEmpty){
    showMessage("both failed are empty");
    return false;

  }else if(email.isEmpty){
    showMessage('email is empty');
    return false;
  }else if(password.isEmpty){
    showMessage('password is empty');
    return false;
  } else{
    return true;
  }
}


//todo singup

bool singUpValidation(String email, String password, String name, String phone){
  if(email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty){
    showMessage(" all failed are empty");
    return false;

  }else if(email.isEmpty){
    showMessage('email is empty');
    return false;
    
  }else if(name.isEmpty){
    showMessage('name is empty');
    return false;
    
  }else if(phone.isEmpty){
    showMessage('phone is empty');
    return false;
  }else if(password.isEmpty){
    showMessage('password is empty');
    return false;
  } else{
    return true;
  }
}