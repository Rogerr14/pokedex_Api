import 'package:flutter/material.dart';


Widget textFormCustom(String text, bool obscureText, IconData icon) {
  //final String text = '';
  
  return SizedBox(
    width: 320,
    child: TextField(
      obscureText: obscureText,
      onTapOutside: (event) {
       
      },
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: text,
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 10.0,),
          borderRadius: BorderRadius.all(Radius.circular(20))
        )
        
        
      ),
        
    ),
  )
  ;
}
