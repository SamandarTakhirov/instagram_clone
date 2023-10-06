import 'dart:convert';

import '../../../common/constants/api_constants.dart';
import '../../../common/service/api_service.dart';
import '../models/photo_model.dart';
import '../models/search_result_model.dart';
import '../videos_model/video_model.dart';

abstract interface class IPhotoRepository {
  Future<List<PhotoModel>> paginationPhotos(int page);

  Future<List<PhotoModel>> getAllUser();

  Future<BaseVideoModel> getAllVideos();

  Future<List<PhotoModel>> searchPhotos(int page, String searchText);
}

class PhotoRepositoryImpl implements IPhotoRepository {
  final APIService apiService;

  const PhotoRepositoryImpl(this.apiService);

  @override
  Future<List<PhotoModel>> searchPhotos(int page, String searchText) async {
    String response = await apiService.request(
      ApiConst.searchPhotosPath,
      headers: {
        "Authorization": "Client-ID ${ApiConst.apiKey}",
      },
      queryParametersAll: ApiConst.searchWithPaginationQuery(
        limit: 20,
        page: page,
        searchText: searchText,
      ),
    );

    List<PhotoModel> photos =
        SearchResultModel.fromJson(jsonDecode(response)).results;

    return photos;
  }

  @override
  Future<List<PhotoModel>> getAllUser() async {
    String response = await apiService.request(ApiConst.photosPath, headers: {
      "Authorization": "Client-ID ${ApiConst.apiKey}",
    });
    List<PhotoModel> photos =
        List<Map<String, Object?>>.from(jsonDecode(response))
            .map(PhotoModel.fromJson)
            .toList();
    return photos;
  }

  @override
  Future<BaseVideoModel> getAllVideos() async {
    String response = await apiService.request(ApiConst.videosPath, headers: {
      "Authorization":
          ApiConst.apiKeyVideos,
    });
    BaseVideoModel videos = BaseVideoModel.fromJson(jsonDecode(response));


    print(response);
    return videos;
  }

  @override
  Future<List<PhotoModel>> paginationPhotos(int page) async {
    String response = await apiService.request(
      ApiConst.photosPath,
      headers: {
        "Authorization": "Client-ID ${ApiConst.apiKey}",
      },
      queryParametersAll: ApiConst.paginationQuery(20, page),
    );

    List<PhotoModel> photos = List<Map<String, Object?>>.from(
      jsonDecode(response),
    ).map(PhotoModel.fromJson).toList();

    return photos;
  }
}
