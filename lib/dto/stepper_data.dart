import 'package:flutter/material.dart';

class StepperData {
  /// title for the stepper
  final StepperText? title;

  /// subtitle for the stepper
  final StepperText? subtitle;

  final Widget? iconWidget;

  final double? iconHeight;

  final double? iconWidth;

  /// Use the constructor of [StepperData] to pass the data needed.
  StepperData({this.iconWidget, this.title, this.subtitle, this.iconHeight, this.iconWidth});
}

class StepperText {
  /// text for the stepper
  final String text;

  /// textStyle for stepper
  final TextStyle? textStyle;

  StepperText(this.text, {this.textStyle});
}
