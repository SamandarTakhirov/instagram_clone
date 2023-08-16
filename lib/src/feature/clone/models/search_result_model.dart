import 'photo_model.dart';

class SearchResultModel {
  int total;
  int totalPages;
  List<PhotoModel> results;

  SearchResultModel({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory SearchResultModel.fromJson(Map<String, Object?> json) => SearchResultModel(
        total: json["total"] as int,
        totalPages: json["total_pages"] as int,
        results: json["results"] != null
            ? List<Map<String, Object?>>.from(
                json["results"] as List,
              ).map(PhotoModel.fromJson).toList()
            : <PhotoModel>[],
      );
}
