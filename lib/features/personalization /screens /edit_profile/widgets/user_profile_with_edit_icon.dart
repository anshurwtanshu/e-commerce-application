import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/user_profile_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controllers/user_controller.dart';



class UserProfileWIthEdition extends StatelessWidget {
  const UserProfileWIthEdition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance ;
    return Stack(
      children: [
        ///User Profile Logo
        Center(child: UserProfileLogo()),
        /// Edit Icons

        Obx(
    (){
      if(controller.isProfileUploading.value){
        return SizedBox();

    }
      return Positioned(
          top: 0,
          bottom: 0,
          left:0,
          right: 0,
          child: Center(child: UCircularIcon(icon: Iconsax.edit , onPressed: controller.updateUserProfilePicture,)));
    }
        )
      ],
    );
  }
}
