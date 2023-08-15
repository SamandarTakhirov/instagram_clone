import 'dart:convert';

import '../../../common/constants/api_constants.dart';
import '../../../common/service/api_service.dart';
import '../models/photo_model.dart';

abstract class Repository {
  Repository();

  Future<List<PhotoModel>> getPhotos();
}

class RepositoryIMP implements Repository {
  final APIService apiService;

  RepositoryIMP(this.apiService);

  @override
  Future<List<PhotoModel>> getPhotos() async {
    String response = await apiService.request(
      ApiConst.photosPath,
      headers: {"Authorization": "Client-ID ${ApiConst.apiKey}"},
    );

    List<PhotoModel> photos =
        List<Map<String, Object?>>.from(jsonDecode(response))
            .map(PhotoModel.fromJson)
            .toList();
    return photos;
  }
}
