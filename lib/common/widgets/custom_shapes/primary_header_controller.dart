import 'package:e_commerce/common/widgets/custom_shapes/circular_container.dart';
import 'package:e_commerce/common/widgets/custom_shapes/clipper/custom_rounded_clipper.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_edges_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({
    super.key, required this.child,  required this.height,
  });

  @override
  final Widget child;
  final double height;
  Widget build(BuildContext context) {
    return URoundedEdgesContainer(
      child: Container(
        height: height,
        color: UColors.primary,
        child: Stack(
          children: [

      ///circular Container

            Positioned(
              top: -150,
              right: -160,
              child: UCircularContainer(
                height: USizes.homePrimaryHeaderHeight,
                width: USizes.homePrimaryHeaderHeight,
                backgroundColor: UColors.white.withValues(alpha: 0.1), icon: null,
              ),
            ),

      ///circular container
            Positioned(
              top: 50,
              right: -250,
              child: UCircularContainer(
                height: USizes.homePrimaryHeaderHeight,
                width: USizes.homePrimaryHeaderHeight ,
                backgroundColor: UColors.white.withValues(alpha: 0.1), icon: null,
              ),
            ),

            ///child
            child
          ],
        ),
      ),
    );
  }
}

