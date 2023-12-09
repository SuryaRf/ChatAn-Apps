import 'package:chaten/common/theme/darkTheme.dart';
import 'package:chaten/common/theme/lightTheme.dart';
import 'package:chaten/feature/welcome/pages/auth/pages/userInfoPage.dart';
import 'package:chaten/feature/welcome/pages/auth/pages/verificationPage.dart';
import 'package:chaten/feature/welcome/pages/welcome_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
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
      home: const UserInfoPage(),
    );
  }
}
