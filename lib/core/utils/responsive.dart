import 'package:flutter/material.dart';

/// Breakpoints aligned with Material adaptive layout guidance.
abstract final class Breakpoints {
  static const compact = 600.0;
  static const medium = 840.0;
  static const expanded = 1200.0;
}

enum ScreenSize { compact, medium, expanded }

extension ResponsiveContext on BuildContext {
  ScreenSize get screenSize {
    final width = MediaQuery.sizeOf(this).width;
    if (width >= Breakpoints.expanded) return ScreenSize.expanded;
    if (width >= Breakpoints.medium) return ScreenSize.medium;
    return ScreenSize.compact;
  }

  bool get isCompact => screenSize == ScreenSize.compact;
  bool get isMediumOrLarger => screenSize != ScreenSize.compact;
  bool get isExpanded => screenSize == ScreenSize.expanded;

  double responsiveValue({
    required double compact,
    double? medium,
    double? expanded,
  }) {
    return switch (screenSize) {
      ScreenSize.compact => compact,
      ScreenSize.medium => medium ?? compact,
      ScreenSize.expanded => expanded ?? medium ?? compact,
    };
  }
}
