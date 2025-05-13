import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_project/Screens/Auth/forgot_password.dart';
import 'package:midterm_project/Screens/Auth/sign_in.dart';
import 'package:midterm_project/Screens/Auth/create_user.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final slides = [
    {
      'title': 'Take Notes',
      'subtitle': "Quickly capture what's on your mind",
      'image': 'assets/images/pic1.png',
    },
    {
      'title': 'To-dos',
      'subtitle': "List out your day-to-day tasks",
      'image': 'assets/images/pic2.png',
    },
    {
      'title': 'Image to Text Converter',
      'subtitle': "Upload your images and convert to text",
      'image': 'assets/images/pic3.png',
    },
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':
            (context) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                toolbarHeight: 82,
                leadingWidth: 90,
                elevation: 0,
                iconTheme: IconThemeData(color: Color(0xFFFFB347)),
              ),
              backgroundColor: Color(0xFFF1F1F1),
              drawer: AppDrawer(),
              body: Builder(
                builder:
                    (context) => Column(
                      children: [
                        SizedBox(
                          height: 58,
                          child:
                              _currentIndex == 0
                                  ? Row(
                                    children: [
                                      SizedBox(width: 39),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'WELCOME TO',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'HaBIT Note',
                                            style: GoogleFonts.fugazOne(
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                  : Container(),
                        ),
                        SizedBox(height: 28),
                        SizedBox(
                          height: 445,
                          child: CarouselSlider.builder(
                            itemCount: slides.length,
                            options: CarouselOptions(
                              height: 445,
                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() => _currentIndex = index);
                              },
                            ),
                            itemBuilder: (context, index, _) {
                              final slide = slides[index];
                              return Column(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 340,
                                      height: 340,
                                      child: Image.asset(
                                        slide['image']!,
                                        height: 340,
                                        width: 340,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 334,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              slide['title']!,
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              slide['subtitle']!,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(slides.length, (index) {
                            return Container(
                              width: _currentIndex == index ? 65 : 35,
                              height: 16,
                              margin: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                color:
                                    _currentIndex == index
                                        ? Colors.orange
                                        : Colors.grey[400],
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 39),
                        ElevatedButton(
                          onPressed:
                              () => Navigator.pushNamed(context, '/register'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFB347),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            minimumSize: Size(343, 52),
                          ),
                          child: Text(
                            'CREATE ACCOUNT',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 25),
                        ElevatedButton(
                          onPressed:
                              () => Navigator.pushNamed(context, '/login'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            minimumSize: Size(343, 52),
                          ),
                          child: Text(
                            'LOG IN',
                            style: TextStyle(
                              color: Color(0xFFFFB347),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
            ),
        '/login': (context) => SignIn(),
        '/register': (context) => CreateUser(),
      },
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey, Color(0xFFFFB347)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: EdgeInsets.all(40),
              onPressed: Scaffold.of(context).closeDrawer,
              icon: Icon(Icons.menu),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('HaBIT Note', style: GoogleFonts.fugazOne(fontSize: 24)),
                  SizedBox(height: 4),
                  Text('V1.0.0', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            Divider(height: 30, color: Colors.black),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Text(
                      'Terms of Use',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
