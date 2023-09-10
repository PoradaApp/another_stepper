import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/horizontal_stepper.dart';
import 'package:another_stepper/widgets/vertical_stepper.dart';
import 'package:flutter/material.dart';

class AnotherStepper extends StatelessWidget {
  /// Another stepper is a package, which helps build
  /// customizable and easy to manage steppers.
  ///
  /// The package can be used to build horizontal as well
  /// as vertical steppers just by providing [Axis] in the [stepperDirection] parameter.
  const AnotherStepper({
    Key? key,
    required this.stepperList,
    this.activeIndex = 0,
    required this.stepperDirection,
    this.inverted = false,
    this.activeBarColor = Colors.blue,
    this.inActiveBarColor = Colors.grey,
    this.barThickness = 2,
    this.scrollPhysics,
    this.iconHeight = 20,
    this.iconWidth = 20,
  }) : super(key: key);

  /// Stepper [List] of type [StepperData] to render the Stepper on the UI with data
  final List<StepperData> stepperList;

  /// Active index - till which [index] the stepper will be highlighted
  ///
  /// Note : When using the [iconWidget] from [StepperData] to pass
  /// your custom dotWidget, you need to pass the dotWidget decoration to make it look active.
  /// In the above case only the stepper bar color will change to [activeBarColor]
  final int activeIndex;

  /// Stepper direction takes [Axis]
  /// Use [Axis.horizontal] to get horizontal stepper
  /// Use [Axis.vertical] to get vertical stepper
  final Axis stepperDirection;

  /// Inverts the stepper with text that is being used
  final bool inverted;

  /// Bar color for active step
  final Color activeBarColor;

  /// Bar color for inactive step
  final Color inActiveBarColor;

  /// Bar width/thickness/height
  final double barThickness;

  /// Height of [StepperData.iconWidget]
  ///
  /// Default value = 20
  final double iconHeight;

  /// Width of [StepperData.iconWidget]
  ///
  /// Default value = 20
  final double iconWidth;

  /// Scroll physics for listview if it is nested with some kind of Scrolling Widget
  final ScrollPhysics? scrollPhysics;

  @override
  Widget build(BuildContext context) {
    var crossAxisAlignment = stepperDirection == Axis.horizontal ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    if (inverted) {
      // invert Alignment in case of [Axis.vertical]
      crossAxisAlignment =
          crossAxisAlignment == CrossAxisAlignment.end ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    }
    final Iterable<int> iterable = Iterable<int>.generate(stepperList.length);
    return Flex(
      crossAxisAlignment: crossAxisAlignment,
      direction: stepperDirection,
      children: iterable.map((index) => _buildStepper(context, index: index)).toList(),
    );
  }

  Widget _buildStepper(BuildContext context, {required int index}) {
    final bool isFirstItem = index == 0;
    final bool isLastItem = index == stepperList.length - 1;

    if (stepperDirection == Axis.horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isFirstItem)
            Flexible(
              child: Container(
                color: (index <= activeIndex ? activeBarColor : inActiveBarColor),
                height: barThickness,
              ),
            ),
          HorizontalStepperItem(
            index: index,
            item: stepperList[index],
            totalLength: stepperList.length,
            activeIndex: activeIndex,
            isInverted: inverted,
            inActiveBarColor: inActiveBarColor,
            activeBarColor: activeBarColor,
            barHeight: barThickness,
          ),
          if (!isLastItem)
            Flexible(
              child: Container(
                color: (index < activeIndex ? activeBarColor : inActiveBarColor),
                height: barThickness,
              ),
            ),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isFirstItem)
            Flexible(
              child: Container(
                color: (index <= activeIndex ? activeBarColor : inActiveBarColor),
                width: barThickness,
              ),
            ),
          VerticalStepperItem(
            index: index,
            item: stepperList[index],
            totalLength: stepperList.length,
            activeIndex: activeIndex,
            isInverted: inverted,
            inActiveBarColor: inActiveBarColor,
            activeBarColor: activeBarColor,
            barWidth: barThickness,
            iconHeight: iconHeight,
            iconWidth: iconWidth,
          ),
          if (!isLastItem)
            Flexible(
              child: Container(
                color: (index < activeIndex ? activeBarColor : inActiveBarColor),
                width: barThickness,
              ),
            ),
        ],
      );
    }
  }

  /* Widget _getPreferredStepper(BuildContext context, {required int index}) {
    if (stepperDirection == Axis.horizontal) {
      return HorizontalStepperItem(
        index: index,
        item: stepperList[index],
        totalLength: stepperList.length,
        activeIndex: activeIndex,
        isInverted: inverted,
        inActiveBarColor: inActiveBarColor,
        activeBarColor: activeBarColor,
        barHeight: barThickness,
      );
    } else {
      return VerticalStepperItem(
        index: index,
        item: stepperList[index],
        totalLength: stepperList.length,
        activeIndex: activeIndex,
        isInverted: inverted,
        inActiveBarColor: inActiveBarColor,
        activeBarColor: activeBarColor,
        barWidth: barThickness,
        iconHeight: iconHeight,
        iconWidth: iconWidth,
      );
    }
  } */
}
