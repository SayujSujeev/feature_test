import 'package:flutter/material.dart';
import 'app_colors.dart';
import '../constants/app_constants.dart';

class AppTextStyles {
  // Heading Styles
  static const TextStyle headingLarge = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.10,
    fontFamily: AppConstants.fontFamily,
  );
  
  // Button Styles
  static const TextStyle buttonPrimary = TextStyle(
    color: AppColors.background,
    fontSize: 16,
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w600,
    height: 1.20,
  );
  
  // Search Input Styles
  static const TextStyle searchHint = TextStyle(
    color: AppColors.textTertiary,
    fontSize: 16,
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w400,
    height: 1.20,
  );
  
  static const TextStyle searchInput = TextStyle(
    color: AppColors.textTertiary,
    fontSize: 16,
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w400,
    height: 1.20,
  );
  
  // Chat List Styles
  static const TextStyle chatName = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: AppColors.textPrimary,
    fontFamily: AppConstants.fontFamily,
  );
  
  static const TextStyle chatTimestamp = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    fontFamily: AppConstants.fontFamily,
  );
  
  static const TextStyle chatLastMessage = TextStyle(
    color: AppColors.textLight,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstants.fontFamily,
  );
  
  static const TextStyle unreadCount = TextStyle(
    color: AppColors.white,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: AppConstants.fontFamily,
  );
} 