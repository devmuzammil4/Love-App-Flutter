
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_course/1st.dart';
import 'package:firebase_course/login.dart';
import 'package:flutter/material.dart';

// ✅ Main Function
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase Init
  runApp(const GiftApp());
}

class GiftApp extends StatelessWidget {
  const GiftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ✅ Agar user login hai to 1st.dart open hoga warna login.dart
      home: const AuthWrapper(),
    );
  }
}

// ✅ Ye widget decide karega login ya home screen
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(), // User state listen karega
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // Loading
        }
        if (snapshot.hasData) {
          return Screen1(); // Agar user login hai to home
        }
        return const LoginOne(); // Agar user login nahi hai to login screen
      },
    );
  }
}
