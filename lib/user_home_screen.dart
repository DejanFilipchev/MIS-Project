import 'package:flutter/material.dart';
import 'package:mis_project/logout_screen.dart';
import 'package:mis_project/my_requests_screen.dart';
import 'package:mis_project/new_request_screen.dart';
import 'package:mis_project/request_storage.dart';

class UserHomeScreen extends StatelessWidget {
  final String username;

  const UserHomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/header.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                ],
              ),

              Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                    label: Text(username),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyRequestsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.list_alt),
                    label: const Text("Мои Барања"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),

                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final newRequest = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NewRequestScreen()),
                      );

                      if (newRequest != null) {
                        RequestStorage().addRequest(newRequest);
                      }
                    },
                    icon: const Icon(Icons.note_add),
                    label: const Text("Ново Барање"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),

                  const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LogoutScreen()),
                        );
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text("Одјава"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),

                ],
              ),

              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "© 2025 - Факултет за Информатички Науки и Компјутерско Инженерство",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
