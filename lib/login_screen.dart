import 'package:flutter/material.dart';
import 'package:mis_project/user_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool warnMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "assets/header.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Central Authentication Service\n(CAS)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Username",
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Checkbox(
                        value: warnMe,
                        onChanged: (val) {
                          setState(() {
                            warnMe = val ?? false;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          "Warn me before logging me into other sites.",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          _usernameController.clear();
                          _passwordController.clear();
                        },
                        child: const Text("CLEAR"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_usernameController.text.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserHomeScreen(
                                  username: _usernameController.text,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Внесете Username")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                        ),
                        child: const Text("LOGIN"),
                      ),

                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "For security reasons, please Log Out and Exit your web browser when you are done accessing services that require authentication!\n\n"
                        "For password reset, login problem or technical assistance, visit Services for Students of the FCSE.\n\n"
                        "The Central Authentication Service enables login to multiple web sites with a single input of your FCSE username and password. After your credentials are checked successfully, you are given a ticket to use for login to all web sites that CAS. Pay attention: the login ticket is held within your browser's temporary memory until you close all browser windows (or deliberately delete browser's privacy settings and session)."
                        "This service is to be used only by students and employees of the FCSE. The username for students is the dossier number (students from the FNSM have a dossier number in the form 12345, and for students from the FEEIT in the form 123410).",
                    style: TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Language: "),
                    Text("English", style: TextStyle(color: Colors.blue)),
                    Text(" | "),
                    Text("Macedonian", style: TextStyle(color: Colors.blue)),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Copyright © 2005 - 2012 Jasig, Inc. All rights reserved.",
                  style: TextStyle(fontSize: 11, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
