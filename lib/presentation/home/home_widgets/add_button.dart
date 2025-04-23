import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class AddButton extends StatelessWidget {
  final void Function() onTap;
  const AddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -2,
      left: AppSize.s30,
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s5),
            ),
          ),
          onPressed: () {
            onTap();
          },
          icon: Icon(
            Icons.add,
            color: ColorManager.colorWhite,
          ),
          label: Text(
            AppStrings.add,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorManager.colorWhite,
                ),
          )),
    );
  }
}
