import 'package:flutter/material.dart';
import 'package:fruit_dashboard/feature/add_broduct/presntation/views/add_product_view.dart';
import 'package:fruit_dashboard/feature/dashboard/views/dashboard_view.dart';



Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());
      case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}