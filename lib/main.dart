import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:netflix_ui/views/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        backgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(color: Color(0xFF0d0403)),
        scaffoldBackgroundColor: const Color(0xFF0d0403),
        primaryColor: Colors.red.shade600,
      ),
      home: const SplashScreen(),
    );
  }
}

