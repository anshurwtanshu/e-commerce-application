import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/features/shop/controller/home/home_controller.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/banners._dot_navigation.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/images.dart';

class UPromoSlider extends StatelessWidget {
  const UPromoSlider({
    super.key, required this.banners,
  });
  final List <String> banners;

  @override
  Widget build(BuildContext context) {

    final controller = HomeController.instance;

    return Column(
      children: [
        CarouselSlider(
            items: banners.map((banner)=> URoundedImage(imageUrL: banner)).toList()
         ,options: CarouselOptions(
            viewportFraction: 1.0 , onPageChanged: (index,reason)=>controller.onPageChanged(index)),
          carouselController: controller.carouselController,
        ),

        SizedBox(height: USizes. spaceBtwItems),
        BannersDotNavigation()
      ],
    );
  }
}
