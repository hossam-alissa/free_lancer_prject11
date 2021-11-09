import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Map<String, List<Map<String, Object>>> brandsMap = {
  "brands": [
    {
      "id": 4,
      "name": "a",
      "name_ar": "v",
      "image":
          "https:\/\/packages.3codeit.com\/storage\/app\/public\/attachment\/675597.png",
      "created_at": "2021-10-24T20:59:49.000000Z",
      "updated_at": "2021-10-24T20:59:49.000000Z"
    }
  ]
};

class Brand with ChangeNotifier{
  List<Brands>? brands;

  Brand({this.brands});

  fromJson(Map<String, dynamic> json) {
    print(json);
    print(json['brands']);
    if (json['brands'] != null) {
      brands = <Brands>[];
      print("I'am Here 1");
      json['brands'].forEach((v) {
        print(v.toString());
        brands!.add(new Brands.fromJson(v));
      });
    }
    print("I'am Here 2");
    print(brands!.length.toString());
    notifyListeners();
  }

  // Brand.fromJson(Map<String, dynamic> json) {
  //   print(json);
  //   print(json['brands']);
  //   if (json['brands'] != null) {
  //     brands = <Brands>[];
  //     print("I'am Here 1");
  //     json['brands'].forEach((v) {
  //       print(v.toString());
  //       brands!.add(new Brands.fromJson(v));
  //     });
  //   }
  //   print("I'am Here 2");
  //   print(brands!.length.toString());
  //   notifyListeners();
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brands != null) {
      data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brands {
  int? id;
  String? name;
  String? nameAr;
  String? image;
  String? createdAt;
  String? updatedAt;

  Brands(
      {this.id,
      this.name,
      this.nameAr,
      this.image,
      this.createdAt,
      this.updatedAt});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    print("Iam Here 5");
    print(id);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

// class Brand{
//   int? id;
//   String? name;
//   String? name_ar;
//   String? image;
//   String? created_at;
//   String? updated_at;
// }

// class Brands with ChangeNotifier{
//   List<Brand> brandList = [];
//
//   getBrands()async{
//     try{
//       var request = http.Request('GET', Uri.parse('https://packages.3codeit.com/api/brands'));
//       http.StreamedResponse response = await request.send();
//       if (response.statusCode == 200) {
//         // print(await response.stream.bytesToString());
//         var extractedData = await jsonDecode(await response.stream.bytesToString());
//         print(extractedData["brands"]);
//         var extractedData2 = await jsonDecode(extractedData["brands"]);
//         print(extractedData2[0].toString());
//
//
//
//       }
//       else {
//         print(response.reasonPhrase);
//       }
//     }catch(_error){
//       rethrow;
//     }
//   }
// }
