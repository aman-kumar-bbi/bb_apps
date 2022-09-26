part of bb_apps;

void openPlayStore(String urla, BuildContext context) async {
  bool isInstalled = await DeviceApps.isAppInstalled(urla);

  if (isInstalled == true) {
    await AppLauncher.openApp(
      androidApplicationId: urla,
    );
  } else {
    // final url =
    //     Uri.parse("https://play.google.com/store/apps/details?id=$urla");
    // if (await canLaunchUrl(url)) {
    //   await launchUrl(url);
    // } else {
    //   snackBar(context);
    // }
    final url = "https://play.google.com/store/apps/details?id=$urla";
    if (await url_luncher.canLaunch(url)) {
      await url_luncher.launch(
        url,

        // mode: url_luncher.LaunchMode.externalApplication
        // forceSafariVC: false,
        // forceWebView: false,
        // headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      snackBar(context);
    }
  }
}

void openAppStore(String id, BuildContext context) async {
  // final url =
  //     Uri.parse("https://apps.apple.com/in/story/id$id?itscg=10000&itsct=");
  final url = "https://apps.apple.com/in/story/id$id?itscg=10000&itsct=";
  if (await url_luncher.canLaunchUrl(Uri.parse(url))) {
    await url_luncher.launchUrl(Uri.parse(url),
        mode: url_luncher.LaunchMode.externalApplication);
  } else {
    snackBar(context);
  }
}

snackBar(BuildContext context) {
  const snackBar = SnackBar(
    content: Text('Bad formatted app id added'),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
