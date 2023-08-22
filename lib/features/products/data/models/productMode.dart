import 'package:clean/features/products/domain/entities/ProductEntity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    int? id,
    String? title,
    String? description,
    int? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) : super(
            brand: brand,
            category: category,
            description: description,
            discountPercentage: discountPercentage,
            id: id,
            images: images,
            price: price,
            rating: rating,
            stock: stock,
            thumbnail: thumbnail,
            title: title);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      discountPercentage: json["discountPercentage"]?.toDouble(),
      rating: json["rating"]?.toDouble(),
      stock: json["stock"],
      brand: json["brand"],
      category: json["category"],
      thumbnail: json["thumbnail"],
      images: List<String>.from(json["images"].map((x) => x)),
    );
  }

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "title": title,
  //       "description": description,
  //       "price": price,
  //       "discountPercentage": discountPercentage,
  //       "rating": rating,
  //       "stock": stock,
  //       "brand": brand,
  //       "category": category,
  //       "thumbnail": thumbnail,
  //       "images": List<dynamic>.from(images.map((x) => x)),
  //     };
}
