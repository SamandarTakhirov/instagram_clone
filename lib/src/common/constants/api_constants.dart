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

  static Map<String, List<String>> searchQuery(String searchText) => {
    "q": [searchText],
  };

  static Map<String, List<String>> paginationParams(int limit, int perPage) => {
    "page": [limit.toString()],
    "per_page": [perPage.toString()],
  };

}
