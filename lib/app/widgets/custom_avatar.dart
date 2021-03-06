import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smart_card/app/common/utils/utils.dart';

import '../../gen/assets.gen.dart';

class CustomAvatar extends StatefulWidget {
  final String? fullName;
  final String? avatarUrl;
  final File? file;
  final String? asset;
  final Widget? assetWidget;
  final Function()? onTap;
  final double? sizeAvatar;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? padding;
  final double? borderRadius;
  final bool? showCameraIcon;
  final bool? isCircleAvatar;
  final String? memoryImage;

  const CustomAvatar({
    Key? key,
    this.memoryImage,
    this.fullName = '',
    this.avatarUrl,
    this.file,
    this.asset,
    this.assetWidget,
    this.onTap,
    this.sizeAvatar,
    this.backgroundColor,
    this.borderColor,
    this.padding,
    this.borderRadius = 0,
    this.showCameraIcon = false,
    this.isCircleAvatar = true,
  }) : super(key: key);

  @override
  _CustomAvatarState createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  String _getAvatarText() {
    return FunctionUtils.convertFullNameToAvatarText(widget.fullName);
  }

  @override
  Widget build(BuildContext context) {
    final newSizeAvatar = widget.sizeAvatar ?? 160.w;
    return InkWell(
      onTap: widget.onTap,
      child: Stack(children: [
        Container(
          height: newSizeAvatar,
          width: newSizeAvatar,
          decoration: BoxDecoration(
            border: Border.all(
              width: widget.padding ?? 0,
              color:
                  widget.borderColor ?? widget.backgroundColor ?? Colors.white,
            ),
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: (widget.isCircleAvatar ?? false)
                ? BorderRadius.circular(80.w)
                : BorderRadius.circular(widget.borderRadius ?? 0),
            child: _buildAvatarWidget(newSizeAvatar),
          ),
        ),
        (widget.showCameraIcon ?? false)
            ? Positioned(
                // bottom: SpaceUtils.spaceSmall,
                // right: SpaceUtils.spaceSmall,
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(SpaceUtils.spaceSmall),
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorUtils.primaryColor,
                      border: Border.all(color: Colors.white, width: 2)),
                  child: Assets.svgs.icCamera
                      .svg(color: ColorUtils.secondaryColor),
                ),
              )
            : const SizedBox()
      ]),
    );
  }

  Widget _buildAvatarWidget(num newSizeAvatar) {
    if (widget.memoryImage != null) {
      return Image(
        fit: BoxFit.cover,
        image: MemoryImage(base64Decode(widget.memoryImage!)),
        frameBuilder: (BuildContext context, Widget child, int? frame,
            bool wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedOpacity(
            child: child,
            opacity: wasSynchronouslyLoaded ? 0 : 1,
            duration: const Duration(seconds: 3),
            curve: Curves.easeOut,
          );
        },
      );
    }
    if (widget.file != null) {
      return Image.file(
        widget.file!,
        fit: BoxFit.cover,
      );
    }
    if (widget.avatarUrl != null && widget.avatarUrl!.isNotEmpty) {
      return CachedNetworkImage(
        cacheKey: widget.avatarUrl,
        imageUrl: widget.avatarUrl!,
        progressIndicatorBuilder: (context, url, downloadProgress) => Container(
            margin: EdgeInsets.all(SpaceUtils.spaceLarge),
            child: CircularProgressIndicator(
                value: downloadProgress.progress,
                color: ColorUtils.primaryColor)),
        fit: BoxFit.cover,
        errorWidget: (context, url, error) {
          return const Icon(Icons.info);
        },
      );
    }

    if (widget.assetWidget != null) {
      return widget.assetWidget!;
    }
    if (widget.asset != null && widget.asset!.isNotEmpty) {
      return CachedNetworkImage(
        cacheKey: widget.asset,
        imageUrl: widget.asset!,
        fit: BoxFit.cover,
      );
    }
    return Container(
      color: _getAvatarText().isEmpty
          ? ColorUtils.greyColor
          : ColorUtils.primaryColor,
      height: SizeUtils.avatarSize,
      width: SizeUtils.avatarSize,
      child: Center(
        child: _getAvatarText().isEmpty
            ? Icon(
                Icons.person,
                size: SizeUtils.avatarSize,
              )
            : Text(
                _getAvatarText(),
                style: StyleUtils.style16Normal
                    .copyWith(color: ColorUtils.secondaryColor),
              ),
      ),
    );
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }
}
