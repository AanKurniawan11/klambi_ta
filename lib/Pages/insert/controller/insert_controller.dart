import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:klambi_ta/Pages/insert/components/citymodel.dart';
import 'package:klambi_ta/Pages/insert/components/provincemodel.dart';

class InsertAddressController extends GetxController {
  var isLoading = true.obs;
  var provinceList = <Province>[].obs;
  var cityList = <City>[].obs;
  var selectedCity = ''.obs;
  var shippingCosts = [].obs;

  final String apiKey = '528ac323ce29b071b2255b2821fbc1ec'; // API Key

  @override
  void onInit() {
    fetchProvinces();
    super.onInit();
  }

  // Fetch provinces
  Future<void> fetchProvinces() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://api.rajaongkir.com/starter/province?key=$apiKey'),
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var provinces = jsonData['rajaongkir']['results'] as List;
        provinceList.value =
            provinces.map((province) => Province.fromJson(province)).toList();
      } else {
        Get.snackbar("Error", "Failed to load provinces");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load provinces");
    } finally {
      isLoading(false);
    }
  }

  // Fetch cities based on provinceId
  Future<void> fetchCities(String provinceId) async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://api.rajaongkir.com/starter/city?key=$apiKey&province=$provinceId'),
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var cities = jsonData['rajaongkir']['results'] as List;
        cityList.value = cities.map((city) => City.fromJson(city)).toList();
      } else {
        Get.snackbar("Error", "Failed to load cities");
        cityList.clear();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load cities");
      cityList.clear();
    } finally {
      isLoading(false);
    }
  }

  // Function to calculate shipping cost
  Future<void> calculateShippingCost(String origin, String destination, int weight, String courier) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('https://api.rajaongkir.com/starter/cost'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'origin': origin,
          'destination': destination,
          'weight': weight.toString(),
          'courier': courier,
          'key': apiKey
        },
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        shippingCosts.value = jsonData['rajaongkir']['results'][0]['costs'];
      } else {
        Get.snackbar("Error", "Failed to calculate shipping costs");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to calculate shipping costs");
    } finally {
      isLoading(false);
    }
  }
}
