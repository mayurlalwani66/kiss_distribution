import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/common/common_widgets/common_elevated_button.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';

import '../resources/values_manager.dart';

class CancelOrder extends StatelessWidget {
  const CancelOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cancel Order",
                  style: getBoldStyle(
                      fontSize: FontSize.s16, color: ColorManager.colorBlack),
                ),
                CloseButton(),
              ],
            ),
            const SizedBox(height: AppSize.s20),
            Text("Cancel Reason",
                style: getRegularStyle(
                    fontSize: FontSize.s12,
                    color: ColorManager.colorTextFieldLabel)),
            const SizedBox(height: AppSize.s10),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Notes",
              ),
            ),
            const SizedBox(height: AppSize.s30),
            CommonElevatedButton(text: "Submit", onTap: () {})
          ],
        ),
      ),
    );
  }
}
