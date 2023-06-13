import 'dart:convert';

import 'package:bloc_project/models/product_model.dart';
import 'package:http/http.dart';

class ProductRepo{
  Client get client{
    return Client();
  }

  Map<String, dynamic> getMap(Response response){
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  bool isSuccess(Response response){
    return response.statusCode>=200 && response.statusCode<300;
  }

  

  Future<List<Product>> loadProducts()async{
    Uri url = Uri.https('dummyjson.com', '/products');
    Response response = await client.get(url);

    if(!isSuccess(response)){
      return [];
    }

    Map<String, dynamic> map = getMap(response);
    if(!map.containsKey('products')){
      return [];
    }

    return (map['products'] as List<dynamic>)
          .map((e) => Product.fromMap(e)).toList();

  }
}