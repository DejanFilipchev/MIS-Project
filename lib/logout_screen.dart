import 'package:flutter/material.dart';
import 'login_screen.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset(
              "assets/header.png",
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 40),

          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle_outline,
                      color: Colors.green, size: 80),
                  const SizedBox(height: 20),
                  const Text(
                    "Успешно се одјавивте!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                            (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(200, 50),
                    ),
                    child: const Text("Назад кон Најава"),
                  ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "© 2025 - Факултет за Информатички Науки и Компјутерско Инженерство",
              style: TextStyle(fontSize: 12, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
