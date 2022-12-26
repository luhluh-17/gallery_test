import 'package:flutter/material.dart';
import 'package:sample_gallery/ui/screens/gallery/gallery_screen.dart';
import 'package:sample_gallery/ui/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/gallery': (context) => const GalleryScreen(),
      },
    );
  }
}
