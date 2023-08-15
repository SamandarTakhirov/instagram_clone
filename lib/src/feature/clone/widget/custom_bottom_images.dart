import 'package:flutter/material.dart';

class CustomButtonImages extends StatelessWidget {
  final String image;

  const CustomButtonImages({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Image(
        image: AssetImage(image),
      ),
    );
  }
}
