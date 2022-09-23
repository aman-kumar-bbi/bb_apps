part of bb_apps;

class BBAppHome extends StatelessWidget {
  List? bbAppListFromFirebase;
  Color navBarColor;
  FontStyle? appFont;
  String titleName;
  TextStyle navBarStyle;
  BBAppHome(
      {Key? key,
      required this.bbAppListFromFirebase,
      required this.navBarColor,
      required this.navBarStyle,
      required this.appFont,
      required this.titleName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: navBarColor,
          title: Text(
            titleName,
            style: navBarStyle,
          ),
        ),
        body: FutureBuilder(
            future: FirebaseFunctions().fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List? accualData = snapshot.data as List?;
                return CustomListTile(
                  appData: bbAppListFromFirebase ?? [],
                  appFont: appFont,
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text("No app added yet"),
                );
              }
            }));
  }
}

class BBAppsArgs {
  final List<dynamic> bbAppsList;
  BBAppsArgs({required this.bbAppsList});
}
