import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/service/api_service.dart';
import '../../../feature/clone/data/repository.dart';
import '../../../feature/clone/videos_model/video_model.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({Key? key}) : super(key: key);

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  late IPhotoRepository repository;
  late VideoPlayerController videoPlayerController;
  late BaseVideoModel baseVideoModel;

  @override
  void initState() {
    repository = PhotoRepositoryImpl(APIService());
    getBaseModel();
    videoPlayerController = _videoPlayerController.call();

    super.initState();
  }

  VideoPlayerController _videoPlayerController() {
    return VideoPlayerController.networkUrl(Uri.parse(baseVideoModel.hits![1].poster ?? ""))
      ..initialize().then((_) {
        setState(() {});
      })
      ..play();
  }

  void getBaseModel() async {
    baseVideoModel = await repository.getAllVideos();
    setState(() {});
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: VideoPlayer(videoPlayerController),
              )
            : const Text(
                "Error",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
