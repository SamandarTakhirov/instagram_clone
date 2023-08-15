import 'users_sponsor.dart';

class PhotoModel {
  String? id;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  List? breadcrumbs;
  Urls? urls;
  PhotoLinks? links;
  int? likes;
  bool? likedByUser;
  List? currentUserCollections;
  Sponsorship? sponsorship;
  UsersSponsor? user;

  PhotoModel({
    this.id,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.breadcrumbs,
    this.urls,
    this.links,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.user,
  });

  factory PhotoModel.fromJson(Map<String, Object?> json) => PhotoModel(
    id: json["id"] as String?,
    slug: json["slug"] as String?,
    createdAt: json["created_at"] != null
        ? DateTime.tryParse(json["created_at"] as String)
        : null,
    updatedAt: json["updated_at"] != null
        ? DateTime.tryParse(json["updated_at"] as String)
        : null,
    promotedAt: json["promoted_at"] != null
        ? DateTime.tryParse(json["promoted_at"] as String)
        : null,
    width: json["width"] as int?,
    height: json["height"] as int?,
    color: json["color"] as String?,
    blurHash: json["blurHash"] as String?,
    description: json["description"] as String?,
    altDescription: json["alt_description"] as String?,
    breadcrumbs: List.from(json["breadcrumbs"] as List),
    urls: json["urls"] != null
        ? Urls.fromJson(json["urls"] as Map<String, Object?>)
        : null,
    links: json["links"] != null
        ? PhotoLinks.fromJson(json["links"] as Map<String, Object?>)
        : null,
    likes: json["likes"] as int?,
    likedByUser: json["liked_by_user"] as bool?,
    currentUserCollections:
    List.from(json["current_user_collections"] as List),
    sponsorship: json["sponsorship"] != null
        ? Sponsorship.fromJson(json["sponsorship"] as Map<String, Object?>)
        : null,
    user: json["user"] != null
        ? UsersSponsor.fromJson(json["user"] as Map<String, Object?>)
        : null,
  );

  Map<String, Object?> toJson() => {
    "id": id,
    "slug": slug,
    "created_at": createdAt?.toUtc().toIso8601String(),
    "updated_at": updatedAt?.toUtc().toIso8601String(),
    "promoted_at": promotedAt?.toUtc().toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "blurHash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "breadcrumbs": breadcrumbs,
    "urls": urls?.toJson() ?? {},
    "links": links?.toJson() ?? {},
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": currentUserCollections,
    "sponsorship": sponsorship?.toJson() ?? {},
    "user": user?.toJson() ?? {},
  };

  @override
  String toString() {
    return """PhotoModel(
        id: $id,
        slug: $slug,
        createdAt: $createdAt,
        updatedAt: $updatedAt,
        promotedAt: $promotedAt,
        width: $width,
        height: $height,
        color: $color,
        blurHash: $blurHash,
        description: $description,
        altDescription: $altDescription,
        breadcrumbs: $breadcrumbs,
        urls: $urls,
        links: $links,
        likes: $likes,
        likedByUser: $likedByUser,
        currentUserCollections: $currentUserCollections,
        sponsorship: $sponsorship,
        user: $user)""";
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  factory Urls.fromJson(Map<String, Object?> json) => Urls(
    raw: json["raw"] as String?,
    full: json["full"] as String?,
    regular: json["regular"] as String?,
    small: json["small"] as String?,
    thumb: json["thumb"] as String?,
    smallS3: json["small_s3"] as String?,
  );

  Map<String, Object?> toJson() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
    "small_s3": smallS3,
  };

  @override
  String toString() {
    return """
    Urls(
      raw: $raw,
      full: $full,
      regular: $regular,
      small: $small,
      thumb: $thumb,
      smallS3: $smallS3,
    )""";
  }
}

class PhotoLinks {
  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  PhotoLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  factory PhotoLinks.fromJson(Map<String, Object?> json) => PhotoLinks(
    self: json["self"] as String?,
    html: json["html"] as String?,
    download: json["download"] as String?,
    downloadLocation: json["download_location"] as String?,
  );

  Map<String, Object?> toJson() => {
    "self": self,
    "html": html,
    "download": download,
    "download_location": downloadLocation,
  };
}

class Sponsorship {
  List? impressionUrls;
  String? tagline;
  String? taglineUrl;
  UsersSponsor? sponsor;

  Sponsorship({
    this.impressionUrls,
    this.tagline,
    this.taglineUrl,
    this.sponsor,
  });

  factory Sponsorship.fromJson(Map<String, Object?> json) => Sponsorship(
    impressionUrls: json["impression_urls"] as List?,
    tagline: json["tagline"] as String?,
    taglineUrl: json["tagline_url"] as String?,
    sponsor: json["sponsor"] != null
        ? UsersSponsor.fromJson(json["sponsor"] as Map<String, Object?>)
        : null,
  );

  Map<String, Object?> toJson() => {
    "impression_urls": impressionUrls,
    "tagline": tagline,
    "tagline_url": taglineUrl,
    "sponsor": sponsor?.toJson() ?? {},
  };
}

