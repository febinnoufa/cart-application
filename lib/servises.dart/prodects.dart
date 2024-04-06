import 'dart:convert';
import 'package:counterappp/model/prodects.dart';
import 'package:http/http.dart'as http;

import 'package:counterappp/const/constends.dart';

Future<List<Map<String, dynamic>>> getprodects() async {
  var url = Uri.parse(KProdecturl);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data is List) {
     
      return data.cast<Map<String, dynamic>>();
    } else if (data is Map && data.containsKey('products')) {
      return (data['products'] as List).cast<Map<String, dynamic>>();
    } else {
    
      throw Exception('Unexpected data structure');
    }
  } else {
 
    throw Exception('Failed to load products');
  }
}
// Future<List<Prodects>> getProducts() async {
//   final response = await http.get(Uri.parse(KProdecturl));

//   if (response.statusCode == 200) {
//     final List<dynamic> data = jsonDecode(response.body);
//     return data.map((json) => Prodects.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load products');
//   }
// }
