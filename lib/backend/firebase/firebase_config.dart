import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCfX7SGEsDd9aZ2_JGnihwsBHVXY-Gy-po",
            authDomain: "iconic-54951.firebaseapp.com",
            projectId: "iconic-54951",
            storageBucket: "iconic-54951.appspot.com",
            messagingSenderId: "852801047875",
            appId: "1:852801047875:web:339413971ee17e5c0333f6",
            measurementId: "G-0T7DFS12MS"));
  } else {
    await Firebase.initializeApp();
  }
}
