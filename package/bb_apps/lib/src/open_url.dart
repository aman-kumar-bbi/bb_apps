 part of bb_apps;


void openPlayStore(String urla) async {
  bool isInstalled = await DeviceApps.isAppInstalled(urla);
  

  if (isInstalled == true) {
    await AppLauncher.openApp(
      androidApplicationId: urla,
    );
  } else {
    final url =
        Uri.parse("https://play.google.com/store/apps/details?id=$urla");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      toastMsg();
    }
  }
}

void openAppStore(String id) async {
  final url = Uri.parse(
      "https://apps.apple.com/in/story/id$id?itscg=10000&itsct=");
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    toastMsg();
  }
}

toastMsg() {
  Fluttertoast.showToast(
    msg: "Bad formate app id added",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM 
    );
}
