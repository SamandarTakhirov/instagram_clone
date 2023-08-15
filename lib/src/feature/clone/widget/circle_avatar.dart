import 'package:flutter/material.dart';
import 'package:instagram_clone/src/common/constants/app_color.dart';

class CustomCircleAvatar extends StatefulWidget {
  final double? avatarSize;
  final bool? isGradient;
  final String image;
  final void Function()? onTap;

  const CustomCircleAvatar({
    required this.image,
    this.onTap,
    this.avatarSize = 90,
    this.isGradient = true,
    super.key,
  });

  @override
  State<CustomCircleAvatar> createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.avatarSize,
      height: widget.avatarSize,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: widget.isGradient! ? const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment(0.1, 1),
            colors: <Color>[
              AppColor.gradient1,
              AppColor.gradient2,
              AppColor.gradient3,
            ],
            tileMode: TileMode.mirror,
          ) : null,
          color: AppColor.grey,
        ),
        child: Padding(
          padding: EdgeInsets.all(widget.avatarSize! < 90 ? 1 : 4.0),
          child: CircleAvatar(
            backgroundColor: AppColor.white,
            child: GestureDetector(
              onTap: widget.onTap,
              child: Padding(
                padding: EdgeInsets.all(widget.avatarSize! < 90  ? 1: 4.0),
                child: SizedBox(
                  width: widget.avatarSize! < 90
                      ? widget.avatarSize! - 2
                      : widget.avatarSize! - 14,
                  height: widget.avatarSize! < 90
                      ? widget.avatarSize! - 2
                      : widget.avatarSize! - 14,
                  child: CircleAvatar(
                    foregroundImage: AssetImage(widget.image),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
