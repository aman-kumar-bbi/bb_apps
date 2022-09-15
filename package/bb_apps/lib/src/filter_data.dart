 part of bb_apps;
 
List filterData(List wholeDataOfApp, String userCountry) {
  List finalListAccordingCountry = [];
  List finalGermanList = [];
  List finalEuropeanList = [];
  List finalAmericanList = [];
  finalGermanList = filterListAccordingTheCountry("DE", wholeDataOfApp);
  finalEuropeanList = filterListAccordingTheCountry("EU", wholeDataOfApp);
  finalAmericanList = filterListAccordingTheCountry("US", wholeDataOfApp);
  switch (userCountry) {
    case "Germany":
      {
        finalListAccordingCountry =
            finalGermanList + finalEuropeanList + finalAmericanList;
      }
      break;

    case "Switzerland":
      {
        finalListAccordingCountry =
            finalGermanList + finalEuropeanList + finalAmericanList;
      }
      break;

    case "United States":
      {
        finalListAccordingCountry =
            finalAmericanList + finalEuropeanList;
      }
      break;

    case "Canada":
      {
        finalListAccordingCountry =
            finalAmericanList + finalEuropeanList;
      }
      break;

    case "Europe":
      {
        finalListAccordingCountry =
            finalEuropeanList + finalGermanList + finalAmericanList;
      }
      break;

    case "France":
      {
        finalListAccordingCountry =
            finalEuropeanList  + finalAmericanList;
      }
      break;

    default:
      {
        finalListAccordingCountry =
            finalEuropeanList + finalAmericanList + finalGermanList;
      }
      break;
  }

  return finalListAccordingCountry;
}

List filterListAccordingTheCountry(String region, List wholeDataOfApp) {
  List filtedData = [];
  filtedData = wholeDataOfApp
      .where(
        (element) => element["region"] == region,
      )
      .toList();
  return filtedData;
}
