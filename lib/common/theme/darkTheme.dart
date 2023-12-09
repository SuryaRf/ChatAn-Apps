import 'package:chaten/common/extensions/customThemeExtensions.dart';
import 'package:flutter/material.dart';
import 'package:chaten/common/utils/colors.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      // ignore: deprecated_member_use
      backgroundColor: const Color(0xFF111B21),
      scaffoldBackgroundColor: Color(0xFF111B21),
      extensions: [
        CustomThemeExtensions.darkMode,
      ],
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 18),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light
        )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 99, 156, 255),
            foregroundColor: Color.fromARGB(31, 0, 0, 0),
            splashFactory: NoSplash.splashFactory,
            elevation: 0,
            shadowColor: Colors.transparent),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Coloors.greyBackground,
        modalBackgroundColor: Color.fromARGB(255, 173, 210, 235),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          )
        )
      ), 
      dialogBackgroundColor:  Coloors.greyBackground,
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      );
}
