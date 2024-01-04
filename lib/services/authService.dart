import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_scoreboard/services/firebaseFunction.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


Future<String?> getUserRole() async {
    User? user = _auth.currentUser;
    if (user != null) {
    
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      print(snapshot.get("role"));
      return snapshot.get('role');
    }
    return null;
  }

  Future<User?> signUp(String username, String email, String password, String role) async {
    try {
      final services = FirestoreServices();
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await services.saveUser( username, email, result.user!.uid,role);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> logIn(String email, String password) async {
  
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
