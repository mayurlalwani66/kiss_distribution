import 'package:flutter/material.dart';

class ColorManager {
  // Theme 3 (Active Theme)
  static Color colorPrimary = "#8D5600".fromHex();
  static Color colorPrimaryOpacity70 = "#B38D5600".fromHex();
  static Color colorSecondary4 = "#ffa600".fromHex();
  static Color colorLightGray4 = "#fff3f0".fromHex();
  static Color fontColor4 = "#591b0c".fromHex();
  static Color colorBadge4 = "#05bb2a".fromHex();
  static Color inputBgColor4 = "#dad7d7".fromHex();

  // Default Palette
  static Color colorYellowBadge = "#FF9E0D".fromHex();
  static Color colorYellowBorder = "#FF9507".fromHex();
  static Color colorWhite = "#ffffff".fromHex();
  static Color colorRed = "#cc0404".fromHex();
  static Color colorLightRed =
      "#D82D2D".fromHex(); // Approximate rgba(204, 4, 4, 0.11)
  static Color colorBrown = "#B97112".fromHex();
  static Color colorLightYellow = "#FFF8E8".fromHex();
  static Color colorLightGreen = "#EBF6EE".fromHex();
  static Color colorLightBlack = "#EDEDED".fromHex();
  static Color colorBlack = "#000000".fromHex();
  static Color colorGreen = "#068C2F".fromHex();
  static Color colorYellow = "#DF9B02".fromHex();
  static Color colorCloseStore = "#f6ecec".fromHex();
  static Color colorOrange = "#FF4500".fromHex();
  static Color colorLightOrange =
      "#FFB199".fromHex(); // Approximate rgba(255, 69, 0, 0.09)
  static Color colorLightBlue = "#008BC2".fromHex();
  static Color colorLighterBlue =
      "#7FCDE8".fromHex(); // Approximate rgba(0, 139, 194, 0.09)
  static Color colorLoadingBackground = "#f5f5f5".fromHex();
  static Color colorLoadingAnimation =
      "#E8E8E8".fromHex(); // Approximate rgba(232, 232, 232, 0.78)

  // Additional Colors from Styles
  static Color colorSupportPerson = "#d58c00".fromHex();
  static Color colorStatusNew = "#d68d00".fromHex();
  static Color colorStatusActive = "#00ad31".fromHex();
  static Color colorStatusClose = "#ff0000".fromHex();
  static Color colorDeliveryInfo = "#f5f5f5".fromHex();
  static Color colorOrderCancelNotes = "#fff3f3".fromHex();
  static Color colorLoginBackground = "#161d6f".fromHex();
  static Color colorErrorRed = "#ff0000".fromHex();
  static Color colorGrayDB = "#dbdbdb".fromHex();
  static Color colorTransparentWhite = "#1CFFFFFF".fromHex();
  static Color colorDarkBlueGray = "#353649b5".fromHex();
  static Color colorDeepBlue = "#0B27AB".fromHex();
  static Color colorSoftBlue = "#F2F3FB".fromHex();
  static Color colorLightGray = "#f8f8f8".fromHex();
  static Color colorGrayCCC = "#ccc".fromHex();
  static Color colorTextFieldLabel = "#7C7D7E".fromHex();
  static Color colorShuriken = "#B5353649".fromHex();
  static Color colorTransparentBlack = "#B9050505".fromHex();
  static Color colorNewOrder = "#B9ECD4".fromHex();
  static Color colorAcceptedOrder = "#DBECB9".fromHex();
  static Color colorPreparedOrder = "#C6EAFA".fromHex();
  static Color colorPackedOrder = "#FAE9CF".fromHex();
  static Color colorDeliveryOrder = "#BFE9FF".fromHex();
  static Color colorCompletedOrder = "#17BB4D".fromHex();
  static Color colorRejectedOrder = "#FACFCF".fromHex();
  static Color colorDraftOrder = "#E3EEFF".fromHex();
  static Color colorCallOrderLabel = "#2A64BF".fromHex();
  static Color colorRejectedOrderReason = "#AF4C4C".fromHex();
  static Color colorNoteBackground = "#EEEEEE".fromHex();
  static Color colorDarkBlue = "#0D1863".fromHex();

  static Color colorMailForHelp = "#9f0b0b".fromHex();
  static Color colorSnakbarErrorBg = "#e09e9e".fromHex();
  static Color colorSnakbarErrorText = "#ab0707".fromHex();
}

extension HexColor on String {
  Color fromHex() {
    String hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
