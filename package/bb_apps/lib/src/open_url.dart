part of bb_apps;

void openPlayStore(String urla, BuildContext context) async {
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
      snackBar(context);
    }
  }
}

void openAppStore(String id, BuildContext context) async {
  final url =
      Uri.parse("https://apps.apple.com/in/story/id$id?itscg=10000&itsct=");
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    snackBar(context);
  }
}

snackBar(BuildContext context) {
  const snackBar = SnackBar(
    content: Text('Bad formatted app id added'),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
