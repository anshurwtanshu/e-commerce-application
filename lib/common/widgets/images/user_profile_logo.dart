import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/features/personalization%20/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =UserController.instance;
    return Obx(
        (){
          bool isProfileAvailable = controller.user.value.profilePicture.isNotEmpty;

          /// [Loading state]
if(controller.profileLoading.value){
  return UShimmerEffect(width: 120.0, height: 120.0 , radius: 120);
}

return UCircularImage(
              image:  isProfileAvailable?controller.user.value.profilePicture: UImages.profileIcon,
              height: 120.0,
              width: 120,
              borderWidth: 5.0,
              showBorder: true,
              borderColor: UColors.primary,
              padding: 0,
              isNetworkImage:isProfileAvailable );
        }
    );
  }
}
