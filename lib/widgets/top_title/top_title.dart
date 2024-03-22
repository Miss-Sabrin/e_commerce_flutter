import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String  title,subtitle;
  const TopTitle({super.key, required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(

            height: kToolbarHeight,),
            // if(title =="Login" || title=="create acount")Padding(padding: 
            // const EdgeInsets.all(8.0),
            // child: BackButton(),
            // ),
          Text(title,
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
          color: Colors.purpleAccent[700],
          ),),
          SizedBox(height: 12,),
          Text(subtitle,
         style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
         color: Colors.indigo
         ),)
      ],
    );
  }
}