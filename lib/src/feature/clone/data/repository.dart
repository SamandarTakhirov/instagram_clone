import 'dart:convert';

import 'package:instagram_clone/src/common/constants/api_constants.dart';

import '../../../common/service/api_service.dart';
import '../models/photo_model.dart';


abstract interface class IPhotoRepository {
  const IPhotoRepository();

  Future<List<PhotoModel>> getAllUser();
}

class PhotoRepositoryImpl implements IPhotoRepository {
  final APIService apiService;

  const PhotoRepositoryImpl(this.apiService);

  @override
  Future<List<PhotoModel>> getAllUser() async {
    String response =
    await apiService.request(ApiConst.photosPath, headers: {
      "Authorization": "Client-ID jfjMrzw_f-9b4MpkSDqC6dstoY6-Qs2-61Sew6E2CwI",
    });
    List<PhotoModel> photos =
    List<Map<String, Object?>>.from(jsonDecode(response))
        .map(PhotoModel.fromJson)
        .toList();
    return photos;
  }
}