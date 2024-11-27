import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  @JsonKey(name: 'creationAt')
  final String createdAt;
  @JsonKey(name: 'updatedAt')
  final String updatedAt;
  final CategoryModel category;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  List<Object?> get props => [id, title, price, description, images, createdAt, updatedAt, category];

  ProductModel copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    List<String>? images,
    String? createdAt,
    String? updatedAt,
    CategoryModel? category,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? this.category,
    );
  }
}

@JsonSerializable()
class CategoryModel extends Equatable {
  final int id;
  final String name;
  final String image;
  @JsonKey(name: 'creationAt')
  final String createdAt;
  @JsonKey(name: 'updatedAt')
  final String updatedAt;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  List<Object?> get props => [id, name, image, createdAt, updatedAt];

  CategoryModel copyWith({
    int? id,
    String? name,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
