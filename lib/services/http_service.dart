import 'package:http/http.dart' as http;

import '../models/product_models.dart';

class HttpService {
  // static var client = http.Client();

  static Future<List<ProductModel>> fetchProducts() async {

    var response = await http.get(Uri.parse("http://testapp.touchworldtechnology.com:3009/v1/product/getAllProduct"));

    if (response.statusCode == 200) {
      var data = response.body ;
      return productModelFromJson(data);
    } else {
      // throw Exception();
      var data = response.body;
      return productModelFromJson(data);
    }
  }
}
