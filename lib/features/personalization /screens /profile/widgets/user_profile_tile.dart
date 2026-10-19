import 'package:e_commerce/features/personalization%20/controllers/user_controller.dart';
import 'package:e_commerce/features/personalization%20/screens%20/edit_profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Obx(()=>Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall  ,)),
      subtitle: Obx(()=>Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium)),
      trailing: IconButton(onPressed: ()=> Get.to(()=> EditProfileScreen()), icon: Icon(Iconsax.edit)),
    );
  }
}

