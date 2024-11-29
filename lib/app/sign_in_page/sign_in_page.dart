import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runway_club_social/github/onboarding_github.dart';

import '../sign_in_page/controller/sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController c = Get.put(SignInController());
    final theme = Theme.of(context); // Lấy theme của app
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  label: const Text("Login with Facebook")),
              const SizedBox(height: 5),
              const GithubAuthentication(),
              // OutlinedButton.icon(
              //     onPressed: () {},
              //     style: OutlinedButton.styleFrom(
              //       fixedSize: Size(300, 40),
              //     ),
              //     icon: Image.asset(
              //       'assets/images/icon-github.png',
              //       width: 20,
              //       height: 20,
              //       color: theme.colorScheme.primary,
              //     ),
              //     label: const Text("Login with github")),
              // const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 67,
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Or Continue with',
                    style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onBackground,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 67,
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 40,
                child: TextField(
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  onChanged: (text) {
                    // ignore: avoid_print
                    print("First text field: $text");
                  },
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 300,
                height: 40,
                child: TextField(
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (text) {
                    // ignore: avoid_print
                    print("First text field: $text");
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 207,
                    child: Obx(
                      () => CheckboxListTile(
                        title: const Text("Remember me"),
                        value: c.isChecked.value,
                        onChanged: (newValue) {
                          c.isChecked.value = newValue!;
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: const EdgeInsets.all(0),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Xử lý khi liên kết được nhấn
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              FilledButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/News');
                  },
                  child: const Text("Continue"),
                  style: OutlinedButton.styleFrom(fixedSize: Size(200, 40))),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?",
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(color: theme.colorScheme.onBackground)),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/SignUp');
                    },
                    child: Text(
                      " Create an account",
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
