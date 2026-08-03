import 'package:flutter/material.dart';

class ResponsiveLayout {
  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 700;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= 700 && width < 1200;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 1200;
  }
}
