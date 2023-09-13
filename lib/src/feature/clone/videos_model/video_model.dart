class VideoModel {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? baseFilename;
  String? poster;
  String? thumbnail;
  String? description;
  String? state;
  bool? isVertical;
  List<Object?>? tags;
  int? downloads;
  int? views;
  int? likes;
  int? contributorId;
  DateTime? publishedAt;
  String? playbackId;
  String? aspectRatio;
  String? duration;
  int? maxHeight;
  int? maxWidth;
  String? videoId;
  num? d2vRatio;
  String? id;
  int? publishedAtTimestamp;
  int? downloadsLastMonth;
  String? blurHash;
  bool? isPremium;
  String? objectID;

  VideoModel({
    this.createdAt,
    this.updatedAt,
    this.title,
    this.baseFilename,
    this.poster,
    this.thumbnail,
    this.description,
    this.state,
    this.isVertical,
    this.tags,
    this.downloads,
    this.views,
    this.likes,
    this.contributorId,
    this.publishedAt,
    this.playbackId,
    this.aspectRatio,
    this.duration,
    this.maxHeight,
    this.maxWidth,
    this.videoId,
    this.d2vRatio,
    this.id,
    this.publishedAtTimestamp,
    this.downloadsLastMonth,
    this.blurHash,
    this.isPremium,
    this.objectID,
  });

  factory VideoModel.fromJson(Map<String, Object?> json) => VideoModel(
        createdAt: json["created_at"] != null ? DateTime.tryParse(json["created_at"] as String): null,
        updatedAt: json["updated_at"]  != null ? DateTime.tryParse(json["updated_at"] as String): null,
        title: json["title"] as String?,
        baseFilename: json["base_filename"] as String?,
        poster: json["poster"] as String?,
        thumbnail: json["thumbnail"] as String?,
        description: json["description"] as String?,
        state: json["state"] as String?,
        isVertical: json["is_vertical"] as bool?,
        tags: json["tags"] as List<Object?>?,
        downloads: json["downloads"] as int?,
        views: json["views"] as int?,
        likes: json["likes"] as int?,
        contributorId: json["contributor_id"] as int?,
        publishedAt:  json["published_at"] != null ? DateTime.tryParse(json["published_at"] as String): null,
        playbackId: json["playback_id"] as String?,
        aspectRatio: json["aspect_ratio"] as String?,
        duration: json["duration"] as String?,
        maxHeight: json["max_height"] as int?,
        maxWidth: json["max_width"] as int?,
        videoId: json["video_id"] as String?,
        d2vRatio: json["d2v_ratio"] as num?,
        id: json["id"] as String?,
        publishedAtTimestamp: json["published_at_timestamp"] as int?,
        downloadsLastMonth: json["downloads_last_month"] as int?,
        blurHash: json["blur_hash"] as String?,
        isPremium: json["is_premium"] as bool?,
        objectID: json["objectID"] as String?,
      );

  Map<String, Object?> toJson() => {
        "created_at": createdAt,
        "updated_at": updatedAt,
        "title": title,
        "base_filename": baseFilename,
        "poster": poster,
        "thumbnail": thumbnail,
        "description": description,
        "state": state,
        "is_vertical": isVertical,
        "tags": tags,
        "downloads": downloads,
        "views": views,
        "likes": likes,
        "contributor_id": contributorId,
        "published_at": publishedAt,
        "playback_id": playbackId,
        "aspect_ratio": aspectRatio,
        "duration": duration,
        "max_height": maxHeight,
        "max_width": maxWidth,
        "video_id": videoId,
        "d2v_ratio": d2vRatio,
        "id": id,
        "published_at_timestamp": publishedAtTimestamp,
        "blur_hash": downloadsLastMonth,
        "is_premium": blurHash,
        "objectID": isPremium,
      };
}

class BaseVideoModel {
  int? page;
  int? pages;
  int? pageSize;
  String? params;
  int? total;
  List<VideoModel>? hits;
  int? hitsPerPage;
  int? nbHits;
  int? nbPages;
  String? queryId;

  BaseVideoModel({
    this.page,
    this.pages,
    this.pageSize,
    this.params,
    this.total,
    this.hits,
    this.hitsPerPage,
    this.nbHits,
    this.nbPages,
    this.queryId,
  });

  factory BaseVideoModel.fromJson(Map<String, Object?> json) => BaseVideoModel(
      page : json["page"] as int?,
      pages : json["pages"] as int?,
      pageSize : json["page_size"] as int?,
      params : json["params"] as String?,
      total : json["total"] as int?,
      hits : json["hits"] != null ? List.from(json["hits"] as List<dynamic>).map((e) => VideoModel.fromJson(e)).toList(): null,
      hitsPerPage : json["hitsPerPage"] as int?,
      nbHits : json["nbHits"] as int?,
      nbPages : json["nbPages"] as int?,
      queryId : json["query_id"] as String?,
  );
}
