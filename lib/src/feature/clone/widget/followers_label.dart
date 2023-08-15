import 'package:flutter/material.dart';
import 'package:instagram_clone/src/common/constants/app_color.dart';

import '../../../common/constants/icons.dart';
import 'circle_avatar.dart';

class FollowersLabel extends StatefulWidget {
  const FollowersLabel({Key? key}) : super(key: key);

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
                  image: AppIcons.flutterBro,
                  avatarSize: 26,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomCircleAvatar(
                  image: AppIcons.flutterBro,
                  avatarSize: 26,
                ),
              ),
              CustomCircleAvatar(
                image: AppIcons.flutterBro,
                avatarSize: 26,
              ),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: TextStyle(
              fontSize: 14,
              color: AppColor.black,
            ),
            children: [
              TextSpan(text: "Followed by "),
              TextSpan(
                text: "username, username\n",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: " and "),
              TextSpan(
                text: " 100 others",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
