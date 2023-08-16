import 'package:flutter/material.dart';

import 'shimmer_widget.dart';

class ShimmerProfile extends StatelessWidget {
  const ShimmerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  ShimmerWidget(
                    width: 200,
                    height: 30,
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ShimmerWidget(
                      width: 30,
                      height: 30,
                    ),
                  ),
                  ShimmerWidget(
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const ShimmerWidget(
                    height: 90,
                    width: 90,
                    isCircle: true,
                  ),
                  const Spacer(),
                  for (int i = 0; i < 3; i++)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: 65,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ShimmerWidget(height: 25, width: 60),
                            ShimmerWidget(height: 25, width: 60),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
              child: SizedBox(
                height: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerWidget(height: 15, width: 150),
                          ShimmerWidget(height: 12, width: 100),
                          ShimmerWidget(height: 12, width: 300),
                          ShimmerWidget(height: 12, width: 250),
                          ShimmerWidget(height: 12, width: 150),
                        ],
                      ),
                    ),
                    ShimmerWidget(
                      height: 40,
                      width: double.infinity,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShimmerWidget(
                          height: 35,
                          width: 300,
                        ),
                        ShimmerWidget(
                          height: 35,
                          width: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  5,
                  (index) => const SizedBox(
                    height: 75,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerWidget(
                            height: 55,
                            width: 55,
                            isCircle: true,
                          ),
                          ShimmerWidget(height: 15, width: 50),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3,
                  (index) => const ShimmerWidget(height: 30, width: 30),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) => const ShimmerWidget(height: 125, width: 125)),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) => const ShimmerWidget(height: 125, width: 125)),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) => const ShimmerWidget(height: 125, width: 125)),
            ),
          ],
        ),
      ),
    );
  }
}
