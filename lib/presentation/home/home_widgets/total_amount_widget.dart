import 'package:flutter/material.dart';
import 'package:k_distribution/app/extension.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class TotalAmountWidget extends StatefulWidget {
  final VoidCallback onTap;
  final int totalItems;
  final double grandTotal;
  final Future<void> Function()? onTotalAmountCalculated;

  const TotalAmountWidget({
    super.key,
    required this.onTap,
    required this.totalItems,
    required this.grandTotal,
    this.onTotalAmountCalculated,
  });

  @override
  State<TotalAmountWidget> createState() => _TotalAmountWidgetState();
}

class _TotalAmountWidgetState extends State<TotalAmountWidget> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(_loadInitialData);
  }

  Future<void> _loadInitialData() async {
    if (widget.onTotalAmountCalculated != null) {
      setState(() => isLoading = true);
      await widget.onTotalAmountCalculated!();
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.all(AppSize.s0),
      color: ColorManager.colorLightGray4,
      child: GestureDetector(
        onTap: isLoading == true ? null : widget.onTap,
        child: Container(
          margin: const EdgeInsets.only(
            top: AppSize.s0,
            left: AppSize.s15,
            right: AppPadding.p15,
            bottom: AppSize.s15,
          ),
          padding: const EdgeInsets.all(AppSize.s15),
          decoration: BoxDecoration(
            color: ColorManager.colorPrimary.withValues(alpha: AppSize.s0_8),
            borderRadius: BorderRadius.circular(AppSize.s15),
          ),
          child: isLoading
              ? Center(
                  child: SizedBox(
                    height: AppSize.s24,
                    width: AppSize.s24,
                    child: CircularProgressIndicator(
                      strokeWidth: AppSize.s2,
                      color: ColorManager.colorWhite,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.totalAmount,
                      style: getBoldStyle(
                          color: ColorManager.colorWhite,
                          fontSize: FontSize.s18),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "\$${widget.grandTotal.roundToTwo()}",
                        style: getBoldStyle(
                            color: ColorManager.colorWhite,
                            fontSize: FontSize.s16),
                        children: [
                          TextSpan(
                            text:
                                " | ${widget.totalItems} Item${widget.totalItems > 1 ? 's' : ''}",
                            style: getRegularStyle(
                                color: ColorManager.colorWhite,
                                fontSize: FontSize.s12),
                          )
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
