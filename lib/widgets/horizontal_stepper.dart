import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/common/dot_provider.dart';
import 'package:flutter/material.dart';

class HorizontalStepperItem extends StatelessWidget {
  /// Stepper Item to show horizontal stepper
  const HorizontalStepperItem({
    Key? key,
    required this.data,
    required this.index,
    required this.totalLength,
    required this.activeIndex,
    required this.isInverted,
    required this.activeBarColor,
    required this.inActiveBarColor,
    required this.barHeight,
  }) : super(key: key);

  /// Stepper item of type [StepperData] to inflate stepper with data
  final StepperData data;

  /// Index at which the item is present
  final int index;

  /// Total length of the list provided
  final int totalLength;

  /// Active index which needs to be highlighted and before that
  final int activeIndex;

  /// Inverts the stepper with text that is being used
  final bool isInverted;

  /// Bar color for active step
  final Color activeBarColor;

  /// Bar color for inactive step
  final Color inActiveBarColor;

  /// Bar height/thickness
  final double barHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: isInverted ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: isInverted ? getInvertedChildren() : getChildren(),
    );
  }

  List<Widget> getChildren() {
    return [
      Row(
        children: [
          DotProvider(
            activeIndex: activeIndex,
            index: index,
            item: data,
            totalLength: totalLength,
            iconHeight: data.iconHeight,
            iconWidth: data.iconWidth,
          ),
        ],
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}
