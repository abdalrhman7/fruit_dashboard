import 'package:flutter/material.dart';

import 'core/helper_function/on_generate_routes.dart';
import 'feature/dashboard/views/dashboard_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
    );
  }
}


