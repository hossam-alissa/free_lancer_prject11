import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Brand with ChangeNotifier {
  List<Brands>? brands;

  Brand({this.brands});

  fitchData() async {
    try {
      var request = http.Request(
          'GET', Uri.parse('https://packages.3codeit.com/api/brands'));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        fromJson(await jsonDecode(await response.stream.bytesToString()));
        notifyListeners();
      } else {
        print(response.reasonPhrase);
      }
    } catch (_error) {
      rethrow;
    }
  }

  fromJson(Map<String, dynamic> json) {
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(new Brands.fromJson(v));
      });
    }
  }

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
