import 'package:bb_apps/bb_app/data/model.dart';
import 'package:firebase_database/firebase_database.dart';


class FirebaseFunctions {
  List appDataInMap = [];
  Future<List?> fetchData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("bb_apps").ref;

    DatabaseEvent event = await ref.once();

    Map bbAppJson = event.snapshot.value as Map<dynamic, dynamic>;
    appDataInMap = bbAppJson.values.toList();
    
    List<AppDetails> listOfAppDetails;

    return appDataInMap;
  }
}
