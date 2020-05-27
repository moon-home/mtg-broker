import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double rawBlockHorizontal;
  static double rawBlockSizeVertical;

  static double safeAreaHeight;
  static double safeAreaWidth;
  static double blockHorizontal;
  static double blockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    rawBlockHorizontal = screenWidth / 100;
    rawBlockSizeVertical = screenHeight / 100;

    safeAreaHeight = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    safeAreaWidth = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    blockHorizontal = (screenWidth - safeAreaHeight) / 100;
    blockVertical = (screenHeight - safeAreaWidth) / 100;
  }
}