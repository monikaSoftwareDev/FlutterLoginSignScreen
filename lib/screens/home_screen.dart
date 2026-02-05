

import 'package:flutter/material.dart';
import 'package:sign_up_app/screens/login_screen.dart';
import 'package:sign_up_app/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  Icons.home_filled,
                  size: 80,
                  color: Color.fromARGB(255, 141, 228, 11),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Welcome to the Home",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () async {
                    final authService = AuthService();

                    await authService.signOut();

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("SignOut", style: TextStyle(fontSize: 16)),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
