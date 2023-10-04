import 'dart:convert';

import 'package:ladiescode/models/ProductsList.dart';
import 'package:ladiescode/models/ProdutosModel.dart';
import 'package:http/http.dart' as http;

class ApiMethods {
  String url = 'http://localhost:3000/products';

  // Método GET
  Future<List<ProductModel>> getAllProducts() async {
    // tratamento das exceções
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Retorna a lista de produtos
        var json = jsonDecode(utf8.decode(response.bodyBytes));

        List<ProductModel> list = [];
        for (var n in json) {
          list.add(ProductModel.fromJson(n));
        }
        return list;
      } else {
        print('getAllProducts: StatusCode ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('getAllProducts: StatusCode ${e.toString()}');
      return [];
    }
  }

  // Método POST
  Future<bool> postProduct(ProductModel product) async {
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {'Content-type': 'application/json; charset=UTF-8'},
          body: utf8.encode(jsonEncode(product.toJson())));

      if (response.statusCode == 201) {
        print('postProduct: StatusCode ${response.statusCode}');
        print('body ${response.body}');
        return true;
      } else {
        print('postProduct: StatusCode ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('postProduct: StatusCode ${e.toString()}');
      return false;
    }
  }

  // Método PUT
  Future<bool> putProduct(ProductModel product) async {
    try {
      http.Response response = await http.put(Uri.parse('$url/${product.id}'),
          headers: {'Content-type': 'application/json; charset=UTF-8'},
          body: utf8.encode(jsonEncode(product.toJson())));

      if (response.statusCode == 200) {
        print('putProduct: StatusCode ${response.statusCode}');
        print('body ${response.body}');
        return true;
      } else {
        print('putProduct: StatusCode ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('putProduct: StatusCode ${e.toString()}');
      return false;
    }
  }

  // Método DELETE
  Future<bool> deleteProduct(int id) async {
    try {
      http.Response response = await http.delete(Uri.parse('$url/$id'));

      if (response.statusCode == 200) {
        print('deleteProduct: StatusCode ${response.statusCode}');
        print('body ${response.body}');
        return true;
      } else {
        print('deleteProduct: StatusCode ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('deleteProduct: StatusCode ${e.toString()}');
      return false;
    }
  }
}
