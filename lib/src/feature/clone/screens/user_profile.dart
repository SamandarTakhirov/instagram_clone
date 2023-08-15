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
  late final Repository repository;
  late final TextEditingController controller;

  List<PhotoModel> photos = [];
  Timer? _timer;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    repository = RepositoryIMP(APIService());
    controller = TextEditingController();
    getPhoto();
  }

  void getPhoto() async {
    setState(() {
      isLoading = true;
    });

    photos = await repository.getPhotos();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void searchPosts(String text) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
    }

    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title:  Row(
          children: [
            Text(
              "${photos.firstOrNull}",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
            const SizedBox(width: 5),
            const SizedBox(
              width: 30,
              height: 20,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColor.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    "10+",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        actions: const [
          CustomButtonImages(image: AppIcons.icAdded),
          SizedBox(width: 10),
          Icon(Icons.menu, size: 30),
          SizedBox(width: 10),
        ],
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCircleAvatar(
                    image: AppIcons.flutterBro,
                  ),
                  FollowersText(
                    text: "Posts",
                    count: "1,234",
                  ),
                  FollowersText(
                    text: "Followers",
                    count: "5,678",
                  ),
                  FollowersText(
                    text: "Following",
                    count: "9,101",
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: AccountInformation(
                accountName: "Flutter.Bro",
                bio:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ",
                bioHashtag: "#hashtag",
                category: "Category/Genre text",
                link: "Link goes here",
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: FollowersLabel(),
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
                  return const Row(
                    children: [
                      SizedBox(width: 15),
                      ActualStory(),
                    ],
                  );
                },
                itemCount: 10,
              ),
            ),
            const AccountsPosts()
          ],
        ),
      ),
    );
  }
}
