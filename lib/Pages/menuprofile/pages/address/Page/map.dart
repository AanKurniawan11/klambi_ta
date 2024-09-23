// import 'package:url_launcher/url_launcher.dart';
//
// class MapApi {
//   MapApi._();
//
//   static Future<void> openMap({required double lat, required double long}) async {
//     String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
//     Uri uri = Uri.parse(googleUrl);
//     print("Attempting to open: $googleUrl");
//
//     try {
//       if (await canLaunch(googleUrl)) {
//         await launch(googleUrl, forceSafariVC: false, forceWebView: false);
//       } else {
//         print("Failed to open map: $googleUrl");
//         throw 'Could not open the map.';
//       }
//     } catch (e) {
//       print("Exception: $e");
//       print(googleUrl);
//     }
//   }
// }
