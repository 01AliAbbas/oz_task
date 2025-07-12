import 'package:flutter/material.dart';

/// App Text Styles
/// 
/// This class contains all the text styles used throughout the app.
/// Font: Roboto family (light & bold variants)
/// 
/// Text Scale:
/// - Header 1: 40 pt
/// - Header 2: 28 pt  
/// - Header 3: 25 pt
/// - Title 1: 19 pt
/// - Title 2: 16 pt
/// - Body: 13 pt
/// - Caption: 11 pt
class AppTextStyles {
  static const String _fontFamily = 'Roboto';

  // Header Styles
  static const TextStyle header1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static const TextStyle header2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static const TextStyle header3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  // Title Styles
  static const TextStyle title1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 19,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static const TextStyle title2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  // Body Styles
  static const TextStyle body = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  static const TextStyle bodyLight = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w300,
    height: 1.4,
  );

  static const TextStyle bodyBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.bold,
    height: 1.4,
  );

  // Caption Style
  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.normal,
    height: 1.3,
  );

  static const TextStyle captionLight = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w300,
    height: 1.3,
  );

  static const TextStyle captionBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.bold,
    height: 1.3,
  );
}

/// Extension to easily apply colors to text styles
extension AppTextStylesExtension on TextStyle {
  TextStyle get eazyBlue => copyWith(color: const Color(0xFF056780));
  TextStyle get primaryDark => copyWith(color: const Color(0xFF300151));
  TextStyle get darkGrey => copyWith(color: const Color(0xFF1A1B1E));
  TextStyle get mediumGrey => copyWith(color: const Color(0xFF474A54));
  TextStyle get grey => copyWith(color: const Color.fromARGB(255, 187, 187, 187));
  TextStyle get veryLightGrey => copyWith(color: const Color(0xFFE3E3E3));
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get black => copyWith(color: Colors.black);
  
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withOpacity(double opacity) => copyWith(color: color?.withOpacity(opacity));
}
