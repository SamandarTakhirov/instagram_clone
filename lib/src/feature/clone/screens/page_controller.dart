import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/icons.dart';
import '../widget/custom_bottom_images.dart';
import 'add_posts.dart';
import 'home_page.dart';
import 'reels_page.dart';
import 'search_page.dart';
import 'user_profile.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({Key? key}) : super(key: key);

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  int pageIndex = 0;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void pageChange(int value) {
    pageController.jumpToPage(value);
    setState(() {
      pageIndex = value;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: pageChange,
        children: const [
          //PostView(),
          HomePage(),
          SearchPage(),
          AddPosts(),
          ReelsPage(),
          UserProfile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: pageChange,
        fixedColor: AppColor.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: CustomButtonImages(image: AppIcons.icHome),
            label: "",
            activeIcon: CustomButtonImages(image: AppIcons.icHomeFill),
          ),
          BottomNavigationBarItem(
            icon: CustomButtonImages(image: AppIcons.icSearch),
            label: "",
            activeIcon: CustomButtonImages(image: AppIcons.icSearchFill),
          ),
          BottomNavigationBarItem(
            icon: CustomButtonImages(image: AppIcons.icAdded),
            label: "",
            activeIcon: CustomButtonImages(image: AppIcons.icAdded),
          ),
          BottomNavigationBarItem(
            icon: CustomButtonImages(image: AppIcons.icReels),
            label: "",
            activeIcon: CustomButtonImages(image: AppIcons.icReels),
          ),
          BottomNavigationBarItem(
            icon: CustomButtonImages(image: AppIcons.icProfile),
            label: "",
            activeIcon: CustomButtonImages(image: AppIcons.icProfileFill),
          ),
        ],
      ),
    );
  }
}
