import 'dart:convert';

AllProductsResModel allProductsResModelFromJson(String str) =>
    AllProductsResModel.fromJson(json.decode(str));

String allProductsResModelToJson(AllProductsResModel data) =>
    json.encode(data.toJson());

class AllProductsResModel {
  String? msg;
  List<ProductModel>? productsList;

  AllProductsResModel({
    this.msg,
    this.productsList,
  });

  factory AllProductsResModel.fromJson(Map<String, dynamic> json) =>
      AllProductsResModel(
        msg: json["Msg"],
        productsList: json["data"] == null
            ? []
            : List<ProductModel>.from(
                json["data"]!.map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "data": productsList == null
            ? []
            : List<dynamic>.from(productsList!.map((x) => x.toJson())),
      };
}

class ProductModel {
  num? id;
  String? name;
  String? description;
  num? price;
  num? stock;
  String? category;
  dynamic imageUrl;
  num? user;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stock,
    this.category,
    this.imageUrl,
    this.user,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        category: json["category"],
        imageUrl: json["image_url"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
        "category": category,
        "image_url": imageUrl,
        "user": user,
      };
}
