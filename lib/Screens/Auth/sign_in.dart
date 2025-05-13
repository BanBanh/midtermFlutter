import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:midterm_project/Screens/Auth/forgot_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _showEmailError = false;
  bool _showPasswordError = false;
  bool _obscurePassword = true;

  bool _emailIsNotEmpty = false;
  bool _passwordIsNotEmpty = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.arrow_back, color: Color(0xFFFFB347)),
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                ),
                Text('Log In', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back !",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Text(
                  "Please login with your credentials",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 100),
            // All the form to fill
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Email Field
                  _buildTextField(
                    onChangeFunctions: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          _emailIsNotEmpty = true;
                        });
                      } else {
                        setState(() {
                          _emailIsNotEmpty = false;
                        });
                      }
                    },
                    controller: _emailController,
                    showError: _showEmailError,
                    hint: 'Email Address',
                    errorHint: 'Please enter a valid email',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    onFocusChange: (hasFocus) {
                      if (hasFocus && _showEmailError) {
                        setState(() => _showEmailError = false);
                      }
                    },
                  ),
                  SizedBox(height: 27),
                  // Password Field
                  _buildTextField(
                    onChangeFunctions: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          _passwordIsNotEmpty = true;
                        });
                      } else {
                        setState(() {
                          _passwordIsNotEmpty = false;
                        });
                      }
                    },
                    controller: _passwordController,
                    showError: _showPasswordError,
                    hint: 'Password',
                    errorHint: 'Require at least 6 characters',
                    icon: Icons.lock_outline,
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                    onFocusChange: (hasFocus) {
                      if (hasFocus && _showPasswordError) {
                        setState(() => _showPasswordError = false);
                      }
                    },
                  ),
                  SizedBox(height: 15),

                  // forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 69),
                ],
              ),
            ),
            // register link
            Text(
              'Don’t have an account yet ?',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/login');
              },
              style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
              child: const Text(
                'Create an account here',
                style: TextStyle(
                  color: Color(0xFFFFB347),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 120),
            // Create Account Button
            ElevatedButton(
              onPressed: _validateForm,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _emailIsNotEmpty &&
                            _passwordIsNotEmpty &&
                            !_showEmailError &&
                            !_showPasswordError
                        ? Color(0xFFFFB347)
                        : Color(0xFFf6bd6c),
                minimumSize: Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Text(
                'LOG IN',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required bool showError,
    required String hint,
    required String errorHint,
    ValueChanged<String>? onChangeFunctions,
    IconData? icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    required Function(bool) onFocusChange,
  }) {
    return Focus(
      onFocusChange: onFocusChange,
      child: TextFormField(
        onChanged: onChangeFunctions,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(color: showError ? Colors.red : Colors.black54),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: showError ? errorHint : hint,
          hintStyle: TextStyle(
            color: showError ? Colors.red : Color(0x80000000),
          ),
          prefixIcon: Icon(icon, color: Color(0xFFFFB347)),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.black54, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.black54, width: 1),
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    final emailValid = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(_emailController.text.trim());
    final passwordValid = _passwordController.text.length >= 6;

    setState(() {
      _showEmailError = !emailValid;
      _showPasswordError = !passwordValid;
    });

    if (emailValid && passwordValid) {
      // Proceed with registration
      _signInWithEmailAndPassword();
    }
  }
}
