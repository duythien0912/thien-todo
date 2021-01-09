// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static Color primaryColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }

  static Color buttonColor(BuildContext context) {
    return Theme.of(context).buttonColor;
  }

  static TextStyle subtitle1(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1;
  }

  static TextStyle todoTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1.copyWith(
          fontSize: 18,
        );
  }

  static TextStyle headline(BuildContext context) {
    return Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle headline5(BuildContext context) {
    return Theme.of(context).textTheme.headline5;
  }

  static TextStyle bodyText2(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2;
  }

  static ThemeData appThemeData(BuildContext context) {
    return ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        // primarySwatch: Colors.cyan,
        primaryColor: const Color(0xFF3c5ccf));
  }

  static const iosScroll = BouncingScrollPhysics();
  static const androidScroll = ClampingScrollPhysics();
  static const neverScrollableScroll = NeverScrollableScrollPhysics();
  static const alwaysScrollableScroll = AlwaysScrollableScrollPhysics();

  static const paddingAll4 = EdgeInsets.all(4.0);
  static const paddingAll6 = EdgeInsets.all(6.0);
  static const paddingAll8 = EdgeInsets.all(8.0);
  static const paddingAll12 = EdgeInsets.all(12.0);
  static const paddingAll16 = EdgeInsets.all(16.0);
  static const paddingAll24 = EdgeInsets.all(24.0);
  static const paddingAll32 = EdgeInsets.all(32.0);

  static const paddingW4 = EdgeInsets.symmetric(horizontal: 4.0);
  static const paddingW8 = EdgeInsets.symmetric(horizontal: 8.0);
  static const paddingW12 = EdgeInsets.symmetric(horizontal: 12.0);
  static const paddingW16 = EdgeInsets.symmetric(horizontal: 16.0);
  static const paddingW32 = EdgeInsets.symmetric(horizontal: 32.0);

  static const paddingH4 = EdgeInsets.symmetric(vertical: 4.0);
  static const paddingH6 = EdgeInsets.symmetric(vertical: 6.0);
  static const paddingH8 = EdgeInsets.symmetric(vertical: 8.0);
  static const paddingH12 = EdgeInsets.symmetric(vertical: 12.0);
  static const paddingH16 = EdgeInsets.symmetric(vertical: 16.0);
  static const paddingH32 = EdgeInsets.symmetric(vertical: 32.0);

  static const Widget Box = SizedBox(height: 0, width: 0);

  static const Widget BoxH128 = SizedBox(height: 128);
  static const Widget BoxH72 = SizedBox(height: 72);
  static const Widget BoxH64 = SizedBox(height: 64);
  static const Widget BoxH56 = SizedBox(height: 56);
  static const Widget BoxH44 = SizedBox(height: 44);
  static const Widget BoxH32 = SizedBox(height: 32);
  static const Widget BoxH24 = SizedBox(height: 24);
  static const Widget BoxH16 = SizedBox(height: 16);
  static const Widget BoxH20 = SizedBox(height: 20);
  static const Widget BoxH12 = SizedBox(height: 12);
  static const Widget BoxH10 = SizedBox(height: 10);
  static const Widget BoxH8 = SizedBox(height: 8);
  static const Widget BoxH5 = SizedBox(height: 5);
  static const Widget BoxH4 = SizedBox(height: 4);
  static const Widget BoxH2 = SizedBox(height: 2);

  static const Widget BoxW72 = SizedBox(width: 72);
  static const Widget BoxW32 = SizedBox(width: 32);
  static const Widget BoxW16 = SizedBox(width: 16);
  static const Widget BoxW12 = SizedBox(width: 12);
  static const Widget BoxW8 = SizedBox(width: 8);
  static const Widget BoxW6 = SizedBox(width: 6);
  static const Widget BoxW4 = SizedBox(width: 4);
  static const Widget BoxW2 = SizedBox(width: 2);
}
