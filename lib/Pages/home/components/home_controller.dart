import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'allproductresponsemodel.dart' as product_model;
import 'categoryresponsemodel.dart' as category_model;

class HomeController extends GetxController {
  final RefreshController refreshController = RefreshController(initialRefresh: false);
  RxList<product_model.Datum> productResponseAll = <product_model.Datum>[].obs;
  RxList<product_model.Datum> searchResult = <product_model.Datum>[].obs;
  RxList<String> categoryResponseAll = <String>[].obs;
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  var searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadCategory();
    loadDataProduct("All");
  }

  // Method untuk refresh produk berdasarkan kategori yang dipilih
  Future<void> refreshProducts() async {
    String? category = selectedIndex.value == 0 ? null : categoryResponseAll[selectedIndex.value];
    await loadDataProduct(category);
    refreshController.refreshCompleted();
  }

  Future<void> loadCategory() async {
    await _performRequest(
      url: "https://klambi.ta.rplrus.com/api/products/category/all",
      onSuccess: (response) {
        final categoryResponse = category_model.categoryResponseModelFromJson(response.body);
        categoryResponseAll.value = categoryResponse.data;
      },
    );
  }

  Future<void> loadDataProduct([String? category]) async {
    String categoryPath = category != null ? "category/$category" : "all";
    await _performRequest(
      url: "https://klambi.ta.rplrus.com/api/products/$categoryPath",
      onSuccess: (response) {
        final productResponse = product_model.allproductResponseModelFromJson(response.body);
        productResponseAll.value = productResponse.data;
        searchResult.assignAll(productResponseAll);
      },
    );
  }

  Future<void> _performRequest({
    required String url,
    required void Function(http.Response response) onSuccess,
  }) async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        onSuccess(response);
      } else {
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error during request: $e");
    } finally {
      isLoading.value = false;
    }
  }

  searchProducts(String query) {
    searchText.value = query;

    if (query.isEmpty) {
      searchResult.assignAll(productResponseAll);
    } else {
      searchResult.assignAll(productResponseAll.where((product) {
        return product.title.toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }
  String imageUrl(String path) {
    const baseUrl = 'https://klambi.ta.rplrus.com/storage/';
    return '$baseUrl$path';
  }
}
