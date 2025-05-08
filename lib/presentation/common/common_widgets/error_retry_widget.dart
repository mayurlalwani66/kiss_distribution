import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';

class ErrorRetryWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorRetryWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error, size: AppSize.s48, color: Colors.redAccent),
            const SizedBox(height: AppSize.s12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: AppSize.s12),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: Icon(Icons.refresh, color: ColorManager.colorWhite),
              label: Text(AppStrings.retry,
                  style: getSemiBoldStyle(
                      color: ColorManager.colorWhite, fontSize: FontSize.s14)),
            ),
          ],
        ),
      ),
    );
  }
}
