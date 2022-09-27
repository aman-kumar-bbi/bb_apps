part of bb_apps;

// ignore: must_be_immutable
class BBAppHome extends StatefulWidget {
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
  State<BBAppHome> createState() => _BBAppHomeState();
}

class _BBAppHomeState extends State<BBAppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: widget.navBarColor,
          title: Text(
            "BB Apps",
            style: widget.navBarStyle,
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: FirebaseFunctions().fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List? accualData = snapshot.data as List?;
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() {});
                  },
                  child: CustomListTile(
                    appData: accualData ?? [],
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("No app added yet"),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}

class BBAppsArgs {
  final List<dynamic> bbAppsList;
  BBAppsArgs({required this.bbAppsList});
}
