import 'package:flutter/material.dart';

import 'circle_avatar.dart';

class ActualStory extends StatefulWidget {
  final String image;
  final String text;

  const ActualStory({
    required this.text,
    required this.image,
    super.key,
  });

  @override
  State<ActualStory> createState() => _ActualStoryState();
}

class _ActualStoryState extends State<ActualStory> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 60,
      child: Column(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: CustomCircleAvatar(
              image: widget.image,
              avatarSize: 60,
              isGradient: false,
            ),
          ),
          Text(
            widget.text,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
