part of bb_apps;

class CustomListTile extends StatelessWidget {
  final List appData;
  // ignore: use_key_in_widget_constructors
  const CustomListTile({required this.appData});
  @override
  Widget build(BuildContext context) {
    List specificRegionList = [];
    return FutureBuilder(
        future: getCountryDetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            specificRegionList = filterData(appData, (snapshot.data as String));
            return ListView.builder(
                itemCount: specificRegionList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(12),
                        elevation: 10,
                        child: InkWell(
                          onTap: () {
                            if (Platform.isAndroid) {
                              openPlayStore(specificRegionList[index]
                                  ["platform"][0]["url"] as String);
                            } else if (Platform.isIOS) {
                              openAppStore(specificRegionList[index]["platform"]
                                  [1]["url"] as String);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        specificRegionList[index]["appName"]
                                            as String,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        specificRegionList[index]
                                            ["publisherName"] as String,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      specificRegionList[index]["platform"][0]
                                                  ["url"] ==
                                              ""
                                          ? const SizedBox()
                                          : const Text("Android"),
                                      specificRegionList[index]["platform"][1]
                                                  ["url"] ==
                                              ""
                                          ? const SizedBox()
                                          : const Text("iOS"),
                                      specificRegionList[index]["platform"][2]
                                                  ["url"] ==
                                              ""
                                          ? const SizedBox()
                                          : const Text("Web")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ));
                });
          } else {
            return const Center(
              child: Text("No app added yet"),
            );
          }
        });
  }

  Future<String> getCountryDetails() async {
    return await getCountry();
  }
}
