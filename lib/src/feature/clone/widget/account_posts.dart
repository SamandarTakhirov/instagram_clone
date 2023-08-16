import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/src/feature/clone/models/photo_model.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/icons.dart';
import 'custom_bottom_images.dart';

class AccountsPosts extends StatelessWidget {
  final List<PhotoModel> photos;

  const AccountsPosts({
    required this.photos,
    super.key,
  });

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
                  photos.length,
                  (index) => SizedBox(
                    width: 130,
                    height: 130,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image(
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          image: NetworkImage(
                            "${photos[index].urls?.regular ?? ""}",
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Image(
                            width: 12,
                            height: 12,
                            image: AssetImage(AppIcons.icCarouselImg),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GridView.count(
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 1 / 1.6,
                crossAxisCount: 3,
                children: List.generate(
                  photos.length,
                  (index) => SizedBox(
                    width: 130,
                    height: 130,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image(
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          image: NetworkImage(
                            "${photos[index].urls?.regular ?? ""}",
                          ),
                        ),
                         Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            children: [
                              const Icon(
                                CupertinoIcons.play_fill,
                                size: 12,
                                color: AppColor.white,
                              ),
                              Text(
                                "${photos[index].user?.totalPhotos}",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GridView.count(
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                crossAxisCount: 3,
                children: List.generate(
                  photos.length,
                      (index) => SizedBox(
                    width: 130,
                    height: 130,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image(
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          image: NetworkImage(
                            "${photos[index].urls?.regular ?? ""}",
                          ),
                        ),
                        const Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Image(
                            width: 12,
                            height: 12,
                            image: AssetImage(AppIcons.icReels),
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
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
