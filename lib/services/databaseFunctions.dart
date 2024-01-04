

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_scoreboard/model/MatchDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class Database{
  CollectionReference matches = FirebaseFirestore.instance.collection("Matches");
String getUserId() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

   String getDateFormat() {
    DateFormat df = DateFormat("dd-MM-yyyy");
    return df.format(DateTime.now());
  }

Future<void> getTodayAllMatches() async {
  String todayDate = getDateFormat();

  List<dynamic> list = [];
  var allMatches =
          await matches.doc("matchDocumentId").collection(getDateFormat()).doc(getDateFormat()+"Id").get();
          // List<dynamic> result = allMatches.data() As Map<>;
          // await allMatches.then((value) => defaulterMap = value.data());

}

         

Future<void> addMatchDetails() async{
  MatchDetails matchDetails1 = MatchDetails(matchName: "abc", date: getDateFormat(), time: "8:00 AM", opponent1: "India", opponent2: "Pakistan");
  MatchDetails matchDetails2 = MatchDetails(matchName: "caa", date: getDateFormat(), time: "8:00 AM", opponent1: "India", opponent2: "Pakistan");
  dynamic json1 = matchDetails1.toJson();
  dynamic json2 = matchDetails2.toJson();
  
  List<Map<String,dynamic>> list = [];
 
    list.add(json1);
    list.add(json2);
  
  // print(getDateFormat());
  await matches.doc("matchDocumentId").collection(getDateFormat()).doc(getDateFormat()+"Id").set({"matches":list});
} 
}