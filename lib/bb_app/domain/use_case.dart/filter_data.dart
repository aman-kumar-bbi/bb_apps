List filterData(List wholeDataOfApp, String region) {
  List filtedData = [];
  filtedData = wholeDataOfApp
      .where(
        (element) => element["region"] == region,
      )
      .toList();
  return filtedData;
}

List filterListAccordingTheCountry(String userCountry,List wholeDataOfApp) {
  List filtedData = [];
  filtedData = wholeDataOfApp
      .where(
        (element) => element["region"] == userCountry,
      )
      .toList();
    return filtedData;
}
