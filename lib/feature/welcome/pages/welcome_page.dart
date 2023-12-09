import 'package:chaten/common/extensions/customThemeExtensions.dart';
import 'package:chaten/common/widgets/customElevatedButton.dart';
import 'package:chaten/feature/welcome/pages/widgets/languageButton.dart';
import 'package:chaten/feature/welcome/pages/widgets/privacyAndTerms.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Align(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Image.asset(
                  'assets/icon/icon.png',
                  color:context.theme.circleImageColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Welcome to ChatAn',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const PrivacyAndTerms(),
                CustomElevatedButton(onPressed: (){},text: 'AGREE AND CONTINUE',),
                const SizedBox(
                  height: 40,
                ),
                const LanguageButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}



