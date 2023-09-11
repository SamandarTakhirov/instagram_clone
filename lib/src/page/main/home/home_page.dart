import 'package:flutter/material.dart';

import '../../../common/constants/icons.dart';
import '../../../common/service/api_service.dart';
import '../../../common/utils/debouncing_throttling.dart';
import '../../../feature/clone/data/repository.dart';
import '../../../feature/clone/models/photo_model.dart';
import '../../../feature/clone/widget/circle_avatar.dart';
import '../../../feature/clone/widget/posts_account.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    photos.shuffle();
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
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          width: 104,
          height: 30,
          child: Image(
            image: AssetImage(AppIcons.icInstagram),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Image(
              width: 24,
              height: 24,
              image: AssetImage(AppIcons.icLike),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Image(
              width: 24,
              height: 24,
              image: AssetImage(AppIcons.icDirect),
            ),
          ),
        ],
      ),
      body: ListView(
        controller: scrollController,
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    const SizedBox(width: 10),
                    CustomCircleAvatar(
                      isGradient: true,
                      avatarSize: 72,
                      image: photos[index].urls?.regular ?? "",
                      text: "${photos[index].user?.name}",
                    ),
                  ],
                );
              },
              itemCount: photos.length,
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.height,
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    const SizedBox(height: 10),
                    PostsAccount(
                      size: size,
                      time: photos[index].user!.totalCollections ?? 0,
                      height: photos[index].height?.toDouble() ?? 0,
                      width: photos[index].width?.toDouble() ?? 0,
                      image: photos[index].urls?.regular ?? "",
                      comment: photos[index].description ?? "",
                      likesCount: photos[index].user?.totalLikes ?? 0,
                      userName: photos[index].user?.instagramUsername ?? "",
                      widget: CustomCircleAvatar(
                        isGradient: true,
                        avatarSize: 36,
                        image: photos[index].urls?.regular ?? "",
                      ),
                      widgetComment: CustomCircleAvatar(
                        isGradient: false,
                        avatarSize: 30,
                        image: photos[1].urls?.regular ?? "",
                      ),
                    )
                  ],
                );
              },
              itemCount: photos.length,
            ),
          ),
        ],
      ),
    );
  }
}
