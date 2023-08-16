import 'package:flutter/material.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool isCircle;

  const ShimmerWidget({
    required this.height,
    required this.width,
    this.isCircle = false,
    super.key,
});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width,
      height: height,
      child:  DecoratedBox(
        decoration: BoxDecoration(
          shape: isCircle? BoxShape.circle : BoxShape.rectangle,
          color: Color(0xFFDADADA),
          borderRadius: isCircle? null :BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
