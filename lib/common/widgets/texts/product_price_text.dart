import 'package:flutter/material.dart';

class UProductPriceText extends StatelessWidget {
  const UProductPriceText({
    super.key,
     this.currentSign="\$",
    required this.price,
     this.maxLines =1,
     this.isLarge = false,
     this.LineThrough = false,
  });

  final String currentSign, price;
  final int maxLines;
  final bool isLarge, LineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(currentSign + price,
        style: isLarge
            ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: LineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: LineThrough ? TextDecoration.lineThrough : null),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis);
  }
}
