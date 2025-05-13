import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  bool _showEmailError = false;

  bool _emailIsNotEmpty = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Future<void> _signInWithEmailAndPassword() async {
  //   try {
  //     final userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(
  //           email: _emailController.text.trim(),
  //           password: _passwordController.text.trim(),
  //         );
  //     print(userCredential);
  //   } on FirebaseAuthException catch (e) {
  //     print(e.message);
  //   }
  // }

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
                    Navigator.pop(context);
                  },
                ),
                Text('Forgot Password', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please enter your account's email address and we will send you a link to reset your password.",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ],
            ),
            SizedBox(height: 77),
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
                    hint: 'Email',
                    errorHint: '',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    onFocusChange: (hasFocus) {
                      if (hasFocus && _showEmailError) {
                        setState(() => _showEmailError = false);
                      }
                    },
                  ),
                  SizedBox(height: 358),
                ],
              ),
            ),
            // Submit Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _emailIsNotEmpty && !_showEmailError
                        ? Color(0xFFFFB347)
                        : Color(0xFFf6bd6c),
                minimumSize: Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Text(
                'submit',
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
}
