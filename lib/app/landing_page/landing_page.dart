import 'package:flutter/material.dart';
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/SignIn');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/runway-512-logo.png',
                width: 200, height: 200.0),
            const SizedBox(height: 20),
            const SizedBox(
              width: 36,
              height: 36,
              child: CircularProgressIndicator(),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
