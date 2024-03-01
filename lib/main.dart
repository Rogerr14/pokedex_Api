import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'package:pokedexapp/Pages/auth/login_screen/login_screen.dart';
import 'package:pokedexapp/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home:  LoginScreen()
    );
  }
}
