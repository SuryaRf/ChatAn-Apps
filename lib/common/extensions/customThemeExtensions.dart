import 'package:chaten/common/utils/colors.dart';
import 'package:flutter/material.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtensions get theme {
    return Theme.of(this).extension<CustomThemeExtensions>()!;
  }
}

class CustomThemeExtensions extends ThemeExtension<CustomThemeExtensions> {
  static final lightMode = CustomThemeExtensions(
    circleImageColor: Colors.blueAccent,
    greyColor: Colors.grey,
    blueColor: Colors.blueAccent,
    langBtnBgColor: const Color.fromARGB(226, 255, 255, 255),
    langBtnHighlightColor: Color.fromARGB(248, 255, 255, 255),
    authAppbarTextColor: Coloors.lightBlue,
    photoIconBgColor: Color(0xFFF0F2F3),
    photoIconColor: Color(0xFF9DAAB3),

  );
  static final darkMode = CustomThemeExtensions(
      circleImageColor: Colors.blueAccent,
      greyColor: Colors.grey,
      blueColor: Colors.blueAccent,
      langBtnBgColor: const Color.fromARGB(225, 39, 39, 39),
      langBtnHighlightColor: const Color.fromARGB(225, 39, 39, 39),
      authAppbarTextColor: const Color(0xFFE9EDEF),
      photoIconBgColor: Color(0xFF283339),
      photoIconColor: Color(0xFF61717B),
      );
  final Color? circleImageColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? langBtnBgColor;
  final Color? langBtnHighlightColor;
  final Color? authAppbarTextColor;
  final Color? photoIconBgColor;
  final Color? photoIconColor;

  CustomThemeExtensions({
    this.circleImageColor,
    this.greyColor,
    this.blueColor,
    this.langBtnBgColor,
    this.langBtnHighlightColor,
    this.authAppbarTextColor,
    this.photoIconBgColor,
    this.photoIconColor,
  });
  @override
  ThemeExtension<CustomThemeExtensions> copyWith({
    Color? circleImageColor,
    Color? greyColor,
    Color? blueColor,
    Color? langBtnBgColor,
    Color? langBtnHighlightColor,
    Color? authAppbarTextColor,
    Color? photoIconBgColor,
    Color? photoIconColor,

  }) {
    return CustomThemeExtensions(
      circleImageColor: circleImageColor ?? this.circleImageColor,
      greyColor: circleImageColor ?? this.greyColor,
      blueColor: circleImageColor ?? this.blueColor,
      langBtnBgColor: circleImageColor ?? this.langBtnBgColor,
      langBtnHighlightColor: circleImageColor ?? this.langBtnHighlightColor,
      authAppbarTextColor: authAppbarTextColor ?? this.authAppbarTextColor,
      photoIconBgColor: photoIconBgColor?? this.photoIconBgColor,
      photoIconColor: photoIconColor?? this.photoIconColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtensions> lerp(
      covariant ThemeExtension<CustomThemeExtensions>? other, double t) {
    if (other is! CustomThemeExtensions) return this;
    {
      return CustomThemeExtensions(
        circleImageColor:
            Color.lerp(circleImageColor, other.circleImageColor, t),
        greyColor: Color.lerp(greyColor, other.greyColor, t),
        blueColor: Color.lerp(blueColor, other.blueColor, t),
        langBtnBgColor: Color.lerp(langBtnBgColor, other.langBtnBgColor, t),
        photoIconBgColor: Color.lerp(photoIconBgColor, other.photoIconBgColor, t),
        photoIconColor: Color.lerp(photoIconColor, other.photoIconColor, t),
         authAppbarTextColor: Color.lerp(authAppbarTextColor, other.authAppbarTextColor, t),
        langBtnHighlightColor:
            Color.lerp(langBtnHighlightColor, other.langBtnHighlightColor, t),
      );
    }
  }
}
