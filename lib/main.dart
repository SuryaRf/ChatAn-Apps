import 'package:chaten/common/routes/routes.dart';
import 'package:chaten/common/theme/darkTheme.dart';
import 'package:chaten/common/theme/lightTheme.dart';
import 'package:chaten/feature/welcome/pages/auth/pages/userInfoPage.dart';
import 'package:chaten/feature/welcome/pages/auth/pages/verificationPage.dart';
import 'package:chaten/feature/welcome/pages/welcome_page.dart';
import 'package:chaten/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatAn',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const WelcomePage(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
