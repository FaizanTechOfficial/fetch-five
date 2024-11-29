import 'package:fetch_five/app/screens/new_game/components/players_boxes.dart';
import 'package:fetch_five/app/screens/new_game/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NewGame extends StatelessWidget {
  const NewGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0A14),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/images/five_tile.png',
          height: 50.h,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(50.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Start a New Game',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              Gap(20.h),
              SearchField(
                controller: TextEditingController(),
                hintText: 'Search',
                searchIcon: 'assets/icons/Search.svg',
                filterIcon: 'assets/icons/Filter.svg',
                onFilterTap: () {},
              ),
              Gap(30.h),
              Text(
                'Human Players',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Gap(20.h),
              SizedBox(
                height: 200.h,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 88.h,
                    mainAxisSpacing: 18.w,
                    crossAxisSpacing: 10.h,
                    crossAxisCount: 2,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return PlayersBoxes(
                      image: 'assets/images/fetchfive-profile-pic-021.png',
                      text: 'Seanm',
                    );
                  },
                ),
              ),
              Gap(30.h),
              Text(
                'Human Players',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Gap(20.h),
              SizedBox(
                height: 310.h,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 88.h,
                    mainAxisSpacing: 18.w,
                    crossAxisSpacing: 10.h,
                    crossAxisCount: 2,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return PlayersBoxes(
                      image: 'assets/images/fetchfive-profile-pic-021.png',
                      text: 'Seanm',
                    );
                  },
                ),
              ),
              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
