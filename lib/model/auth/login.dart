// login_screen.dart
import 'package:cricket_scoreboard/NavigateRole.dart';
import 'package:cricket_scoreboard/model/auth/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/authService.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                User? user;
                try {
                  User? user = await AuthService().logIn(
                   emailController.text,
                    passwordController.text,
                  );
                 
                } catch (e) {
                  print(e);
                }
 
                if (user != null) {
                  // Navigate to the next screen or perform other actions
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NavigateThroughRole()),
                  );
                } else {
                  // Show an error message
                }
              },
              child: Text('Log In'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Text("Sign up ?"),
            ),
          ],
        ),
      ),
    );
  }
}
