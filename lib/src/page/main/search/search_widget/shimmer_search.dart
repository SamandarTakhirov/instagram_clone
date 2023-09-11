import 'package:flutter/material.dart';

import '../../../../feature/clone/widget/shimmer_widget.dart';

class ShimmerSearch extends StatelessWidget {
  const ShimmerSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: ShimmerWidget(
                width: size.width,
                height: 40,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 2; i++)
                        SizedBox(
                          width: size.width / 3 * 2 - 5,
                          height: size.width / 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ShimmerWidget(
                                width: size.width / 3 - 5,
                                height: size.width / 3 - 5,
                              ),
                              ShimmerWidget(
                                width: size.width / 3 - 5,
                                height: size.width / 3 - 5,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  ShimmerWidget(
                    width: size.width / 3 - 10,
                    height: size.width / 3 * 2 - 5,
                  ),
                ],
              ),
            ),
            for (int i = 0; i < 2; i++)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget(
                      width: size.width / 3 - 10,
                      height: size.width / 3 - 5,
                    ),
                    ShimmerWidget(
                      width: size.width / 3 - 10,
                      height: size.width / 3 - 5,
                    ),
                    ShimmerWidget(
                      width: size.width / 3 - 10,
                      height: size.width / 3 - 5,
                    ),
                  ],
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShimmerWidget(
                  width: size.width / 3 * 2 - 5,
                  height: size.width / 3 * 2 - 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShimmerWidget(
                      width: size.width / 3 - 10,
                      height: size.width / 3 - 5,
                    ),
                    ShimmerWidget(
                      width: size.width / 3 - 10,
                      height: size.width / 3 - 5,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
