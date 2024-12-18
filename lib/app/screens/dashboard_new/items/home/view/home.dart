import 'package:fetch_five/app/screens/dashboard_new/items/home/controller/home_controller.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/home/view/platform/home_desktop_view.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/home/view/platform/home_mobile_view.dart';
import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: HomeMobileView(homeController: controller),
        desktop: HomeDesktopView(homeController: controller));
  }
}
