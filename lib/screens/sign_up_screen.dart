import 'package:flutter/material.dart';
import 'package:sign_up_app/screens/home_screen.dart';
import 'package:sign_up_app/services/auth_service.dart';
import '../widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final AuthService _authService = AuthService();

  void _signUp() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Password must be same")));
      return;
    }

    try {
      await _authService.signUpWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created Successfully")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.lock, size: 80, color: Colors.blue),
                const SizedBox(height: 20), //provides space between two widgets

                const Text(
                  "Welcome to Sign Up Screen",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                CustomTextField(
                  hintText: "Email",
                  icon: Icons.email,
                  controller: _emailController,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  hintText: "Password",
                  icon: Icons.lock,
                  isPassword: false,
                  controller: _passwordController,
                ),

                const SizedBox(height: 24),
                CustomTextField(
                  hintText: "Confirm Password",
                  icon: Icons.lock,
                  isPassword: false,
                  controller: _confirmPasswordController,
                ),

                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("Sign Up", style: TextStyle(fontSize: 16)),
                ),

                const SizedBox(height: 16),

                TextButton(
                  onPressed: () {},
                  child: const Text("Already have an account?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
