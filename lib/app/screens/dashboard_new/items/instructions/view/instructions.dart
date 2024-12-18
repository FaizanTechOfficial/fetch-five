import 'package:fetch_five/app/screens/dashboard_new/items/instructions/controller/instructions_controller.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/instructions/view/platform/instructions_desktop_view.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/instructions/view/platform/instructions_mobile_view.dart';
import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Instructions extends GetView<InstructionsController> {
  const Instructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: InstructionsMobileView(instructionsController: controller),
        desktop: InstructionsDesktopView(instructionsController: controller));
  }
}
