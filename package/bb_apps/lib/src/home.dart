part of bb_apps;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFunctions().fetchData();

    return Scaffold(
        appBar: AppBar(
          title: const Text("BB Apps"),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: FirebaseFunctions().fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List? accualData = snapshot.data as List?;
                return CustomListTile(
                  appData: accualData ?? [],
                );
              } else {
                return const Center(
                  child: Text("No app added yet"),
                );
              }
            }));
  }
}
