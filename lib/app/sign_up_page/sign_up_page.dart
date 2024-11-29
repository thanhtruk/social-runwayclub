import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Lấy theme của app
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.25),
              Image.asset('assets/images/runway-512-logo.png',
                  width: 75, height: 75),
              const SizedBox(height: 20),
              Text(
                "Sign up for Runway Club",
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(300, 40),
                  ),
                  icon: const Icon(Icons.facebook),
                  label: const Text("Sign up with Facebook")),
              const SizedBox(height: 5),
              OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(300, 40),
                  ),
                  icon: Image.asset(
                    'assets/images/icon-github.png',
                    width: 20,
                    height: 20,
                    color: theme.colorScheme.primary,
                  ),
                  label: const Text("Sign up with github")),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(color: theme.colorScheme.onBackground)),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/SignIn');
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                        "By creating an account, you agree to Runway's "),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/TermsOfUse');
                      },
                      child: Text(
                        "TERMS OF USE",
                        style: TextStyle(
                          color: theme.colorScheme.onBackground,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
