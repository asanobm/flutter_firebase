import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/states/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

final UserService userService = UserService(FirebaseFirestore.instance.collection('Users'));

class UserService {

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final CollectionReference collection;

  DocumentReference _document;

  UserService(this.collection) {
    this._document = collection.doc(user.uid);
  }

  // Sign in with Google
  Future<User> signInWithGoogle() async {
    GoogleSignInAccount currentUser = this._googleSignIn.currentUser;
    if(currentUser == null) {
      currentUser = await this._googleSignIn.signIn();
    } else {
      return null;
    }
    GoogleSignInAuthentication googleAuth = await currentUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    return (await firebaseAuth.signInWithCredential(credential)).user;
  }

  // update user display name.
  void updateDisplayName(String displayName) {

  }
}