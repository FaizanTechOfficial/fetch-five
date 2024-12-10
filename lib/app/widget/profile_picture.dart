import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePicture extends StatelessWidget {
  final Color borderColor;
  final void Function()? onTap;
  final ImageProvider<Object>? backgroundImage;

  const ProfilePicture(
      {super.key, required this.borderColor, this.onTap, this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            width: 6,
          ),
        ),
        child: CircleAvatar(
          radius: 24.r,
          backgroundImage: backgroundImage,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class ProfilePictureDesktop extends StatelessWidget {
  final String imageUrl;
  final Color borderColor;
  final void Function()? onTap;

  const ProfilePictureDesktop({
    super.key,
    required this.imageUrl,
    required this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            width: 6.0, // Fixed border width
          ),
        ),
        child: CircleAvatar(
          radius: 24.0, // Fixed radius
          backgroundImage: AssetImage(imageUrl),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
