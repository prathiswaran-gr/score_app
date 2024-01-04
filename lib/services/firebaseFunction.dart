import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {
   Future<void> saveUser(String uname, email, uid, role) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'uid':uid,'email': email, 'username': uname.toUpperCase(), 'role':role});
         await FirebaseAuth.instance.currentUser!.updateDisplayName(uname);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
  }
}
