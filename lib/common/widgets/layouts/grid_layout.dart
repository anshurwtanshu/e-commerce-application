import 'package:e_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class GridViewLayout extends StatelessWidget {
  const GridViewLayout({
    super.key,
    required this.itemCount,
    this.mainAxisCount=295,
    required this.itemBuilder,
  });
  final int itemCount;
  final double? mainAxisCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemCount,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: USizes.gridViewSpacing,
            mainAxisExtent: mainAxisCount,
            crossAxisSpacing: USizes.gridViewSpacing),
        itemBuilder: itemBuilder);
  }
}
