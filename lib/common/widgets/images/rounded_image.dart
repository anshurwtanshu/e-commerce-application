import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class URoundedImage extends StatelessWidget {
  const URoundedImage({
    super.key,
    this.image,
    this.width,
    this.height,
    required this.imageUrL,
    this.applyImageRadius =true ,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false ,
    this.borderRadius = USizes.md,
    this.onTap,
  });

  final double?
  width, height;
  final String imageUrL;
  final bool applyImageRadius;
  final
  BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onTap;
  final double borderRadius;

  final dynamic image;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border : border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),

        ),
        child: ClipRRect(
            borderRadius: applyImageRadius? BorderRadius.circular(borderRadius): BorderRadius.zero,
            child: Image(image: isNetworkImage? NetworkImage(imageUrL) :AssetImage(imageUrL) ,fit: fit,)),
      ),
    );
  }
}
