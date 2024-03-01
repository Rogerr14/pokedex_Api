
import 'package:flutter/material.dart';

import 'package:pokedexapp/widgets/textform_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      backgroundColor: const Color(0xFF8ecae6),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: const SingleChildScrollView(
          child: SafeArea(
            
            child: Stack(
              children: [
                _BackgroundLogin(),
                _FormLogin()
            
                ],
            ),
          ),
        ),
      ),
    );
  }
}


//Formulario de Login
class _FormLogin extends StatelessWidget {
  const _FormLogin();

  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.sizeOf(context).height;
    return Center(
          
       child: Container(
        padding: EdgeInsets.only(top: heightSize * 0.35),
        child: Column(
          children: [
            const Text('LOGIN', style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 40,),
            textFormCustom('Ingrese su correo', false, Icons.person_2_outlined),
            const SizedBox(height: 40,),
            textFormCustom('Ingrese su contraseña', true, Icons.lock),
            const SizedBox(height: 50,),
            OutlinedButton(
              onPressed: (){}, 
              child: const Text('Ingresar'),
              )
          ],
        ),
      ),
    );
  }
}

//Fondo del Login

class _BackgroundLogin extends StatelessWidget {
  const _BackgroundLogin();

  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.sizeOf(context).height;
    return Container(
      margin: EdgeInsets.only(top: heightSize *0.3),
      height: heightSize * 0.8 ,
      decoration:  const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: Colors.white, 
          boxShadow: [
            BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 10,
            ),
            
          ],
      ),
    );
  }
}
