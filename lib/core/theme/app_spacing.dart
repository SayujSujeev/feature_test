import 'package:flutter/material.dart';

class AppSpacing {
  // Padding Values
  static const EdgeInsets paddingSmall = EdgeInsets.all(8);
  static const EdgeInsets paddingMedium = EdgeInsets.all(16);
  static const EdgeInsets paddingLarge = EdgeInsets.all(24);
  
  // Horizontal Padding
  static const EdgeInsets paddingHorizontalSmall = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets paddingHorizontalMedium = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets paddingHorizontalLarge = EdgeInsets.symmetric(horizontal: 24);
  
  // Vertical Padding
  static const EdgeInsets paddingVerticalSmall = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets paddingVerticalMedium = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets paddingVerticalLarge = EdgeInsets.symmetric(vertical: 24);
  
  // Specific Padding Values
  static const EdgeInsets headerPadding = EdgeInsets.only(
    left: 16,
    right: 16,
    top: 16,
    bottom: 24,
  );
  
  static const EdgeInsets searchPadding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 12,
  );
  
  static const EdgeInsets chatTilePadding = EdgeInsets.only(
    left: 8,
    right: 16,
    top: 16,
    bottom: 16,
  );
  
  static const EdgeInsets chatListPadding = EdgeInsets.symmetric(
    vertical: 24,
    horizontal: 16,
  );
  
  // Spacing Values
  static const double spacingXS = 4;
  static const double spacingS = 8;
  static const double spacingM = 16;
  static const double spacingL = 24;
  static const double spacingXL = 32;
  
  // SizedBox Helpers
  static const SizedBox spaceXS = SizedBox(height: spacingXS);
  static const SizedBox spaceS = SizedBox(height: spacingS);
  static const SizedBox spaceM = SizedBox(height: spacingM);
  static const SizedBox spaceL = SizedBox(height: spacingL);
  static const SizedBox spaceXL = SizedBox(height: spacingXL);
  
  static const SizedBox spaceHorizontalXS = SizedBox(width: spacingXS);
  static const SizedBox spaceHorizontalS = SizedBox(width: spacingS);
  static const SizedBox spaceHorizontalM = SizedBox(width: spacingM);
  static const SizedBox spaceHorizontalL = SizedBox(width: spacingL);
  static const SizedBox spaceHorizontalXL = SizedBox(width: spacingXL);
} 