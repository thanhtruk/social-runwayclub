import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../../widgets/navigation_bar.dart';
import 'app/landing_page/landing_page.dart';
import 'app/reading_list_page/reading_list_page.dart';
import 'app/sign_in_page/sign_in_page.dart';
import 'app/sign_up_page/sign_up_page.dart';
import 'app/terms_of_use_page/terms_of_use_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 66, 110, 240),
            // primary: Color.fromARGB(255, 31, 83, 213),
            // secondary: Color.fromARGB(255, 140, 144, 165),
            background: const Color.fromARGB(255, 250, 244, 255)),
      ),
      home: const LandingPage(),
      routes: {
        '/SignIn': (context) => const SignInPage(),
        '/SignUp': (context) => const SignUpPage(),
        '/News': (context) => const NavigationBarApp(),
        '/TermsOfUse': (context) => const TermsOfUsePage(),
        '/readingList': (context) => ReadingListPage(),
      },
    );
  }
}
