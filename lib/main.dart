import 'package:cricket_scoreboard/NavigateRole.dart';
import 'package:cricket_scoreboard/model/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'services/databaseFunctions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: const TextTheme(
              displayLarge: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              bodyMedium: TextStyle(fontSize: 18, color: Colors.black),
              displayMedium: TextStyle(fontSize: 20, color: Colors.black)),
        ),
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Database db = Database();
    // print(db.getTodayAllMatches());
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavigateThroughRole();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
