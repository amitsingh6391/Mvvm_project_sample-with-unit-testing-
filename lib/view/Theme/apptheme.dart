import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

//we will define our Apptheme class for definign our app themes;
class Apptheme {
  final BuildContext context;
  Apptheme(this.context);

  static const backgroundColor = Color(0xffffffff);
  static const lightbuttonColor = Color(0xffF6AFD4);

  static const primaryColor = Color(0xffed60a9);
  static const assentColor = Color(0xff101010);

  static const secondaryColor = Color.fromRGBO(
    128,
    141,
    241,
    0.12,
  );

  TextStyle boldText = GoogleFonts.poppins(
    color: assentColor,
    fontWeight: FontWeight.w500,
  );
  TextStyle thinText = GoogleFonts.poppins(
    color: assentColor,
    fontWeight: FontWeight.w100,
  );
  TextStyle normalText = GoogleFonts.poppins(
    color: assentColor,
    fontWeight: FontWeight.w300,
  );
  TextStyle lightboldText = GoogleFonts.poppins(
    color: assentColor,
    fontWeight: FontWeight.w400,
  );

  static const chatlightColor = Color(0xffF3F3F3);

  static ThemeData theme = ThemeData(
    primaryTextTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 10,
      ),
      bodyText2: TextStyle(
        fontSize: 5,
      ),
    ),
    accentIconTheme: const IconThemeData(
      color: primaryColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: "Circular_Bold",
    accentColor: primaryColor,
    buttonColor: primaryColor,
    appBarTheme: const AppBarTheme(
      elevation: 3,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
      ),
      color: backgroundColor,
      centerTitle: false,
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: Colors.black,
        opacity: 18,
        size: 25,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 12.0,
        ),
        headline6: TextStyle(
          fontSize: 25.0,
          fontStyle: FontStyle.italic,
        ),
        bodyText2: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Hind',
        ),
      ),
    ),
    toggleableActiveColor: primaryColor,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
      labelStyle: TextStyle(
        color: Color(0xff253157),
      ),
      hintStyle: TextStyle(
        color: Color(0xff253157),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
  );
}
