import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> auth() async {
    UserCredential userCredential = await _auth.signInAnonymously();
    return userCredential.user?.uid;
  }
}
