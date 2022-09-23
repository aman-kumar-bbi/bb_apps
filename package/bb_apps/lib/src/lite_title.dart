part of bb_apps;

class CustomListTile extends StatelessWidget {
  final List appData;
  final FontStyle? appFont;
  // ignore: use_key_in_widget_constructors
  const CustomListTile({required this.appData, required this.appFont});
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
                              openPlayStore(
                                  specificRegionList[index]["platform"][0]
                                      ["url"] as String,
                                  context);
                            } else if (Platform.isIOS) {
                              openAppStore(
                                  specificRegionList[index]["platform"][1]
                                      ["url"] as String,
                                  context);
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
                                        style: TextStyle(
                                            fontStyle: appFont,
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
                                        style: TextStyle(
                                            fontStyle: appFont,
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
                                          : Text(
                                              "Android",
                                              style: TextStyle(
                                                fontStyle: appFont,
                                              ),
                                            ),
                                      specificRegionList[index]["platform"][1]
                                                  ["url"] ==
                                              ""
                                          ? const SizedBox()
                                          : Text(
                                              "iOS",
                                              style: TextStyle(
                                                fontStyle: appFont,
                                              ),
                                            ),
                                      specificRegionList[index]["platform"][2]
                                                  ["url"] ==
                                              ""
                                          ? const SizedBox()
                                          : Text(
                                              "Web",
                                              style: TextStyle(
                                                fontStyle: appFont,
                                              ),
                                            )
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
            return Center(
              child: Text(
                "No app added yet",
                style: TextStyle(
                  fontStyle: appFont,
                ),
              ),
            );
          }
        });
  }

  Future<String> getCountryDetails() async {
    return await getCountry();
  }
}
