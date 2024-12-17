import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC3xEeoNZvGWu6eVUNMOawMPO4JrlqyiSw",
            authDomain: "ceritarakyat-7422d.firebaseapp.com",
            projectId: "ceritarakyat-7422d",
            storageBucket: "ceritarakyat-7422d.firebasestorage.app",
            messagingSenderId: "702585449108",
            appId: "1:702585449108:web:e95e92ba5b284406376281",
            measurementId: "G-5Z1MH9379Q"));
  } else {
    await Firebase.initializeApp();
  }
}
