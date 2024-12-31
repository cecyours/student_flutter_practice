# install
    flutter pub add firebase_auth
    flutter pub add google_sign_in
 
    first add your app in Firebase

# use the following code for signup and signout

// class GoogleSignInProvider {
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<User?> signInWithGoogle() async {
//     try {
//
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//
//       if (googleUser == null) return null;
//
//       final GoogleSignInAuthentication googleAuth =
//       await googleUser.authentication;
//
//
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//      
//      
//       final UserCredential userCredential =
//       await _auth.signInWithCredential(credential);
//
//       return userCredential.user;
//     } catch (e) {
//       print('Error signing in with Google: $e');
//       return null;
//     }
//   }
//
//
//
//   Future<void> signOut() async {
//     await _googleSignIn.signOut();
//     await _auth.signOut();
//   }
// }