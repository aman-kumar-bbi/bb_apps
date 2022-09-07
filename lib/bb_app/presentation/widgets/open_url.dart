import 'package:url_launcher/url_launcher.dart';

void openPlayStore(String urla) async {
    final url=Uri.parse(urla);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }else{
      print("error in launching");
    }
}
