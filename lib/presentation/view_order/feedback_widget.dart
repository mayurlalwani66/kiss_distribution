import 'package:flutter/material.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/presentation/resources/assets_manager.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/view_order/view_order_widgets/feedback_list_card.dart';
import 'package:k_distribution/presentation/view_order/view_order_widgets/star_rating_widget.dart';

import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({super.key, required this.onSubmit});
  final void Function(String title, double rating, String description) onSubmit;

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  double _rating = 0;

  String? _selectedTitle;

  final TextEditingController _descController = TextEditingController();

  final List<FeedbackTitle> feedbackTitles = [
    FeedbackTitle(
      AppStrings.happyFeedback,
      false,
      ImageAssets.happyImg,
    ),
    FeedbackTitle(
      AppStrings.disappointedFeedback,
      false,
      ImageAssets.dissapointedImg,
    ),
    FeedbackTitle(
      AppStrings.deliveryLateFeedback,
      false,
      ImageAssets.deliveryNotOnTimeImg,
    ),
    FeedbackTitle(
      AppStrings.notLikedFeedback,
      false,
      ImageAssets.noLikeImg,
    ),
    FeedbackTitle(
      AppStrings.otherFeedback,
      false,
      '',
    ),
  ];

  void _submitFeedback() {
    if (_rating < 1 || _selectedTitle == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppStrings.rateAndSelectFeedback)),
      );
      return;
    }

    widget.onSubmit(
      _selectedTitle!,
      _rating,
      _descController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p15),
      margin: EdgeInsets.only(top: AppMargin.m4),
      color: ColorManager.colorWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.feedback,
            style: getBoldStyle(
                fontSize: FontSize.s16, color: ColorManager.colorBlack),
          ),
          const Divider(),
          const SizedBox(height: AppSize.s10),
          Text(
            AppStrings.ratingForOrder,
            style: getBoldStyle(
                fontSize: FontSize.s14, color: ColorManager.colorPrimary),
          ),
          const SizedBox(height: AppSize.s10),
          StarRatingWidget(
            onRatingSubmit: (rating) => _rating = rating,
            initialRating: _rating,
          ),
          const SizedBox(height: AppSize.s10),
          ...feedbackTitles.map((option) => FeedbackListCard(
                isSelected: _selectedTitle == option.title,
                feedbackTitle: option,
                onTap: () {
                  setState(() => _selectedTitle = option.title);
                },
              )),
          const SizedBox(height: AppSize.s10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s6),
            ),
            child: TextFormField(
              controller: _descController,
              maxLines: 3,
              style: getRegularStyle(
                  color: ColorManager.colorBlack, fontSize: FontSize.s12),
              decoration: InputDecoration(
                fillColor: ColorManager.colorLightGray4,
                filled: true,
                hintText: AppStrings.writeReview,
                hintStyle: getRegularStyle(
                    color: ColorManager.colorBlack, fontSize: FontSize.s12),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(AppPadding.p12),
              ),
            ),
          ),
          const SizedBox(height: AppSize.s20),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              onPressed: () {
                _submitFeedback();
              },
              icon: Image.asset(ImageAssets.sendImg),
              label: Text(AppStrings.submit,
                  style: getSemiBoldStyle(color: ColorManager.colorWhite)),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s30),
                ),
                foregroundColor: ColorManager.colorWhite,
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20, vertical: AppPadding.p12),
                elevation: AppSize.s2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
