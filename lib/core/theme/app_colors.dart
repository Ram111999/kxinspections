import 'package:flutter/material.dart';

/// Design tokens for color. Extend as the UI grows.
abstract final class AppColors {
  static const primary = Color(0xFF16264D);
  static const primaryLight = Color(0xFF2E6DB4);
  static const secondary = Color(0xFF00A896);

  static const success = Color(0xFF2E7D32);
  static const warning = Color(0xFFF9A825);
  static const error = Color(0xFFC62828);
  static const info = Color(0xFF1565C0);

  static const outstanding = Color(0xFFE65100);
  static const accepted = Color(0xFF2E7D32);
  static const contested = Color(0xFF6A1B9A);
  static const paid = Color(0xFF37474F);

  static const surfaceLight = Color(0xFFF5F7FA);
  static const surfaceDark = Color(0xFF121212);
  static const cardLight = Colors.white;
  static const cardDark = Color(0xFF1E1E1E);

  // Brand

  static const Color primaryDark = Color(0xFF0E1A38);
  // links / "In Progress" chip / info icon

  // Surfaces
  static const Color background = Color(0xFFF7F8FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardMuted = Color(
    0xFFF3F4F6,
  ); // light grey task card background
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFEDEEF1);

  // Text
  static const Color textPrimary = Color(0xFF10131A);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);

  static const Color inProgress = Color(0xFF2F6FED); // In Progress

  // Banner
  static const Color bannerBackground = Color(0xFFFFFFFF);
  static const Color bannerBorder = Color(0xFFE5E7EB);
  static const Color bannerIcon = Color(0xFF16264D);

  /// Resolves a semantic status color for chips used throughout
  /// the Maintenance Hub (Completed, New, Outstanding, In Progress,
  /// Accepted, Contested, Paid).
  static Color forStatusLabel(String label) {
    switch (label.toLowerCase()) {
      case 'completed':
      case 'new':
      case 'accepted':
      case 'paid':
        return success;
      case 'outstanding':
      case 'contested':
        return error;
      case 'in progress':
        return inProgress;
      default:
        return textSecondary;
    }
  }
}
