import 'package:flutter/material.dart';

ThemeData themeData=ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.red,
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: BorderSide(
                              color: Colors.red.shade400,

                              width: 1.9,
                              


                            ),
                            disabledBackgroundColor: Colors.red.withOpacity(0.38)
                          ),
  ),
  inputDecorationTheme:  InputDecorationTheme(
    border: outlineInputBorder,
    prefixIconColor: Colors.grey,
    errorBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder

  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      textStyle: const TextStyle(
        fontSize: 18.0
      ),
      disabledBackgroundColor: Colors.grey
    )
    
  ),
canvasColor: Colors.red,
primarySwatch: Colors.red,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    toolbarTextStyle: TextStyle(
      color: Colors.black
    ),
    iconTheme: IconThemeData(color: Colors.black)
  )

);

OutlineInputBorder outlineInputBorder=const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey
  )
);