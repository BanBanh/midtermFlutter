import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:midterm_project/Screens/splash_screen.dart';
// import 'package:midterm_project/Screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBvaPZRyyltZHwfZzWP_fj4IiIYHCYvznY',
      appId: '1:502950602225:android:77080de1e169ee292e9050',
      messagingSenderId: '502950602225',
      projectId: 'midtermproject-150d2',
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: Wrapper(),
    );
  }
}
