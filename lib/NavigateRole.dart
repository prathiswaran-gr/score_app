import 'package:cricket_scoreboard/pages/adminHomePage.dart';
import 'package:cricket_scoreboard/services/authService.dart';
import 'package:cricket_scoreboard/pages/basicUserHome.dart';
import 'package:flutter/material.dart';
class NavigateThroughRole extends StatelessWidget {
  const NavigateThroughRole({super.key});

  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
      future: AuthService().getUserRole(),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            String? role = snapshot.data;

            // Example: Show different content based on the user's role
            if (role == 'Admin') {
              return AdminHomePage();
            } else {
              return BasicUserHomePage();
            }
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    ); 
  }
}