import 'package:flutter/material.dart';
import 'package:instagram_clone/src/common/constants/app_color.dart';

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
  BaseVideoModel? baseVideoModel;

  @override
  void initState() {
    repository = PhotoRepositoryImpl(APIService());
    print(repository);
    getBaseModel();
    super.initState();
  }

  void getBaseModel() async {
    baseVideoModel = await repository.getAllVideos();
    print('dsadasdasdasdsadsadasdasd');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SizedBox(
        width: double.infinity,
        height: 300,
        child: Text("${baseVideoModel?.page ?? "HGUFBRUnirnfirni"}",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
