import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../../features/authentication/controllers/login/login_controller.dart';

class USocialButton extends StatelessWidget {
  const USocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        ///google icon
        buildButton( UImages.googleIcon , controller.googleSignIn),
        SizedBox(width: USizes.spaceBtwItems,),
        ///facebook icon
        buildButton( UImages.facebookIcon , (){}),

      ],
    );
  }

  Container buildButton( String image , VoidCallback onPressed ) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: UColors.grey,
            ),
            borderRadius: BorderRadius.circular(100)),
        child: IconButton(
            onPressed: onPressed,
            icon: Image.asset(image,
                height: USizes.iconMd, width: USizes.iconMd)),
      );
  }
}
