import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _showDisplayNameError = false;
  bool _showEmailError = false;
  bool _showPasswordError = false;
  bool _showConfirmPasswordError = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  bool _displayNameIsNotEmpty = false;
  bool _emailIsNotEmpty = false;
  bool _passwordIsNotEmpty = false;
  bool _confirmPasswordIsNotEmpty = false;

  @override
  void dispose() {
    _displayNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _createUserWithEmailAndPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
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
        padding: const EdgeInsets.fromLTRB(40, 46, 31, 0),
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
                Text('Create Account', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's get to know you !",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Text(
                  "Enter your details to continue",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 25),
            // All the form to fill
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Display Name Field
                  _buildTextField(
                    onChangeFunctions: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          _displayNameIsNotEmpty = true;
                        });
                      } else {
                        setState(() {
                          _displayNameIsNotEmpty = false;
                        });
                      }
                    },
                    controller: _displayNameController,
                    showError: _showDisplayNameError,
                    hint: 'Display Name',
                    errorHint: 'Please enter your display name',
                    icon: Icons.person_outline,
                    onFocusChange: (hasFocus) {
                      if (hasFocus && _showDisplayNameError) {
                        setState(() => _showDisplayNameError = false);
                      }
                    },
                  ),
                  SizedBox(height: 25),

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
                  SizedBox(height: 25),

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
                        setState(
                          () =>
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword,
                        );
                      },
                    ),
                    onFocusChange: (hasFocus) {
                      if (hasFocus && _showPasswordError) {
                        setState(() => _showPasswordError = false);
                      }
                    },
                  ),
                  SizedBox(height: 25),

                  // Confirm Password Field
                  _buildTextField(
                    onChangeFunctions: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          _confirmPasswordIsNotEmpty = true;
                        });
                      } else {
                        setState(() {
                          _confirmPasswordIsNotEmpty = false;
                        });
                      }
                    },
                    controller: _confirmPasswordController,
                    showError: _showConfirmPasswordError,
                    hint: 'Confirm Password',
                    errorHint: 'Passwords do not match',
                    obscureText: _obscureConfirmPassword,
                    onFocusChange: (hasFocus) {
                      if (hasFocus && _showConfirmPasswordError) {
                        setState(() => _showConfirmPasswordError = false);
                      }
                    },
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
            // Login link
            Text(
              'Already have an account?',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/register');
              },
              style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
              child: const Text(
                'Login here',
                style: TextStyle(
                  color: Color(0xFFFFB347),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 55),
            // Terms text
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'By clicking the "CREATE ACCOUNT" button, you agree to ',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  TextSpan(
                    text: 'Terms of use',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              overflow: TextOverflow.visible,
              softWrap: true,
            ),
            SizedBox(height: 24),
            // Create Account Button
            ElevatedButton(
              onPressed: _validateForm,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _displayNameIsNotEmpty &&
                            _emailIsNotEmpty &&
                            _passwordIsNotEmpty &&
                            _confirmPasswordIsNotEmpty &&
                            !_showDisplayNameError &&
                            !_showEmailError &&
                            !_showPasswordError &&
                            !_showConfirmPasswordError
                        ? Color(0xFFFFB347)
                        : Color(0xFFf6bd6c),
                minimumSize: Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Text(
                'CREATE ACCOUNT',
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
    final displayNameValid = _displayNameController.text.trim().isNotEmpty;
    final emailValid = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(_emailController.text.trim());
    final passwordValid = _passwordController.text.length >= 6;
    final passwordsMatch =
        _passwordController.text == _confirmPasswordController.text &&
        _passwordController.text.isNotEmpty;

    setState(() {
      _showDisplayNameError = !displayNameValid;
      _showEmailError = !emailValid;
      _showPasswordError = !passwordValid;
      _showConfirmPasswordError = !passwordsMatch;
    });

    if (displayNameValid && emailValid && passwordValid && passwordsMatch) {
      // Proceed with registration
      _createUserWithEmailAndPassword();
    }
  }
}
