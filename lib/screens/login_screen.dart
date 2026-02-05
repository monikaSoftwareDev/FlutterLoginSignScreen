import 'package:flutter/material.dart';
import 'package:sign_up_app/screens/home_screen.dart';
import 'package:sign_up_app/screens/sign_up_screen.dart';
import 'package:sign_up_app/services/auth_service.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  void _login() async {
    try {
      await _authService.loginWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login successful")));

      // TODO: Navigate to HomeScreen

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
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
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.lock, size: 80, color: Colors.blue),
                const SizedBox(height: 20),
                const Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hintText: "Enter your email",
                  icon: Icons.email,
                  controller: _emailController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: "Password",
                  icon: Icons.lock,
                  controller: _passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(onPressed: _login, child: const Text("Login")),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignUpScreen()),
                    );
                  },
                  child: const Text("Create new account"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
