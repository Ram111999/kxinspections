import 'package:flutter/material.dart';
import 'package:kxinspections/core/constants/app_strings.dart';

class InspectionScreen extends StatelessWidget {
  const InspectionScreen({super.key, required this.inspectionId});

  final String inspectionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.viewInspection)),
      body: Center(child: Text('Inspection: $inspectionId')),
    );
  }
}
