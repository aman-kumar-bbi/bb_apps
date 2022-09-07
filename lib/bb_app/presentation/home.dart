import 'package:bb_apps/bb_app/presentation/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import '../core/app_country/app_country.dart';
import '../data/FirebaseFunctions.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    test() async {
      return await getCountry();
    }

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
                List? accualData = snapshot.data;
                return CustomListTile(
                  appData: accualData ?? [],
                );
              } else {
                return Center(
                  child: Text("No app added yet"),
                );
              }
            }));
  }
}
