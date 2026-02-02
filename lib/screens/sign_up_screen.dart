
import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                const Icon(
                  Icons.lock,
                  size: 80,
                  color: Colors.blue,
                ),
                const SizedBox(height: 20), //provides space between two widgets

                const Text(
                  "Welcome to Sign Up Screen",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                CustomTextField(
                  hintText: "Email",
                  icon: Icons.email,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  hintText: "Password",
                  icon: Icons.lock,
                  isPassword: true,
                ),

                const SizedBox(height: 24),
                CustomTextField(
                  hintText: "Confirm Password",
                  icon: Icons.lock,
                  isPassword: true,
                ),

                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {
                    // login logic later

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 16),
                  ),
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
