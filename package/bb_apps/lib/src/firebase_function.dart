 part of bb_apps;



class FirebaseFunctions {
  List appDataInMap = [];
  Future<List?> fetchData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("bb_apps").ref;

    DatabaseEvent event = await ref.once();

    Map bbAppJson = event.snapshot.value as Map<dynamic, dynamic>;
    appDataInMap = bbAppJson.values.toList();
    
    

    return appDataInMap;
  }
}
