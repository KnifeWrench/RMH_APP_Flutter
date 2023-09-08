import 'package:flutter/material.dart';
import 'package:rmh_app_flutter/screens/search.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Move Here',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const SplashScreen(title: 'Move Here'),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Splash Screen Properties
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const  SearchPage()),
            ));
  }

  // Splash Screen Design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 29, 82),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child: GestureDetector(onTap: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const  SearchPage()),
            );},
        child: Image.asset('assets/images/Logo_white.png'))),
      ),
    );
  }
}