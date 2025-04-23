import 'package:flutter/material.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/presentation/resources/assets_manager.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

class FeedbackListCard extends StatelessWidget {
  const FeedbackListCard(
      {super.key,
      required this.isSelected,
      required this.feedbackTitle,
      required this.onTap});
  final bool isSelected;
  final FeedbackTitle feedbackTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: AppSize.s60,
        padding: const EdgeInsets.all(AppPadding.p10),
        margin: EdgeInsets.only(bottom: AppMargin.m5),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: ColorManager.colorPrimary,
              width: AppSize.s4,
            ),
          ),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(AppSize.s8),
            bottomRight: Radius.circular(AppSize.s8),
          ),
          color: ColorManager.colorWhite,
        ),
        child: Row(
          children: [
            Image.asset(
                isSelected ? ImageAssets.radioImg : ImageAssets.radioCheckedImg,
                height: AppSize.s20),
            const SizedBox(width: AppSize.s10),
            Expanded(
                child: Text(
              feedbackTitle.title,
              style: getRegularStyle(
                  color: ColorManager.colorBlack, fontSize: FontSize.s12),
            )),
            const SizedBox(width: AppSize.s8),
            if (feedbackTitle.imgUrl.isNotEmpty)
              Image.asset(feedbackTitle.imgUrl, height: AppSize.s30),
          ],
        ),
      ),
    );
  }
}
