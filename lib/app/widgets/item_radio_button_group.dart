import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_card/app/common/utils/utils.dart';

import '../../gen/assets.gen.dart';

class RadioButtonGroup extends StatefulWidget {
  const RadioButtonGroup({
    Key? key,
    required this.onChanged,
    required this.items,
    this.initialIndex = 0,
    this.isEnabled = true,
  }) : super(key: key);

  final Function(int? value) onChanged;
  final List<String> items;
  final int initialIndex;
  final bool? isEnabled;

  @override
  State<RadioButtonGroup> createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.items.isEmpty
          ? [const SizedBox()]
          : widget.items
              .map(
                (e) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomRadio(
                        value: widget.items.indexOf(e),
                        groupValue: widget.initialIndex,
                        isEnabled: widget.isEnabled,
                        onChanged: (index) {
                          widget.onChanged(index);
                          setState(() {});
                        }),
                    Text(
                      e,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "SFUITextRegular",
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                  ],
                ),
              )
              .toList(),
    );
  }
}

class CustomRadio extends StatefulWidget {
  final int value;
  final int groupValue;
  final void Function(int) onChanged;
  final bool? isEnabled;

  const CustomRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () {
        if (widget.isEnabled ?? false) {
          if (!selected) widget.onChanged(widget.value);
        }
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: ColorUtils.greyColor),
        ),
        child: SvgPicture.asset(
          Assets.svgs.circle.path,
          height: 12,
          color: selected
              ? (widget.isEnabled ?? false
                  ? ColorUtils.primaryColor
                  : ColorUtils.greyColor)
              : Colors.white,
        ),
      ),
    );
  }
}
