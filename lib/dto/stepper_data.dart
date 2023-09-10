import 'package:flutter/material.dart';

class StepperData {
  final Widget? iconWidget;

  final double? iconHeight;

  final double? iconWidth;

  final EdgeInsets? verticalLinePadding;

  final EdgeInsets? horizontalLinePadding;

  final Widget? optionalContent;

  /// Use the constructor of [StepperData] to pass the data needed.
  StepperData({
    this.iconWidget,
    this.iconHeight,
    this.iconWidth,
    this.verticalLinePadding,
    this.horizontalLinePadding,
    this.optionalContent,
  });
}
