import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Map<String, List<Map<String, Object>>> product = {
  "products": [
    {
      "id": 2,
      "name": "v",
      "name_ar": "vw",
      "image":
          "https:\/\/packages.3codeit.com\/storage\/app\/public\/attachment\/906903.png",
      "details": "cv",
      "details_ar": "v",
      "weight": "s",
      "palladium": "vs",
      "rhodium": "va",
      "brand_id": 4,
      "type_id": 3,
      "catalytic_id": 3,
      "is_hybird": "yes",
      "created_at": "2021-10-24T21:00:22.000000Z",
      "updated_at": "2021-10-24T21:00:22.000000Z",
      "brand": {
        "id": 4,
        "name": "a",
        "name_ar": "v",
        "image":
            "https:\/\/packages.3codeit.com\/storage\/app\/public\/attachment\/675597.png",
        "created_at": "2021-10-24T20:59:49.000000Z",
        "updated_at": "2021-10-24T20:59:49.000000Z"
      },
      "type": {
        "id": 3,
        "name": "v",
        "name_ar": "sv",
        "created_at": "2021-10-24T21:00:03.000000Z",
        "updated_at": "2021-10-24T21:00:03.000000Z"
      },
      "catalytic": {
        "id": 3,
        "name": "c",
        "name_ar": "vdb",
        "created_at": "2021-10-24T20:59:56.000000Z",
        "updated_at": "2021-10-24T20:59:56.000000Z"
      }
    }
  ]
};

class Product with ChangeNotifier{
  List<Products>? products;

  Product({this.products});

  fitchData() async {
    try {
      var request = http.Request('GET', Uri.parse('https://packages.3codeit.com/api/products/4'));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        fromJson(await jsonDecode(await response.stream.bytesToString()));
        notifyListeners();      }
      else {
        print(response.reasonPhrase);
      }
    } catch (_error) {
      rethrow;
    }
  }

  fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? nameAr;
  String? image;
  String? details;
  String? detailsAr;
  String? weight;
  String? palladium;
  String? rhodium;
  int? brandId;
  int? typeId;
  int? catalyticId;
  String? isHybird;
  String? createdAt;
  String? updatedAt;
  BrandInProduct? brand;
  Type? type;
  Type? catalytic;

  Products(
      {this.id,
        this.name,
        this.nameAr,
        this.image,
        this.details,
        this.detailsAr,
        this.weight,
        this.palladium,
        this.rhodium,
        this.brandId,
        this.typeId,
        this.catalyticId,
        this.isHybird,
        this.createdAt,
        this.updatedAt,
        this.brand,
        this.type,
        this.catalytic});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
    details = json['details'];
    detailsAr = json['details_ar'];
    weight = json['weight'];
    palladium = json['palladium'];
    rhodium = json['rhodium'];
    brandId = json['brand_id'];
    typeId = json['type_id'];
    catalyticId = json['catalytic_id'];
    isHybird = json['is_hybird'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brand = json['brand'] != null ? new BrandInProduct.fromJson(json['brand']) : null;
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    catalytic =
    json['catalytic'] != null ? new Type.fromJson(json['catalytic']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    data['details'] = this.details;
    data['details_ar'] = this.detailsAr;
    data['weight'] = this.weight;
    data['palladium'] = this.palladium;
    data['rhodium'] = this.rhodium;
    data['brand_id'] = this.brandId;
    data['type_id'] = this.typeId;
    data['catalytic_id'] = this.catalyticId;
    data['is_hybird'] = this.isHybird;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    if (this.catalytic != null) {
      data['catalytic'] = this.catalytic!.toJson();
    }
    return data;
  }
}

class BrandInProduct {
  int? id;
  String? name;
  String? nameAr;
  String? image;
  String? createdAt;
  String? updatedAt;

  BrandInProduct(
      {this.id,
        this.name,
        this.nameAr,
        this.image,
        this.createdAt,
        this.updatedAt});

  BrandInProduct.fromJson(Map<String, dynamic> json) {
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

class Type {
  int? id;
  String? name;
  String? nameAr;
  String? createdAt;
  String? updatedAt;

  Type({this.id, this.name, this.nameAr, this.createdAt, this.updatedAt});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

