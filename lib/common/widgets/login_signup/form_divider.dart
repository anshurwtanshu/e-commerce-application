import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UFormDivider extends StatelessWidget {
  const UFormDivider({
    super.key,
    required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(
            child: Divider(
              indent: 50,
              endIndent: 5,
              thickness: 0.5,
            )),
        Text(title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Expanded(
            child: Divider(
              indent: 5,
              endIndent: 50,
              thickness: 0.5,
            )),
      ],
    );
  }
}
