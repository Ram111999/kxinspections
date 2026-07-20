import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Section heading used above Inventory, Inspections and Open Tasks.
class MaintenanceSectionTitle extends StatelessWidget {
  const MaintenanceSectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(title, style: AppTextStyles.sectionTitle),
    );
  }
}
