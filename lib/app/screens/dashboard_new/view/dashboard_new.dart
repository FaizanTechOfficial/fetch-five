import 'package:fetch_five/app/screens/dashboard_new/controller/dashboard_new_controller.dart';
import 'package:fetch_five/app/screens/dashboard_new/view/platform/dashboard_desktop_view.dart';
import 'package:fetch_five/app/screens/dashboard_new/view/platform/dashboard_mobile_view.dart';
import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardNew extends GetView<DashboardNewController> {
  const DashboardNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: SafeArea(
        child: DashboardMobileView(dashboardNewController: controller),
      ),
      desktop: DashboardDesktopView(dashboardNewController: controller),
    );
  }
}
