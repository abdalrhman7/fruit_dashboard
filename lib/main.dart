import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/services/get_it_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/helper_function/on_generate_routes.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/supabase_stoarge.dart';
import 'feature/dashboard/views/dashboard_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await SupabaseStorageService.initSubabase();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
    );
  }
}
