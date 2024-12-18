import 'package:fetch_five/app/screens/dashboard/dashboard_controller.dart';
import 'package:fetch_five/app/screens/dashboard_new/controller/dashboard_new_controller.dart';
import 'package:flutter/material.dart';

class DashboardDesktopView extends StatelessWidget {
  const DashboardDesktopView({super.key, required this.dashboardNewController});
  final DashboardNewController dashboardNewController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Dashboard Desktop'),
    );
  }
}
