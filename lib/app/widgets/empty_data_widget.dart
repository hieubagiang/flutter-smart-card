import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_card/app/common/utils/utils.dart';

class EmptyDataWidget extends StatelessWidget {
  final String? message;

  const EmptyDataWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /*SvgPicture.asset(
            IconUtils.emptyDataIcon,
            width: HeightUtils.iconSize,
            height: HeightUtils.iconSize,
          ),*/
          SizedBox(height: SpaceUtils.spaceMedium),
          Text(
            message ?? 'empty_data'.tr,
            style:
                StyleUtils.style14Bold.copyWith(color: ColorUtils.primaryColor),
          ),
        ],
      ),
    );
  }
}
