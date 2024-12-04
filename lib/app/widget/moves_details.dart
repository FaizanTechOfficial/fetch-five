import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovesDetails extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const MovesDetails({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: 24.r,
          backgroundImage: AssetImage(imagePath),
          backgroundColor: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class MovesDetailsDesktop extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const MovesDetailsDesktop({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: 30.0, // Adjusted for desktop
          backgroundImage: AssetImage(imagePath),
          backgroundColor: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24.0, // Adjusted font size for desktop
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 18.0, // Adjusted font size for desktop
          color: Colors.grey,
        ),
      ),
    );
  }
}
