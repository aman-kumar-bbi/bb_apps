part of bb_apps;

class Home extends StatelessWidget {
  List? bbAppListFromFirebase;
  Home({required this.bbAppListFromFirebase});

  @override
  Widget build(BuildContext context) {
    // print("aman List ${FirebaseFunctions().fetchData()}");
    return Scaffold(
        appBar: AppBar(
          title: const Text("BB Apps"),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: FirebaseFunctions().fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List? accualData = snapshot.data as List?;
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
