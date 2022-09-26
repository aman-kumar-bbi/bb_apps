part of bb_apps;

class BBAppHome extends StatelessWidget {
  List? bbAppListFromFirebase;
  final TextStyle navBarStyle;
  final Color navBarColor;
  BBAppHome(
      {Key? key,
      required this.bbAppListFromFirebase,
      required this.navBarStyle,
      required this.navBarColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: navBarColor,
          title: Text(
            "BB Apps",
            style: navBarStyle,
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: FirebaseFunctions().fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List? accualData = snapshot.data as List?;
                print("accualData$accualData");
                return CustomListTile(
                  appData: bbAppListFromFirebase ?? [],
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
