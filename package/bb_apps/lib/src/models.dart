 part of bb_apps;



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
      : appName = json['appName'] as String,
        publisherName = json['publisherName'] as String,
        region = json['region'] as String,

        platform = (json['platform'] as List)
            .map((e) => BBPlatform.fromJson(e as Map<String,dynamic>))
            .toList();

}

class BBPlatform {
  String operatingSystem;
  String url;
  BBPlatform({required this.operatingSystem, required this.url});

  BBPlatform.fromJson(Map<String, dynamic> json)
      : operatingSystem = json["operatingSystem"] as String,
      url=json["url"] as String;
  Map<String, dynamic> toJson() => {"operatingSystem": operatingSystem,"url":url};
}
