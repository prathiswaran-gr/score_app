import 'package:cricket_scoreboard/services/authService.dart';
import 'package:cricket_scoreboard/model/MatchDetails.dart';
import 'package:cricket_scoreboard/services/databaseFunctions.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'MatchAbout.dart';
import '../matchCard.dart';

class BasicUserHomePage extends StatefulWidget {
  const BasicUserHomePage({super.key});

  @override
  State<BasicUserHomePage> createState() => _BasicUserHomePageState();
}


class _BasicUserHomePageState extends State<BasicUserHomePage> {
   Map<String,dynamic>? map;
  @override
  Future<void> initState() async {
    // TODO: implement initState
    super.initState();
     Database db = new Database();
    final Future<Map<String, dynamic>> upcommingMatchesList =
        db.getUpcommingMatches();
        Map<String,dynamic> map = await upcommingMatchesList;
        print(map);
  }
  @override
  Widget build(BuildContext context) {
    List<dynamic> matchList = [];
   List<dynamic> list = [];
    AuthService service = AuthService();
   print(map);
    // print(upcommingMatchesList);
    // return DefaultTabController(
    // length: 2,
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
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
                  service.logOut();
                  Navigator.pop(context);
                  // Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Current Matches'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // TabBar(labelColor: Colors.black, tabs: [
              //   Tab(
              //     text: "LIVE",
              //   ),
              //   Tab(
              //     text: "UPCOMING",
              //   ),
              // ]),
              // Expanded(
              //   child: TabBarView(
              //     children: [
              //       Container( color: Colors.black,),
              //       Container(
              //         child: ListView(
              //           children: matchList
              //               .map((match) => GestureDetector(
              //                   onTap: () {
              //                     print("pressed");
              //                   },
              //                   child: MatchCard(matchDetails: match)))
              //               .toList(),
              //         ),
              //       )
              //     ],
              //   ),
              // )
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:3,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MatchAbout()),
                      );
                    },
                    child: Card(
                      child: Center(
                          child: Text('scrollable match details section')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
    // );
  }
}
