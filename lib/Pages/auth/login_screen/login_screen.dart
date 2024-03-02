import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedexapp/bloc/login_bloc.dart';
import 'package:pokedexapp/services/provider.dart';
import 'package:pokedexapp/services/usuario_provider.dart';
import 'package:pokedexapp/validators/utils.dart';

import 'package:pokedexapp/widgets/textform_widget.dart';

class LoginScreen extends StatelessWidget {
  static String name = 'loginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8ecae6),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: const SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [_BackgroundLogin(), _FormLogin()],
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
    final usuarioProvider = UsuarioProvider();
    final bloc = Provider.of(context);
    final heightSize = MediaQuery.sizeOf(context).height;
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: heightSize * 0.35),
        child: Column(
          children: [
            const Text(
              'LOGIN',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            textFormCustom('Ingrese su correo', false, Icons.person_2_outlined,
                bloc.emailStream, bloc.changeEmail),
            const SizedBox(
              height: 40,
            ),
            textFormCustom('Ingrese su contraseña', true, Icons.lock,
                bloc.passwordStream, bloc.changePassword),
            const SizedBox(
              height: 50,
            ),
            StreamBuilder(
                stream: bloc.formValidatorStream,
                builder: (context, snapshot) {
                  return OutlinedButton(
                    onPressed: (snapshot.hasData)
                        ? () => _login(bloc, context, usuarioProvider)
                        : null,
                    child: const Text('Ingresar'),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () => context.pushReplacement('/registerScreen'),
                child: const Text('¿Aun no tienes cuenta?, Registrate'))
          ],
        ),
      ),
    );
  }

  _login(LoginBloc bloc, BuildContext context,
      UsuarioProvider usuarioProvider) async {
    final Map<String, dynamic> info =
        await usuarioProvider.login(bloc.email, bloc.password);
    if (context.mounted) {
      (info['ok']) ? context.pushReplacement('/homeScreen') : showAlert(context, info['mensaje']);
    }
  }
}

//Fondo del Login

class _BackgroundLogin extends StatelessWidget {
  const _BackgroundLogin();

  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.sizeOf(context).height;
    return Container(
      margin: EdgeInsets.only(top: heightSize * 0.3),
      height: heightSize * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
