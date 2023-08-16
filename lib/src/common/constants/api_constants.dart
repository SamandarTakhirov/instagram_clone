abstract class ApiConst {
  static const baseUrl = String.fromEnvironment(
    "base_url",
    defaultValue: "...",
  );

  static const apiKey = String.fromEnvironment(
    "api_key",
    defaultValue: "...",
  );


  static const photosPath = "$baseUrl/photos";

  static const searchPhotosPath = "$baseUrl/search/photos";

  static Map<String, List<String>> paginationQuery(int limit, int page) => {
    "per_page": ["$limit"],
    "page": ["$page"],
  };

  static Map<String, List<String>> searchWithPaginationQuery({
    required int limit,
    required int page,
    required String searchText,
  }) =>
      {
        "per_page": ["$limit"],
        "page": ["$page"],
        "query": [searchText],
      };

}
