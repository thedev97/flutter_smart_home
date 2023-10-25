import 'sh_colors.dart';
import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class SHTextStyles {
  static final TextStyle header = GoogleFonts.gruppo(
      fontWeight: FontWeight.w800,
      color: Colors.white,
      fontSize: 15.sp);

  static final TextStyle buttonText =GoogleFonts.lato(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      shadows: [
        const Shadow(
            color: Colors.black, offset: Offset(0.0, 0.2), blurRadius: 0.2),
      ],
      fontSize: 12.sp);

  static final TextStyle normalText =GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      color: SHColors.textColor,
      shadows: [
        const Shadow(
            color: Colors.blueGrey, offset: Offset(0.0, 0.2), blurRadius: 0.2),
      ],
      fontSize: 10.sp);

  static final TextStyle normalText2 =GoogleFonts.lato(
      fontWeight: FontWeight.w700,
      color: SHColors.textColor,
      shadows: [
        const Shadow(
            color: Colors.black, offset: Offset(0.0, 0.2), blurRadius: 0.2),
      ],
      fontSize: 12.sp);

  static final TextStyle boldText =GoogleFonts.lato(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      shadows: [
        const Shadow(
            color: Colors.black, offset: Offset(0.0, 0.2), blurRadius: 0.2),
      ],
      fontSize: 20.sp);
}