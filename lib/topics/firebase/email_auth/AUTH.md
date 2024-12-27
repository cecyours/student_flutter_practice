# install
    flutter pub add firebase_auth
    flutter pub add google_sign_in
 
    first add your app in Firebase

    code for signup
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ); 

    code for login
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    check user is already logged in or not
    User? user = await FirebaseAuth.instance.currentUser;