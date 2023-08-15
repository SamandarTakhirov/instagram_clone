import 'package:flutter/material.dart';

import '../../../common/constants/icons.dart';
import 'circle_avatar.dart';

class ActualStory extends StatefulWidget {
  const ActualStory({Key? key}) : super(key: key);

  @override
  State<ActualStory> createState() => _ActualStoryState();
}

class _ActualStoryState extends State<ActualStory> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomCircleAvatar(
          image: AppIcons.flutterBro,
          avatarSize: 60,
          isGradient: false,
        ),
        Text(
          "Text  here",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
