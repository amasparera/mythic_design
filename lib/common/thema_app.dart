import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color titleActive = Color(0xff222222);
const Color body = Color(0xff333333);
const Color label = Color(0xff555555);
const Color placeholder = Color(0xff888888);
const Color line = Color(0xffDCDCDC);
const Color inputBacgroud = Color(0xffF0F0F0);
const Color greyScaleBackgroud = Color(0xffD9DBE9);
const Color offWhite = Color(0xffFCFCFC);

const LinearGradient gradientAccent = LinearGradient(
    colors: [Color(0xff0000F6), Color(0xff9041FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

ThemeData thmeaSiang() {
  return ThemeData.light().copyWith(
    appBarTheme: _themaAppBar(),
    scaffoldBackgroundColor: greyScaleBackgroud,
    textTheme: GoogleFonts.epilogueTextTheme(),
  );
}

AppBarTheme _themaAppBar() {
  return AppBarTheme(backgroundColor: offWhite, iconTheme: _themaIcon());
}

IconThemeData _themaIcon() {
  return const IconThemeData(color: body);
}
