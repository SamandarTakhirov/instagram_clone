import 'package:flutter/material.dart';

import '../../common/constants/app_color.dart';
import '../../common/constants/icons.dart';
import '../../feature/clone/widget/custom_bottom_images.dart';
import 'add_posts/add_posts.dart';
import 'home/home_page.dart';
import 'profile/profil_page.dart';
import 'reels_page/reels_page.dart';
import 'search/search_page.dart';

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
          HomePage(),
          SearchPage(),
          AddPosts(),
          ReelsPage(),
          UserProfile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: pageIndex == 3 ? AppColor.black : AppColor.white,
        currentIndex: pageIndex,
        onTap: pageChange,
        fixedColor: AppColor.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: CustomButtonImages(
              image: AppIcons.icHome,
              color: pageIndex == 3 ? AppColor.white : AppColor.black,
            ),
            label: "",
            activeIcon: CustomButtonImages(
              image: AppIcons.icHomeFill,
              color: pageIndex == 3 ? AppColor.white : AppColor.black,
            ),
          ),
          BottomNavigationBarItem(
            icon: CustomButtonImages(
              image: AppIcons.icSearch,
              color: pageIndex == 3 ? AppColor.white : AppColor.black,
            ),
            label: "",
            activeIcon: CustomButtonImages(
              image: AppIcons.icSearchFill,
              color: pageIndex == 3 ? AppColor.white : AppColor.black,
            ),
          ),
          BottomNavigationBarItem(
            icon: CustomButtonImages(
              image: AppIcons.icAdded,
              color: pageIndex == 3 ? AppColor.white : AppColor.black,
            ),
            label: "",
            activeIcon: CustomButtonImages(
              image: AppIcons.icAdded,
              color: pageIndex == 3 ? AppColor.white : AppColor.black,
            ),
          ),
          BottomNavigationBarItem(
            icon: CustomButtonImages(
              image: AppIcons.icReels,
              color: pageIndex == 3 ? AppColor.white : AppColor.black,
            ),
            label: "",
            activeIcon: CustomButtonImages(
              image: AppIcons.icReels,
              color: pageIndex == 3 ? AppColor.white : AppColor.black,
            ),
          ),
          BottomNavigationBarItem(
            icon: CustomButtonImages(
              image: AppIcons.icProfile,
              color: pageIndex == 3 ? AppColor.white : AppColor.black,
            ),
            label: "",
            activeIcon: CustomButtonImages(
              image: AppIcons.icProfileFill,
              color: pageIndex == 3 ? AppColor.white : AppColor.black,
            ),
          ),
        ],
      ),
    );
  }
}
