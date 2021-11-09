import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

// Map<String, List<Map<String, Object>>> memberShip = {
//   "members": [
//     {
//       "id": 2,
//       "name": "test",
//       "image":
//           "https:\/\/packages.3codeit.com\/storage\/app\/public\/attachment\/234417.png",
//       "price": 5,
//       "views": 6,
//       "type": "paid",
//       "account": 6,
//       "palladium": "\u0631\u0633",
//       "platinum": "\u0636",
//       "rhodium": "q",
//       "currency": "",
//       "created_at": "2021-11-07T19:04:34.000000Z",
//       "updated_at": "2021-11-08T00:04:34.000000Z"
//     }
//   ]
// };

class MemberShip with ChangeNotifier {
  List<Members>? members;

  MemberShip({this.members});

  fitchData() async {
    try {
      // fromJson(await jsonDecode(await response.stream.bytesToString()));
      var request = http.Request(
          'GET', Uri.parse('https://packages.3codeit.com/api/members'));
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
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(new Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Members {
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

  Members(
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
      this.updatedAt});

  Members.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
