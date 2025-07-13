import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCLwwHjd5hl0NiS5V23xYyC4dMLwZ7oLic",
            authDomain: "voixr-ai.firebaseapp.com",
            projectId: "voixr-ai",
            storageBucket: "voixr-ai.firebasestorage.app",
            messagingSenderId: "211748842595",
            appId: "1:211748842595:web:18b61afdacba427236dc56",
            measurementId: "G-JXW9L9R34F"));
  } else {
    await Firebase.initializeApp();
  }
}
