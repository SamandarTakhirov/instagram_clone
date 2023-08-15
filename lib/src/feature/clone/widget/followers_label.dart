import 'package:flutter/material.dart';
import '../../../common/constants/app_color.dart';
import 'circle_avatar.dart';

class FollowersLabel extends StatefulWidget {
  final String userNameOne;
  final String userIconOne;
  final String userNameTwo;
  final String userIconTwo;
  final String othersCount;

  const FollowersLabel({
    required this.userIconOne,
    required this.userIconTwo,
    required this.userNameOne,
    required this.userNameTwo,
    required this.othersCount,
    super.key,
  });

  @override
  State<FollowersLabel> createState() => _FollowersLabelState();
}

class _FollowersLabelState extends State<FollowersLabel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         SizedBox(
          width: 54,
          height: 26,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomCircleAvatar(
                  isGradient: false,
                  image: widget.userIconOne,
                  avatarSize: 26,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomCircleAvatar(
                  isGradient: false,
                  image: widget.userIconTwo,
                  avatarSize: 26,
                ),
              ),
              CustomCircleAvatar(
                isGradient: false,
                image:  widget.userIconOne,
                avatarSize: 26,
              ),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.start,
          text:  TextSpan(
            style: const TextStyle(
              fontSize: 14,
              color: AppColor.black,
            ),
            children: [
              const TextSpan(text: "Followed by "),
              TextSpan(
                text: "${widget.userNameOne}, ${widget.userNameTwo}\n",
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const TextSpan(text: " and "),
              TextSpan(
                text: " ${widget.othersCount} others",
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
