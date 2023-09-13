import 'package:flutter/material.dart';

class CustomButtonImages extends StatelessWidget {
  final String image;
  final Color color;

  const CustomButtonImages({
    required this.color,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Image(
        color: color,
        image: AssetImage(image),
      ),
    );
  }
}
