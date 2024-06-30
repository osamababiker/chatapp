import 'package:camera/camera.dart';
import 'package:chatapp/Screens/CameraScreen.dart';
import 'package:chatapp/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "OpenSans",
          primaryColor: const Color(0xFF075E54),
          hintColor: const Color(0xFF128C7E)),
      home: LoginScreen(), 
    );
  }
}
