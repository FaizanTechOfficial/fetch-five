import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CAppbar extends StatelessWidget {
  final VoidCallback onRefresh;
  final VoidCallback onToggleDrawer;
  final bool showLoading;

  const CAppbar({
    super.key,
    required this.onRefresh,
    required this.onToggleDrawer,
    required this.showLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onRefresh,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 20),
              child: SvgPicture.asset(
                'assets/icons/refresh.svg',
                height: 28,
                width: 28,
              ),
            ),
          ),
          Image.asset(
            'assets/images/five_tile.png',
            height: 66,
            width: 200,
          ),
          InkWell(
            onTap: onToggleDrawer,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 20),
              child: SvgPicture.asset(
                'assets/icons/drawer.svg',
                height: 28,
                width: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CAppbarDesktop extends StatelessWidget {
  final VoidCallback onRefresh;
  final VoidCallback onToggleDrawer;
  final bool showLoading;

  const CAppbarDesktop({
    super.key,
    required this.onRefresh,
    required this.onToggleDrawer,
    required this.showLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onRefresh,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: SvgPicture.asset(
              'assets/icons/refresh.svg',
            ),
          ),
          const SizedBox(
            width: 60,
          ),
          Image.asset(
            'assets/images/five_tile.png',
            height: 66.0,
            width: 180.0,
          ),
          const SizedBox(
            width: 60,
          ),
          InkWell(
            onTap: onToggleDrawer,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 20.0),
              child: SvgPicture.asset(
                'assets/icons/drawer.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
