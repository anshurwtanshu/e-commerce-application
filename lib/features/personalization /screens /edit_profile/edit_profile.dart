import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization%20/controllers/user_controller.dart';
import 'package:e_commerce/features/personalization%20/screens%20/edit_profile/widgets/user_profile_with_edit_icon.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../change_name/change_name.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          "Edit Profile",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: UPadding.screenpadding,
        child: Column(
          children: [
            /// User Profile with edit Icon
            UserProfileWIthEdition(),
            SizedBox(height: USizes.spaceBtwSections),

            /// Divider
            Divider(),
            SizedBox(height: USizes.spaceBtwItems),



            ///Account Setting Heading
            USectionHeading(title: "Account Setting" , showActionButton: false,),
            SizedBox(height: USizes.spaceBtwItems),
            ///Account Details
            UDetialRow(
              title: "Name",
              value: controller.user.value.fullName,
              onTap: ()=>Get.to(()=>ChangeNameScreen()),
            ),
            UDetialRow(title: "userame", value: controller.user.value.username, onTap: () {}),
            SizedBox(height: USizes. spaceBtwItems),

            Divider(),
            SizedBox(height: USizes.spaceBtwItems),

            /// Profile Section Heading 
            USectionHeading(title: "Profile Setting"  , showActionButton: false,),
            SizedBox(height: USizes.spaceBtwItems),

            ///profil Settings
            UDetialRow(
              title: "User ID",
              value: controller.user.value.id,
              onTap: () {},
            ),
            UDetialRow(title: "Email", value:controller.user.value.email, onTap: () {}),
            UDetialRow(title: "Phone No", value:"+92 ${controller.user.value.phoneNumber}" ,onTap: () {}),
            UDetialRow(title: "Gender", value:"Male" ,onTap: () {}),
            SizedBox(height: USizes. spaceBtwItems),

            Divider(),
            SizedBox(height: USizes.spaceBtwItems),

            /// close Account Button
            TextButton(onPressed:controller.deleteAccountWarningPopup, child: Text("Close Account" , style: TextStyle(color: Colors.red),)),
          ],
        ),
      )),
    );
  }
}

class UDetialRow extends StatelessWidget {
  const UDetialRow({
    super.key,
    required this.title,
    required this.value,
    this.icon = Iconsax.arrow_right_34,
    required this.onTap,
  });
  final String title, value;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                flex: 5,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                child: Icon(
              icon,
              size: USizes.iconSm,
            ))
          ],
        ),
      ),
    );
  }
}
