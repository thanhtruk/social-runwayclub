import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class GithubAuthentication extends StatefulWidget {
  const GithubAuthentication({super.key});

  @override
  _GithubAuthenticationState createState() => _GithubAuthenticationState();
}

class _GithubAuthenticationState extends State<GithubAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      height: 60,
      child: SignInButton(Buttons.gitHub, onPressed: () async {
        try {
          UserCredential userCredential = await signInWithGitHub();
          if (context.mounted) {
            print(userCredential);
            Navigator.pushNamed(context, '/News');
          }
        } catch (e) {
          print(e);
        }
      }),
    );
  }

  Future<UserCredential> signInWithGitHub() async {
    // Create a new provider
    GithubAuthProvider githubProvider = GithubAuthProvider();

    return await FirebaseAuth.instance.signInWithProvider(githubProvider);
  }

  Future<void> signOutWithGitHub() async {
    await FirebaseAuth.instance.signOut();
  }
}
