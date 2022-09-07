import 'dart:core';

class AppDetails {
  String uid;
  String appName;
  String publisherName;
  String region;

  List<BBPlatform> platform;

  AppDetails({
    required this.uid,
    required this.appName,
    required this.publisherName,
    required this.region,

    required this.platform,
  });

    AppDetails.fromJson(this.uid, Map<String, dynamic> json)
      : appName = json['appName'],
        publisherName = json['publisherName'],
        region = json['region'],

        platform = (json['platform'] as List)
            .map((e) => BBPlatform.fromJson(e))
            .toList();

}

class BBPlatform {
  String operatingSystem;
  String url;
  BBPlatform({required this.operatingSystem, required this.url});

  BBPlatform.fromJson(Map<String, dynamic> json)
      : operatingSystem = json["operatingSystem"],
      url=json["url"];
  Map<String, dynamic> toJson() => {"operatingSystem": operatingSystem,"url":url};
}
