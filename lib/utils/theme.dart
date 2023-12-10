import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp_flutter/utils/app_colors.dart';

ThemeData appTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColor.primary,
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
);
