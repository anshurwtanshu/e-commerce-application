import 'package:e_commerce/common/widgets/custom_shapes/circular_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UVerticalImageText extends StatelessWidget {
  const UVerticalImageText({
    super.key,
    required this.title,
    required this.image,
    required this.textColor,
    this.backgroundColor,
    this.onTap,
  });
  final String title, image;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ///circular image
          UCircularContainer(
            height: 56,
            width: 56,
            backgroundColor:
                backgroundColor ?? (dark ? UColors.dark : UColors.light),
            padding: EdgeInsets.all(USizes.sm),
            icon: null,
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: USizes.spaceBtwItems / 2,
          ),

          ///title
          SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
