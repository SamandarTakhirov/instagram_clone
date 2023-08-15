import 'dart:async';

import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/icons.dart';
import '../../../common/service/api_service.dart';
import '../data/repository.dart';
import '../models/photo_model.dart';
import '../widget/account_edit.dart';
import '../widget/account_information.dart';
import '../widget/account_posts.dart';
import '../widget/actual_story.dart';
import '../widget/circle_avatar.dart';
import '../widget/custom_bottom_images.dart';
import '../widget/followers_label.dart';
import '../widget/followers_text.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List<PhotoModel> photos = [];
  late final IPhotoRepository photoRepository;

  @override
  void initState() {
    super.initState();
    photoRepository = PhotoRepositoryImpl(APIService());
    getAllPhotos();
  }

  Future<void> getAllPhotos() async {
    photos = await photoRepository.getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Row(
          children: [
            Text(
              "${photos[8].user?.social?.instagramUsername}",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 30,
              height: 20,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColor.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    "${photos[3].user?.totalCollections}",
                    style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        actions: [
          InkWell(
            onTap: () {            },
            child: const CustomButtonImages(image: AppIcons.icAdded),
          ),
          const SizedBox(width: 10),
          IconButton(
            splashRadius: 15,
            onPressed: () {},
            icon: const Icon(Icons.menu, size: 30),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   CustomCircleAvatar(
                    image: "${photos[9].user?.profileImage?.large}",
                  ),
                  FollowersText(
                    text: "Posts",
                    count: "${photos[9].user?.totalPhotos}",
                  ),
                  FollowersText(
                    text: "Followers",
                    count: "${photos[9].user?.totalCollections}",
                  ),
                  FollowersText(
                    text: "Following",
                    count: "${photos[2].user?.totalLikes}",
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AccountInformation(
                accountName: "${photos[9].user?.name}",
                bio: "${photos[9].user?.bio} ",
                bioHashtag: "#hashtag",
                category: "${photos[9].user?.location}",
                link: "${photos[9].user?.portfolioUrl}",
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FollowersLabel(
                othersCount: "${photos[3].user?.totalCollections}",
                userIconOne: "${photos[1].user?.profileImage?.large}",
                userIconTwo: "${photos[2].user?.profileImage?.large}",
                userNameOne: "${photos[1].user?.name}",
                userNameTwo: "${photos[2].user?.name}",
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: AccountEdit(),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      const SizedBox(width: 10),
                      ActualStory(
                        image: "${photos[index].user?.profileImage?.large}",
                        text: "${photos[index].user?.name}",
                      ),
                    ],
                  );
                },
                itemCount: 8,
              ),
            ),
             AccountsPosts(
              photos: photos,
            )
          ],
        ),
      ),
    );
  }
}
