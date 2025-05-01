import 'package:flutter/material.dart';
import 'package:k_distribution/data/network/error_handler.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

class NoInternetWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wifi_off,
              size: AppSize.s100, color: Colors.redAccent),
          const SizedBox(height: AppSize.s16),
          const Text(
            ResponseMessage.NO_INTERNET_CONNECTION,
            style:
                TextStyle(fontSize: FontSize.s18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSize.s10),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(AppStrings.retry,
                style: getSemiBoldStyle(
                    color: ColorManager.colorWhite, fontSize: FontSize.s14)),
          )
        ],
      ),
    );
  }
}
