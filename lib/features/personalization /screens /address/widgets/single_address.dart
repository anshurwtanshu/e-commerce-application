import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class USingleAddress extends StatelessWidget {
  const USingleAddress({
    super.key, required this.isSelected,
  });
final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return URoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: isSelected ? UColors.primary.withValues(alpha: 0.5) : Colors.transparent,
      borderColor: isSelected ? Colors.transparent : dark ? UColors.darkGrey:UColors.grey ,
      padding: EdgeInsets.all(USizes.md),
      child:  Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Name

              Text("UnKnown Pro", style: Theme.of(context).textTheme.titleLarge,maxLines: 1,  overflow: TextOverflow.ellipsis,),
        SizedBox(height: USizes.spaceBtwItems / 2),
              ///Phone Number
              Text("+9625475408" , maxLines: 1,overflow:TextOverflow.ellipsis,),
              SizedBox(height: USizes.spaceBtwItems / 2),

              ///Address
              Text(" HOuse No 234 , Hydrabad , Sindh Colony" ),
            ],

          ),
          if(isSelected)Positioned(
            top: 0,
              bottom: 0,
              right: 6,
              child: Icon(Iconsax.tick_circle5))
        ],
      )
    );
  }
}
