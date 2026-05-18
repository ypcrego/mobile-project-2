import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_project_2/features/auth/login_page.dart';
import 'package:mobile_project_2/features/shop/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLogged = prefs.getBool('isLogged') ?? false;

  runApp(MainApp(isLogged: isLogged));
}

class MainApp extends StatelessWidget {
  final bool isLogged;
  const MainApp({super.key, required this.isLogged});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha aplicação',
      home: isLogged ? const HomePage() : const LoginPage(),
    );
  }
}
