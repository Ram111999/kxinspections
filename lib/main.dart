import 'package:flutter/material.dart';
import 'package:kxinspections/app/app.dart';
import 'package:provider/provider.dart';

import 'features/maintenance/bottom_nav/provider/maintenance_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MaintenanceProvider())],
      child: KxInspectionsApp(),
    ),
  );
}
