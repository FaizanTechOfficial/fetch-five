import 'package:fetch_five/app/screens/new_game/new_game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:fetch_five/app/screens/new_game/components/search_field.dart';

class SearchDialogWidgetMobile extends StatelessWidget {
  const SearchDialogWidgetMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewGameController>();

    return Material(
      color: Colors.transparent,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
              Colors.transparent,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
                title: Text(
                  'Search',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
              ),
              Gap(57.h),
              SearchFieldMobile(
                enabled: true,
                controller: controller.textEditingController,
                hintText: 'Search Players',
                searchIcon: 'assets/icons/Search.svg',
                filterIcon: 'assets/icons/Filter.svg',
                onFilterTap: () {},
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff161620),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'recent searches',
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final player = controller.filteredData[index];
                        return ListTile(
                          dense: true,
                          leading: Image.asset(
                            player.image,
                            height: 48.h,
                            width: 48.w,
                          ),
                          title: Text(
                            player.name,
                          ),
                          titleTextStyle: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        );
                      },
                    ),
                    Gap(30.h),
                    Text(
                      'search results',
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                    Obx(
                      () {
                        if (controller.filteredData.isEmpty ||
                            controller.isNoResultsFound.value) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/no_result.svg'),
                                  Text(
                                    'No results found.',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Try a different search term.',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.filteredData.length,
                          itemBuilder: (context, index) {
                            final player = controller.filteredData[index];
                            return ListTile(
                              dense: true,
                              leading: Image.asset(
                                player.image,
                                height: 48.h,
                                width: 48.w,
                              ),
                              title: Text(
                                player.name,
                              ),
                              titleTextStyle: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchDialogWidgetDesktop extends StatelessWidget {
  const SearchDialogWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewGameController>();

    return Material(
      color: Colors.transparent,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
              Colors.transparent,
            ],
          ),
        ),
        child: SizedBox(
          width: 428,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  width: 428,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.white,
                      ),
                    ),
                    centerTitle: true,
                    title: const Text(
                      'Search',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const Gap(57),
                SizedBox(
                  width: 428,
                  child: SearchFieldDesktop(
                    enabled: true,
                    controller: controller.textEditingController,
                    hintText: 'Search Players',
                    searchIcon: 'assets/icons/Search.svg',
                    filterIcon: 'assets/icons/Filter.svg',
                    onFilterTap: () {},
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  width: 428,
                  decoration: BoxDecoration(
                    color: const Color(0xff161620),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'recent searches',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          final player = controller.filteredData[index];
                          return ListTile(
                            dense: true,
                            leading: Image.asset(
                              player.image,
                              height: 48,
                              width: 48,
                            ),
                            title: Text(
                              player.name,
                            ),
                            titleTextStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          );
                        },
                      ),
                      const Gap(30),
                      const Text(
                        'search results',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Obx(
                        () {
                          if (controller.filteredData.isEmpty ||
                              controller.isNoResultsFound.value) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/no_result.svg'),
                                    const Text(
                                      'No results found.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Try a different search term.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.filteredData.length,
                            itemBuilder: (context, index) {
                              final player = controller.filteredData[index];
                              return ListTile(
                                dense: true,
                                leading: Image.asset(
                                  player.image,
                                  height: 48,
                                  width: 48,
                                ),
                                title: Text(
                                  player.name,
                                ),
                                titleTextStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
