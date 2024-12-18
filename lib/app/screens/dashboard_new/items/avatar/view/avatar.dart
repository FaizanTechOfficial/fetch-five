import 'package:fetch_five/app/screens/dashboard_new/items/avatar/controller/avatar_controller.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/avatar/view/platform/avatar_desktop_view.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/avatar/view/platform/avatar_mobile_view.dart';
import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Avatar extends GetView<AvatarController> {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: AvatarMobileView(avatarController: controller),
        desktop: AvatarDesktopView(avatarController: controller));
  }
}
