import 'package:cricket_scoreboard/services/databaseFunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: ListView(children: [ ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_sharp,
              ),
              title: const Text('Logout', style: TextStyle(fontSize: 18)),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                // Navigator.pop(context);
              },
            ),],), ),
      appBar: AppBar(title: Text("Admin")),
      body: ElevatedButton(onPressed: () async{
        Database db = Database();

        await db.addMatchDetails();
      }, child: Text("Add sample data")),
    );
  }
}
