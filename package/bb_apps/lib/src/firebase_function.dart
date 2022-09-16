part of bb_apps;

class FirebaseFunctions {
  List appDataInMap = [];
  Future<List?> fetchData() async {
    FirebaseDatabase database;
    database = FirebaseDatabase();
    final databaseReference = database.reference();

    var ref = await databaseReference.child("bb_apps").once();

    // DatabaseReference ref = FirebaseDatabase.instance.ref("bb_apps").ref;
    // DatabaseEvent event = await ref.once();

    Map bbAppJson = ref.value as Map<dynamic, dynamic>;
    appDataInMap = bbAppJson.values.toList();

    return appDataInMap;
  }
}
