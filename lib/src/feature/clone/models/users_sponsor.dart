class UsersSponsor {
  String? id;
  DateTime? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  UserLinks? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  bool? acceptedTos;
  bool? forHire;
  Social? social;

  UsersSponsor({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  factory UsersSponsor.fromJson(Map<String, Object?> json) => UsersSponsor(
    id: json["id"] as String?,
    updatedAt: json["updated_at"] != null
        ? DateTime.tryParse(json["updated_at"] as String)
        : null,
    username: json["username"] as String?,
    name: json["name"] as String?,
    firstName: json["first_name"] as String?,
    lastName: json["last_name"] as String?,
    twitterUsername: json["twitter_username"] as String?,
    portfolioUrl: json["portfolio_url"] as String?,
    bio: json["bio"] as String?,
    location: json["location"] as String?,
    links: json["links"] != null
        ? UserLinks.fromJson(json["links"] as Map<String, Object?>)
        : null,
    profileImage: json["profile_image"] != null
        ? ProfileImage.fromJson(
        json["profile_image"] as Map<String, Object?>)
        : null,
    instagramUsername: json["instagram_username"] as String?,
    totalCollections: json["total_collections"] as int?,
    totalLikes: json["total_likes"] as int?,
    totalPhotos: json["total_photos"] as int?,
    acceptedTos: json["accepted_tos"] as bool?,
    forHire: json["for_hire"] as bool?,
    social: json["social"] != null
        ? Social.fromJson(json["social"] as Map<String, Object?>)
        : null,
  );

  Map<String, Object?> toJson() => {
    "id": id,
    "updatedAt": updatedAt?.toUtc().toIso8601String(),
    "username": username,
    "name": name,
    "firstName": firstName,
    "lastName": lastName,
    "twitterUsername": twitterUsername,
    "portfolioUrl": portfolioUrl,
    "bio": bio,
    "location": location,
    "links": links,
    "profileImage": profileImage,
    "instagramUsername": instagramUsername,
    "totalCollections": totalCollections,
    "totalLikes": totalLikes,
    "totalPhotos": totalPhotos,
    "acceptedTos": acceptedTos,
    "forHire": forHire,
    "social": social,
  };
}


class Social {
  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  String? paypalEmail;

  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  factory Social.fromJson(Map<String, Object?> json) => Social(
    instagramUsername: json["instagram_username"] as String?,
    portfolioUrl: json["portfolio_url"] as String?,
    twitterUsername: json["twitter_username"] as String?,
    paypalEmail: json["paypal_email"] as String?,
  );

  Map<String, Object?> toJson() => {
    "instagram_username": instagramUsername,
    "portfolio_url": portfolioUrl,
    "twitter_username": twitterUsername,
    "paypal_email": paypalEmail,
  };
}

class UserLinks {
  String? self;
  String? html;
  String? photos;
  String? likes;
  String? portfolio;
  String? following;
  String? followers;

  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  factory UserLinks.fromJson(Map<String, Object?> json) => UserLinks(
    self: json["self"] as String?,
    html: json["html"] as String?,
    photos: json["photos"] as String?,
    likes: json["likes"] as String?,
    portfolio: json["portfolio"] as String?,
    following: json["following"] as String?,
    followers: json["followers"] as String?,
  );

  Map<String, Object?> toJson() => {
    "self": self,
    "html": html,
    "photos": photos,
    "likes": likes,
    "portfolio": portfolio,
    "following": following,
    "followers": followers,
  };
}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  factory ProfileImage.fromJson(Map<String, Object?> json) => ProfileImage(
    small: json["small"] as String?,
    medium: json["medium"] as String?,
    large: json["large"] as String?,
  );

  Map<String, Object?> toJson() => {
    "small": small,
    "medium": medium,
    "large": large,
  };
}