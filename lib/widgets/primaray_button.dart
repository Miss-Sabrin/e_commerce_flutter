import 'package:flutter/material.dart';

class PrimarayButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const PrimarayButton({super.key , this.onPressed,required this.title});

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed, 
                  child:  Text(title,style: TextStyle(color: Colors.white),)),
              );
  }
}