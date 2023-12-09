

import 'package:chaten/common/extensions/customThemeExtensions.dart';
import 'package:flutter/material.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Read Our ',
          style: TextStyle(
            color: context.theme.greyColor,
          ),
          children: [
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                color: context.theme.blueColor,
              ),
            ),
            TextSpan(
              text: 'Tap "Agree and continue" to accept the ',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 140, 255),
              ),
            ),
            TextSpan(
              text: 'Terms of Services',
              style: TextStyle(
                color: context.theme.blueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
