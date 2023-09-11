import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/icons.dart';
import '../../../common/service/api_service.dart';
import '../../../common/utils/debouncing_throttling.dart';
import '../../../feature/clone/data/repository.dart';
import '../../../feature/clone/models/photo_model.dart';
import '../../../feature/clone/widget/account_edit.dart';
import '../../../feature/clone/widget/account_information.dart';
import '../../../feature/clone/widget/actual_story.dart';
import '../../../feature/clone/widget/circle_avatar.dart';
import '../../../feature/clone/widget/custom_bottom_images.dart';
import '../../../feature/clone/widget/followers_label.dart';
import '../../../feature/clone/widget/followers_text.dart';
import '../../../feature/clone/widget/shimmer_profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late final IPhotoRepository photoRepository;
  late final TextEditingController controller;
  List<PhotoModel> photos = [];
  bool isLoading = false;
  bool isPaginationLoading = false;
  late final ScrollController scrollController;
  int page = 1;
  int searchPage = 1;
  final double expandedHeight = 300;
  final deBouncing = DeBouncing(const Duration(milliseconds: 300));

  @override
  void initState() {
    super.initState();
    photoRepository = PhotoRepositoryImpl(APIService());
    controller = TextEditingController();
    scrollController = ScrollController()
      ..addListener(pagination)
      ..addListener(appBarExtend);
    getPhotos();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController
      ..removeListener(pagination)
      ..removeListener(appBarExtend);
    scrollController.dispose();
    deBouncing.dispose();
    super.dispose();
  }

  void getPhotos() async {
    setState(() => isLoading = true);

    page = 1;
    photos = await photoRepository.paginationPhotos(page++);

    setState(() => isLoading = false);
  }

  void pagination() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (controller.text.trim().isNotEmpty) {
        List<PhotoModel> paginationPhoto = await photoRepository.searchPhotos(
          searchPage++,
          controller.text.trim(),
        );
        photos.addAll(paginationPhoto);
        setState(() {});
      } else {
        List<PhotoModel> paginationPhoto =
            await photoRepository.paginationPhotos(page++);
        photos.addAll(paginationPhoto);
        setState(() {});
      }
    }
  }

  void searchingPhotos(String text) {
    setState(() => isLoading = true);

    deBouncing.handler(() async {
      if (text.isEmpty) {
        searchPage = 1;
        getPhotos();
      } else {
        photos = await photoRepository.searchPhotos(
          searchPage++,
          text.trim(),
        );
      }

      setState(() => isLoading = false);
    });
  }

  bool get isAppBarExpanded =>
      scrollController.hasClients &&
      scrollController.offset > (expandedHeight - kToolbarHeight);

  void appBarExtend() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: SizedBox(
                  width: 230,
                  child: Row(
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        photos[1].user!.social!.instagramUsername ?? "username",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(width: 5),
                      photos[1].user?.totalCollections != 0
                          ? SizedBox(
                              width: 30,
                              height: 20,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  color: AppColor.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Center(
                                  child: Text(
                                    "${photos[1].user?.totalCollections}",
                                    style: const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () {},
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
              body: NestedScrollView(
                controller: scrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: 370,
                      toolbarHeight: 0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomCircleAvatar(
                                    image:
                                        "${photos[1].user?.profileImage?.large}",
                                  ),
                                  FollowersText(
                                    text: "Posts",
                                    count: "${photos[1].user?.totalPhotos}",
                                  ),
                                  FollowersText(
                                    text: "Followers",
                                    count:
                                        "${photos[1].user?.links?.followers?.length}",
                                  ),
                                  FollowersText(
                                    text: "Following",
                                    count:
                                        "${photos[1].user?.links?.following?.length}",
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: AccountInformation(
                                accountName: "${photos[1].user?.name}",
                                bio: "${photos[1].user!.bio ?? ""} ",
                                bioHashtag: "#hashtag",
                                category: photos[1].user!.location ?? "",
                                link: photos[1].user!.portfolioUrl ?? "",
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: FollowersLabel(
                                othersCount:
                                    "${photos[1].user?.links?.followers?.length}",
                                userIconOne:
                                    "${photos[2].user?.profileImage?.large}",
                                userIconTwo:
                                    "${photos[3].user?.profileImage?.large}",
                                userNameOne:
                                    "${photos[2].user?.instagramUsername}",
                                userNameTwo:
                                    photos[3].user?.instagramUsername ?? "",
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
                                        image:
                                            photos[index].urls?.regular ?? "",
                                        text: "${photos[index].user?.name}",
                                      ),
                                    ],
                                  );
                                },
                                itemCount: photos.length,
                              ),
                            ),
                          ],
                        ),
                        collapseMode: CollapseMode.pin,
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: MySliverHeaderDelegate(),
                      pinned: true,
                    ),
                  ];
                },
                body: TabBarView(
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
                                  photos[index].urls?.regular ?? "",
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
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
                                  photos[index].urls?.regular ?? "",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  children: [
                                    const Icon(
                                      CupertinoIcons.play_fill,
                                      size: 12,
                                      color: AppColor.white,
                                    ),
                                    Text(
                                      "${photos[index].user?.totalPhotos}",
                                      style:
                                          const TextStyle(color: Colors.white),
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
                                  photos[index].urls?.regular ?? "",
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
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
            ),
          )
        : const Scaffold(
            body: ShimmerProfile(),
          );
  }
}

class MySliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(Object context, double shrinkOffset, bool overlapsContent) {
    return const ColoredBox(
      color: Colors.white,
      child: TabBar(
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
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
