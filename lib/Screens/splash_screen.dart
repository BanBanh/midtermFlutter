import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_project/Screens/wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 1),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Wrapper()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFB347),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // top column
            Column(
              children: [
                SizedBox(height: 198),
                SizedBox(
                  width: 250,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png'),
                      Text(
                        'HaBIT Note',
                        style: GoogleFonts.fugazOne(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // bottom column
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© Copyright HABIT 2021. All rights reserved"),
                SizedBox(height: 67),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
