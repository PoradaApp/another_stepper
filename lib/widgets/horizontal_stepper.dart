import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/common/dot_provider.dart';
import 'package:flutter/material.dart';

class HorizontalStepperItem extends StatelessWidget {
  /// Stepper Item to show horizontal stepper
  const HorizontalStepperItem({
    Key? key,
    required this.item,
    required this.index,
    required this.totalLength,
    required this.activeIndex,
    required this.isInverted,
    required this.activeBarColor,
    required this.inActiveBarColor,
    required this.barHeight,
  }) : super(key: key);

  /// Stepper item of type [StepperData] to inflate stepper with data
  final StepperData item;

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
      if (item.title != null) ...[
        SizedBox(
          child: Text(
            item.title!.text,
            textAlign: TextAlign.center,
            style: item.title!.textStyle ??
                const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const SizedBox(height: 4),
      ],
      if (item.subtitle != null) ...[
        SizedBox(
          child: Text(
            item.subtitle!.text,
            textAlign: TextAlign.center,
            style: item.subtitle!.textStyle ??
                const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        const SizedBox(height: 8),
      ],
      Row(
        children: [
          /*  if (index != 0)
            Flexible(
              child: Container(
                color: (index <= activeIndex ? activeBarColor : inActiveBarColor),
                height: barHeight,
              ),
            ), */
          DotProvider(
            activeIndex: activeIndex,
            index: index,
            item: item,
            totalLength: totalLength,
            iconHeight: item.iconHeight,
            iconWidth: item.iconWidth,
          ),
          /*  if (index != totalLength - 1)
            Flexible(
              child: Container(
                color: (index < activeIndex ? activeBarColor : inActiveBarColor),
                height: barHeight,
              ),
            ), */
        ],
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}
