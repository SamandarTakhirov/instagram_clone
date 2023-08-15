import 'package:flutter/material.dart';

class FollowersText extends StatefulWidget {
  final String count;
  final String text;
  const FollowersText({
    required this.text,
    required this.count,
    super.key,
});

  @override
  State<FollowersText> createState() => _FollowersTextState();
}

class _FollowersTextState extends State<FollowersText> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          widget.count,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        Text(
          widget.text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
