import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  AppFonts._();

  static TextStyle asapRegular(double size, [Color? color]) {
    return GoogleFonts.asap(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle asapSemiBold(double size, [Color? color]) {
    return GoogleFonts.asap(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle asapBold(double size, [Color? color]) {
    return GoogleFonts.asap(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    );
  }
}
