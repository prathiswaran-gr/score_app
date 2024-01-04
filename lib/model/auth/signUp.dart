// signup_screen.dart
import 'package:cricket_scoreboard/NavigateRole.dart';
import 'package:cricket_scoreboard/model/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/authService.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  String role = 'Basic user';
  var roleTypes = [
    'Basic user',
    'Admin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userNameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height:60,
                child: DropdownButton<String>(
                  hint: Text(role),
                  items: roleTypes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newVal) {
                    setState(() {
                       role = newVal!;
                    });
                   
                  },
                ),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                User? user = await AuthService().signUp(userNameController.text,
                    emailController.text, passwordController.text, role);
                if (user != null) {
                  // Navigate to the next screen or perform other actions
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigateThroughRole(),
                    ),
                  );
                } else {
                  // Show an error message
                }
              },
              child: Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("Sign In ?"),
            )
          ],
        ),
      ),
    );
  }
}
