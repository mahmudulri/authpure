import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zest_betting_tips/auth.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authService.handleSignIn();
          },
          child: Text("Sign In With Google"),
        ),
      ),
    );
  }
}
