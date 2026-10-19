import 'package:e_commerce/common/widgets/custom_shapes/primary_header_controller.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UProfilePrimaryHeader extends StatelessWidget {
  const UProfilePrimaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Total Height
        SizedBox(height: USizes.profilePrimaryHeaderHeight + 60,),
        /// primary Header
        UPrimaryHeaderContainer(
            height: USizes.profilePrimaryHeaderHeight,
            child: Container()
        ),

        ///User Profile
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: UserProfileLogo(),
          ),
        )
      ],
    );
  }
}

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UCircularImage(
      image: UImages.profileIcon,
      height: 120.0,
      width: 120,
    borderWidth: 5.0,
     showBorder: true,
     borderColor: UColors.primary,
     padding: 0,);
  }
}
