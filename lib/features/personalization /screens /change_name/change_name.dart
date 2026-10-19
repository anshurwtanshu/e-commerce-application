
import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/texts.dart';
import '../../controllers/change_name_controller.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.put(ChangeNameController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      /// -----[AppBar]-----
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Update Name',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),

      /// -----[Body]-----
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenpadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// [Text] - Heading
              Text(
                'Update your name to keep your profile accurate and personalized',
                style: Theme.of(context).textTheme.labelMedium,
              ),

              SizedBox(height: USizes.spaceBtwSections),

              /// Form
              Form(
                key: controller.updateUserFormKey,
                child: Column(
                  children: [
                    /// First Name
                    TextFormField(
                      controller: controller.firstNameController,
                      validator: (value) =>
                          UValidator.validateEmptyText(
                             'First Name',
                            value,
                          ),
                      decoration: InputDecoration(
                        labelText: UTexts.firstName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ), // TextFormField

                    SizedBox(height: USizes.spaceBtwInputFields),

                    /// Last Name
                    TextFormField(
                      controller: controller.lastNameController,
                      validator: (value) =>
                          UValidator.validateEmptyText(
                            'Last Name',
                            value,
                          ),
                      decoration: InputDecoration(
                        labelText: UTexts.lastName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ), // TextFormField
                  ],
                ), // Column
              ), // Form

              SizedBox(height: USizes.spaceBtwSections),

              /// Save Button
              SizedBox(
                width: double.infinity,
                child: UElevetedButton(
                  onPressed:controller.updateUserName,
                  child: Text('Save'),
                ),
              ),
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
