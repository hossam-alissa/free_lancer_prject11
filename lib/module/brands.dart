import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


Map<String, List<Map<String, Object>>> brands= {
  "brands": [
    {
      "id": 4,
      "name": "a",
      "name_ar": "v",
      "image": "https:\/\/packages.3codeit.com\/storage\/app\/public\/attachment\/675597.png",
      "created_at": "2021-10-24T20:59:49.000000Z",
      "updated_at": "2021-10-24T20:59:49.000000Z"
    }
  ]
};

class Brand{
  int? id;
  String? name;
  String? name_ar;
  String? image;
  String? created_at;
  String? updated_at;
}

class Brands with ChangeNotifier{
  List<Brand> brandList = [];

  getBrands()async{
    try{
      var request = http.Request('GET', Uri.parse('https://packages.3codeit.com/api/brands'));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var extractedData = await jsonDecode(await response.stream.bytesToString());
        print(extractedData["brands"]);
        var extractedData2 = await jsonDecode(extractedData["brands"]);
        print(extractedData2[0].toString());



      }
      else {
        print(response.reasonPhrase);
      }
    }catch(_error){
      rethrow;
    }
  }
}