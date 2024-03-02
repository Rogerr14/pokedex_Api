import 'package:go_router/go_router.dart';
import 'package:pokedexapp/Pages/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/registerScreen',
      name: RegisterScreen.name,
      builder: (context, state) => const RegisterScreen(),
    ),
     GoRoute(
      path: '/homeScreen',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    
  ]
);
