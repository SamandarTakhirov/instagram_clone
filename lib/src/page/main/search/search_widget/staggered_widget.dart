import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredWidget extends StatelessWidget {
  final double? crossAxisCellCount;
  final double? mainAxisCellCount;
  final String image;

  const StaggeredWidget({
    required this.image,
    this.crossAxisCellCount = 1,
    this.mainAxisCellCount = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      width: mainAxisCellCount,
      height: crossAxisCellCount,
      fit: BoxFit.cover,
      image: NetworkImage(image),
    );
  }
}
