import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/icons.dart';
import 'custom_bottom_images.dart';

class AccountsPosts extends StatelessWidget {
  const AccountsPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TabBar(
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
          indicatorColor: AppColor.black,
          tabs: [
            Tab(
              child: CustomButtonImages(image: AppIcons.icPosts),
            ),
            Tab(
              child: CustomButtonImages(image: AppIcons.icReelsGrey),
            ),
            Tab(
              child: CustomButtonImages(image: AppIcons.icMention),
            ),
          ],
        ),
        SizedBox(
          height: 630,
          child: TabBarView(
            children: [
              GridView.count(
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                crossAxisCount: 3,
                children: List.generate(
                  15,
                  (index) => Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ColoredBox(
                        color: Colors.primaries[index % 15],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Image(
                          width: 12,
                          height: 12,
                          image: AssetImage(AppIcons.icCarouselImg),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GridView.count(
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 1 / 1.6,
                crossAxisCount: 3,
                children: List.generate(
                  15,
                  (index) => Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      ColoredBox(
                        color: Colors.accents[index % 15],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.play_fill,
                              size: 12,
                            ),
                            Text("1555"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GridView.count(
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                crossAxisCount: 3,
                children: List.generate(
                  15,
                  (index) => Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ColoredBox(
                        color: Colors.primaries[index % 15],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Image(
                          width: 12,
                          height: 12,
                          image: AssetImage(AppIcons.icReels),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
