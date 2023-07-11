import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/utils/utils.dart';
import 'package:another_stepper/widgets/stepper_dot_widget.dart';
import 'package:flutter/material.dart';

class HorizontalStepperItem extends StatelessWidget {
  /// Stepper Item to show horizontal stepper
  const HorizontalStepperItem(
      {Key? key,
      required this.item,
      required this.index,
      required this.totalLength,
      required this.activeIndex,
      required this.isInverted,
      required this.activeBarColor,
      required this.inActiveBarColor,
      required this.barHeight,
      required this.dotWidget,
      required this.titleTextStyle,
      required this.subtitleTextStyle})
      : super(key: key);

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

  /// [Widget] for dot/point
  final Widget? dotWidget;

  /// [TextStyle] for title
  final TextStyle titleTextStyle;

  /// [TextStyle] for subtitle
  final TextStyle subtitleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: isInverted ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: isInverted ? getInvertedChildren() : getChildren(),
      ),
    );
  }

  List<Widget> getChildren() {
    final Widget dot = dotWidget ??
        StepperDot(
          index: index,
          totalLength: totalLength,
          activeIndex: activeIndex,
        );
    return [
      if (item.title != null) ...[
        SizedBox(
            child: Text(
          item.title!,
          textAlign: TextAlign.center,
          style: titleTextStyle,
        )),
        const SizedBox(height: 4),
      ],
      if (item.subtitle != null) ...[
        SizedBox(
            child: Text(
          item.subtitle!,
          textAlign: TextAlign.center,
          style: subtitleTextStyle,
        )),
        const SizedBox(height: 8),
      ],
      Row(
        children: [
          if (index == 0)
            const SizedBox()
          else
            Flexible(
              child: Container(
                color: (index <= activeIndex ? activeBarColor : inActiveBarColor),
                height: barHeight,
              ),
            ),
          index <= activeIndex
              ? dot
              : ColorFiltered(
                  colorFilter: Utils.getGreyScaleColorFilter(),
                  child: dot,
                ),
          if (index == totalLength - 1)
            const SizedBox()
          else
            Flexible(
              child: Container(
                color: (index < activeIndex ? activeBarColor : inActiveBarColor),
                height: barHeight,
              ),
            ),
        ],
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}
