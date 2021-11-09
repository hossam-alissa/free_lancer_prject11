import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Map<String, List<Map<String, Object>>> countries = {
//   "countries": [
//     {
//       "id": 3,
//       "name": "test",
//       "name_ar": "X-Ray Film Viewer",
//       "code": "qdq",
//       "currency": "ascsa",
//       "symbol": "asc",
//       "image":
//           "https:\/\/packages.3codeit.com\/storage\/app\/public\/attachment\/76530.png",
//       "content_id": 1,
//       "palladium": "cs",
//       "platinum": "q",
//       "rhodium": "v",
//       "rate": "v",
//       "discount": "ff",
//       "price": "ascacs",
//       "views": "aq",
//       "total_price": 1,
//       "calculator": 0,
//       "adding_accounts": 1,
//       "created_at": "2021-11-07T19:05:06.000000Z",
//       "updated_at": "2021-11-08T00:05:06.000000Z",
//       "memberships": [
//         {
//           "id": 2,
//           "name": "test",
//           "image":
//               "https:\/\/packages.3codeit.com\/storage\/app\/public\/attachment\/234417.png",
//           "price": 5,
//           "views": 6,
//           "type": "paid",
//           "account": 6,
//           "palladium": "\u0631\u0633",
//           "platinum": "\u0636",
//           "rhodium": "q",
//           "currency": "",
//           "created_at": "2021-11-07T19:04:34.000000Z",
//           "updated_at": "2021-11-08T00:04:34.000000Z",
//           "pivot": {"country_id": 3, "member_id": 2, "price": 2, "discount": 6}
//         }
//       ]
//     }
//   ]
// };

class Country with ChangeNotifier {
  List<Countries>? countries;

  Country({this.countries});

  fitchData() async {
    try {
      // fromJson(await jsonDecode(await response.stream.bytesToString()));
      var request = http.Request(
          'GET', Uri.parse('https://packages.3codeit.com/api/countries'));
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
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  int? id;
  String? name;
  String? nameAr;
  String? code;
  String? currency;
  String? symbol;
  String? image;
  int? contentId;
  String? palladium;
  String? platinum;
  String? rhodium;
  String? rate;
  String? discount;
  String? price;
  String? views;
  int? totalPrice;
  int? calculator;
  int? addingAccounts;
  String? createdAt;
  String? updatedAt;
  List<Memberships>? memberships;

  Countries(
      {this.id,
      this.name,
      this.nameAr,
      this.code,
      this.currency,
      this.symbol,
      this.image,
      this.contentId,
      this.palladium,
      this.platinum,
      this.rhodium,
      this.rate,
      this.discount,
      this.price,
      this.views,
      this.totalPrice,
      this.calculator,
      this.addingAccounts,
      this.createdAt,
      this.updatedAt,
      this.memberships});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    code = json['code'];
    currency = json['currency'];
    symbol = json['symbol'];
    image = json['image'];
    contentId = json['content_id'];
    palladium = json['palladium'];
    platinum = json['platinum'];
    rhodium = json['rhodium'];
    rate = json['rate'];
    discount = json['discount'];
    price = json['price'];
    views = json['views'];
    totalPrice = json['total_price'];
    calculator = json['calculator'];
    addingAccounts = json['adding_accounts'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['memberships'] != null) {
      memberships = <Memberships>[];
      json['memberships'].forEach((v) {
        memberships!.add(new Memberships.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['code'] = this.code;
    data['currency'] = this.currency;
    data['symbol'] = this.symbol;
    data['image'] = this.image;
    data['content_id'] = this.contentId;
    data['palladium'] = this.palladium;
    data['platinum'] = this.platinum;
    data['rhodium'] = this.rhodium;
    data['rate'] = this.rate;
    data['discount'] = this.discount;
    data['price'] = this.price;
    data['views'] = this.views;
    data['total_price'] = this.totalPrice;
    data['calculator'] = this.calculator;
    data['adding_accounts'] = this.addingAccounts;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.memberships != null) {
      data['memberships'] = this.memberships!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Memberships {
  int? id;
  String? name;
  String? image;
  int? price;
  int? views;
  String? type;
  int? account;
  String? palladium;
  String? platinum;
  String? rhodium;
  String? currency;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Memberships(
      {this.id,
      this.name,
      this.image,
      this.price,
      this.views,
      this.type,
      this.account,
      this.palladium,
      this.platinum,
      this.rhodium,
      this.currency,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Memberships.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    views = json['views'];
    type = json['type'];
    account = json['account'];
    palladium = json['palladium'];
    platinum = json['platinum'];
    rhodium = json['rhodium'];
    currency = json['currency'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['views'] = this.views;
    data['type'] = this.type;
    data['account'] = this.account;
    data['palladium'] = this.palladium;
    data['platinum'] = this.platinum;
    data['rhodium'] = this.rhodium;
    data['currency'] = this.currency;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? countryId;
  int? memberId;
  int? price;
  int? discount;

  Pivot({this.countryId, this.memberId, this.price, this.discount});

  Pivot.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    memberId = json['member_id'];
    price = json['price'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['member_id'] = this.memberId;
    data['price'] = this.price;
    data['discount'] = this.discount;
    return data;
  }
}
