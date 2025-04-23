import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main colors of the app
      primaryColor: ColorManager.colorPrimary,

      // card theme

      cardTheme: CardTheme(
        color: ColorManager.colorWhite,
        shadowColor: ColorManager.colorLightBlack,
        elevation: AppSize.s1_5,
      ),

      //Appbar theme

      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.colorBlack,
            statusBarIconBrightness: Brightness.light),
        color: ColorManager.colorWhite,
        surfaceTintColor: ColorManager.colorWhite,
        elevation: AppSize.s0,
        titleTextStyle: getBoldStyle(
          color: ColorManager.colorBlack,
          fontSize: FontSize.s16,
        ),
      ),

      // Button Theme

      buttonTheme: ButtonThemeData(
        shape: StadiumBorder(),
        buttonColor: ColorManager.colorPrimary,
        splashColor: ColorManager.colorPrimaryOpacity70,
      ),

      // Elevated Button Theme

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(color: ColorManager.colorWhite),
          backgroundColor: ColorManager.colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
        ),
      ),

      //Text theme

      textTheme: TextTheme(
        headlineLarge: getBoldStyle(
            color: ColorManager.colorBlack, fontSize: FontSize.s14),
        titleLarge: getBoldStyle(
            color: ColorManager.colorBlack, fontSize: FontSize.s14),
        titleMedium: getSemiBoldStyle(
            color: ColorManager.colorBlack, fontSize: FontSize.s14),
        labelLarge: getRegularStyle(color: ColorManager.colorTextFieldLabel),
        bodyLarge: getRegularStyle(color: ColorManager.colorBlack),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: ColorManager.colorWhite,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s10),
                topRight: Radius.circular(AppSize.s10))),
      ));
}
