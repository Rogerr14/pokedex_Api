import 'package:flutter/material.dart';


Widget textFormCustom(
    String text, bool obscureText, IconData icon, Stream bloc, Function(String) onChange) {
  return StreamBuilder(
      stream: bloc, 
      builder: (context, AsyncSnapshot snapshot) {
        return SizedBox(
          width: 320,
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              icon: Icon(icon),
              
              errorText: (snapshot.hasError)?snapshot.error.toString(): null,
              hintText: text,
              counterText: snapshot.data,
              
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 10.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            onChanged: onChange,
          ),
        );
      });
}
