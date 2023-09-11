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
          height: 28,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: CustomCircleAvatar(
                  isGradient: false,
                  image: widget.userIconTwo,
                  avatarSize: 28,
                ),
              ),
              CustomCircleAvatar(
                isGradient: false,
                image:  widget.userIconOne,
                avatarSize: 28,
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            maxLines: 3,
            textAlign: TextAlign.start,
            text:  TextSpan(
              style: const TextStyle(
                fontSize: 14,
                color: AppColor.black,
              ),
              children: [
                const TextSpan(text: "Followed by "),
                TextSpan(
                  text: "${widget.userNameOne}, ${widget.userNameTwo}",
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
        ),
      ],
    );
  }
}
