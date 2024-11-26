import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchURL(String url) async {
  await canLaunchUrlString(url).then((value) {
    launchUrlString(
      url,
    ).then((value) {}).catchError((error) {
      throw 'Could not launch $url';
    });
  }).catchError((error) {
    throw 'Could not launch $url';
  });
}
