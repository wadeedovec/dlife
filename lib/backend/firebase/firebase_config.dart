import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCEV6XSqGFL22SG_4paZQvbZ3jfAl_Efe8",
            authDomain: "d-life-admin-panel-fusz0w.firebaseapp.com",
            projectId: "d-life-admin-panel-fusz0w",
            storageBucket: "d-life-admin-panel-fusz0w.appspot.com",
            messagingSenderId: "906574373905",
            appId: "1:906574373905:web:7be37097e6d9c264733db0"));
  } else {
    await Firebase.initializeApp();
  }
}
