import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/profile/profile.dart';
import 'utils/app_routes.dart';
import 'screens/laws/laws_screen.dart';
import 'screens/contacts/contacts.dart';
import 'screens/onboarding/profile_setup_screen.dart';

class HifazatApp extends StatelessWidget {
  const HifazatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.signup: (context) => const SignupScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.profile: (context) => const ProfileScreen(),
        AppRoutes.laws: (context) => const LawsScreen(),
        AppRoutes.contacts: (context) => const ContactsScreen(),
        AppRoutes.profileSetup: (context) => const ProfileSetupScreen(),
      },
    );
  }
}
