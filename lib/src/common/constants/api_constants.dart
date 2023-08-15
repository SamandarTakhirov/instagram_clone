abstract class ApiConst {
  static const _baseUrl = String.fromEnvironment(
    "base_url",
    defaultValue: "...",
  );

  static const apiKey = String.fromEnvironment(
    "api_key",
    defaultValue: "...",
  );


  static const photosPath = "$_baseUrl/photos";
  static const searchUsersPath = "$_baseUrl/search/photos";

  static Map<String, List<String>> searchQuery(String searchText) => {
    "q": [searchText],
  };

  static Map<String, List<String>> paginationParams(int limit, int skip) => {
    "limit": [limit.toString()],
    "skip": [skip.toString()],
  };

}
