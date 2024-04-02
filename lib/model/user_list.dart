import 'dart:convert';

UserList userListFromJson(String str) => UserList.fromJson(json.decode(str));
String userListToJson(UserList data) => json.encode(data.toJson());

class UserList {
  UserList({
    this.avatarUrl,
    this.userName,
    this.sex,
    this.age,
    this.comment,
    this.videoUrl,
    this.onlineTime,
    this.latitude,
    this.longitude,
    this.likeNumber,
    this.commentNumber,
  });

  UserList.fromJson(dynamic json) {
    avatarUrl = json['avatarUrl'];
    userName = json['userName'];
    sex = json['sex'];
    age = json['age'];
    comment = json['comment'];
    videoUrl = json['videoUrl'];
    onlineTime = json['onlineTime'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    likeNumber = json['likeNumber'];
    commentNumber = json['commentNumber'];
  }
  String? avatarUrl;
  String? userName;
  String? sex;
  num? age;
  String? comment;
  String? videoUrl;
  String? onlineTime;
  num? latitude;
  num? longitude;
  num? likeNumber;
  num? commentNumber;
  UserList copyWith({
    String? avatarUrl,
    String? userName,
    String? sex,
    num? age,
    String? comment,
    String? videoUrl,
    String? onlineTime,
    num? latitude,
    num? longitude,
    num? likeNumber,
    num? commentNumber,
  }) =>
      UserList(
        avatarUrl: avatarUrl ?? this.avatarUrl,
        userName: userName ?? this.userName,
        sex: sex ?? this.sex,
        age: age ?? this.age,
        comment: comment ?? this.comment,
        videoUrl: videoUrl ?? this.videoUrl,
        onlineTime: onlineTime ?? this.onlineTime,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        likeNumber: likeNumber ?? this.likeNumber,
        commentNumber: commentNumber ?? this.commentNumber,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['avatarUrl'] = avatarUrl;
    map['userName'] = userName;
    map['sex'] = sex;
    map['age'] = age;
    map['comment'] = comment;
    map['videoUrl'] = videoUrl;
    map['onlineTime'] = onlineTime;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['likeNumber'] = likeNumber;
    map['commentNumber'] = commentNumber;
    return map;
  }
}
