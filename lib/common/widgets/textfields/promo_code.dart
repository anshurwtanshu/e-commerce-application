import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UPromoCodeField extends StatelessWidget {
  const UPromoCodeField({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return URoundedContainer(
      showBorder: true,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.only(left: USizes.sm ,top: USizes.sm , right: USizes.sm , bottom: USizes.sm),
      child: Row(
        children: [
          Flexible(
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Have a Promo  Code ? Enter Here" ,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),)),

          SizedBox(
              width: 80.0,
              child: ElevatedButton(onPressed: (){} , child: Text("Apply"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.withValues(alpha : 0.2),
                  foregroundColor: dark ? UColors.white.withValues(alpha: 0.5):UColors.dark.withValues(alpha: 0.5),
                  side: BorderSide(color: Colors.grey.withValues(alpha: 0.1)),

                ),


              ))
        ],
      ),
    );
  }
}
