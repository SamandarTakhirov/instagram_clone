import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/src/page/main/search/search_widget/staggered_widget.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/service/api_service.dart';
import '../../../common/utils/debouncing_throttling.dart';
import '../../../feature/clone/data/repository.dart';
import '../../../feature/clone/models/photo_model.dart';
import 'search_widget/shimmer_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSearch = false;

  late final IPhotoRepository photoRepository;
  late final TextEditingController controller;
  List<PhotoModel> photos = [];
  bool isLoading = false;
  bool isPaginationLoading = false;
  late ScrollController scrollController;
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
      ..addListener(() {});
    getPhotos();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.removeListener(pagination);
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

  void isFocus() {
    setState(() {
      if (!isSearch) {
        isSearch = true;
      } else {
        isSearch = false;

        getPhotos();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: true
          ? SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: isSearch
                        ? SizedBox(
                            height: 40,
                            child: TextField(
                              autofocus: true,
                              onChanged: searchingPhotos,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.search,
                              cursorColor: AppColor.black,
                              decoration: InputDecoration(
                                icon: GestureDetector(
                                  onTap: isFocus,
                                  child: const Icon(Icons.arrow_back),
                                ),
                                filled: true,
                                contentPadding: const EdgeInsets.all(0),
                                fillColor: AppColor.button,
                                hintText: "Search",
                                prefixIcon: const Icon(Icons.search),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: isFocus,
                            child: const SizedBox(
                              height: 40,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: AppColor.button,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.search),
                                      SizedBox(width: 5),
                                      Text(
                                        "Search",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                  Expanded(
                    child: MasonryGridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      controller: scrollController,
                      itemCount: photos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return index == 2
                            ? StaggeredWidget(
                                mainAxisCellCount: size.width / 3,
                                crossAxisCellCount: size.width / 3 * 2,
                                image: photos[index].urls?.small ?? "",
                              )
                            : index == 11
                                ? StaggeredWidget(
                                    crossAxisCellCount: size.width / 3 * 2,
                                    mainAxisCellCount: size.width / 3 * 2,
                                    image: photos[index].urls?.small ?? "",
                                  )
                                : StaggeredWidget(
                                    crossAxisCellCount: size.width / 3,
                                    mainAxisCellCount: size.width / 3,
                                    image: photos[index].urls?.small ?? "",
                                  );
                      },
                    ),
                  ),
                ],
              ),
            )
          : const ShimmerSearch(),
    );
  }
}
