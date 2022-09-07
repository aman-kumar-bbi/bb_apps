import 'dart:io';

import 'package:bb_apps/bb_app/core/app_language.dart';
import 'package:bb_apps/bb_app/domain/use_case.dart/filter_data.dart';
import 'package:bb_apps/bb_app/presentation/widgets/open_url.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final List appData;
  const CustomListTile({super.key, required this.appData});

  @override
  Widget build(BuildContext context) {
    List specificRegionList = [];
    specificRegionList = filterData(appData, AppLanguage().German);
    return ListView.builder(
        itemCount: appData.length,
        itemBuilder: (context, index) {
          print("url ${appData[index]["platform"][0]["url"]}");
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(12),
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    if (Platform.isAndroid) {
                      openPlayStore(
                        appData[index]["platform"][0]["url"]);
                    } else if (Platform.isIOS) {
                      openPlayStore(
                        appData[index]["platform"][1]["url"]);
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
                                appData[index]["appName"],
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                appData[index]["publisherName"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              appData[index]["platform"][0]["url"] ==
                                      ""
                                  ? const SizedBox()
                                  : const Text("Android"),
                              appData[index]["platform"][1]["url"] ==
                                      ""
                                  ? const SizedBox()
                                  : const Text("iOS"),
                              appData[index]["platform"][2]["url"] ==
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
  }
}
