import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';

class QuantityControlButton extends StatelessWidget {
  const QuantityControlButton({
    super.key,
    required this.onDecrease,
    required this.onIncrease,
    required this.quantity,
    required this.unit,
  });

  final String unit;
  final void Function() onDecrease;
  final void Function() onIncrease;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: AppSize.s1,
          color: ColorManager.colorPrimary,
        ),
        borderRadius: BorderRadius.circular(AppSize.s25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            shape: const CircleBorder(),
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onDecrease,
              splashColor: ColorManager.colorPrimary.withValues(alpha: 0.2),
              child: const SizedBox(
                width: AppSize.s40,
                height: AppSize.s40,
                child: Icon(Icons.remove, size: AppSize.s16),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: AppSize.s60,
            child: Text(
              "$quantity $unit",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: FontSize.s12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Material(
            shape: const CircleBorder(),
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onIncrease,
              splashColor: ColorManager.colorPrimary.withValues(alpha: 0.2),
              child: const SizedBox(
                width: AppSize.s40,
                height: AppSize.s40,
                child: Icon(Icons.add, size: AppSize.s16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
