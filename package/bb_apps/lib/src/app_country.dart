part of bb_apps;

Future<String> getCountry() async {
  final response = await http.get(Uri.parse('http://ip-api.com/json'));
  Map data = jsonDecode(response.body) as Map<dynamic, dynamic>;

  String country = data["country"] as String;

  return country;
}
