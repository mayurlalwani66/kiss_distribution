import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/presentation/common/common_widgets/common_elevated_button.dart';
import 'package:k_distribution/presentation/forgot_password/forgot_password_provider.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';

class ForgotPassword extends ConsumerWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.forgotPassword,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                onPressed: () => context.router.pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: AppSize.s10),
          CommonElevatedButton(
              text: AppStrings.forgotPassword,
              onTap: () {
                ref.watch(forgotPasswordProvider);
              }),
          const SizedBox(height: AppSize.s10),
          Text(
            AppStrings.forgotPasswordLink,
            style: getlightStyle(
                color: ColorManager.colorTextFieldLabel,
                fontSize: FontSize.s12),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
