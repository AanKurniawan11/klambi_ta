// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../model/respone_model_getUser.dart';
// import 'package:get_storage/get_storage.dart';
//
// class ProfileService {
//   Future<GetUser> getAllProfile() async {
//     try {
//       final response = await http.get(
//         Uri.parse("https://klambi.ta.rplrus.com/api/showProfile"),
//         headers: {
//           'Content-Type': 'application/json',
//           "Authorization": "Bearer ${await GetStorage().read("userToken")}"
//         },
//       );
//
//       print(response.body);
//       if (response.statusCode == 200) {
//         return GetUser.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Failed to fetch menuprofile data');
//       }
//     } catch (e) {
//       throw Exception('Error fetching menuprofile data: $e');
//     }
//   }
// }