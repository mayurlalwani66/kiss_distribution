import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.message,
    required this.onTapNo,
    required this.onTapYes,
  });
  final String message;
  final void Function() onTapNo;
  final void Function() onTapYes;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: AppSize.s10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s2)),
        backgroundColor: ColorManager.colorWhite,
        insetPadding: EdgeInsets.all(AppPadding.p25),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p16, horizontal: AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: getSemiBoldStyle(
                    fontSize: FontSize.s18, color: ColorManager.colorBlack),
              ),
              const SizedBox(height: AppSize.s30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        onTapNo();
                      },
                      child: Text(
                        "No",
                        style: getRegularStyle(
                            fontSize: FontSize.s16,
                            color: ColorManager.colorDarkBlue),
                      )),
                  TextButton(
                      onPressed: () {
                        onTapYes();
                      },
                      child: Text(
                        "Yes",
                        style: getRegularStyle(
                            fontSize: FontSize.s16,
                            color: ColorManager.colorDarkBlue),
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
