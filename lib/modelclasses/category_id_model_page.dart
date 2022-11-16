// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class CategoryModel {
  int CategoryId;
  String CategoryTitle;
  String ImageFile;
  CategoryModel({
    required this.CategoryId,
    required this.CategoryTitle,
    required this.ImageFile,
  });

  CategoryModel copyWith({
    int? CategoryId,
    String? CategoryTitle,
    String? ImageFile,
  }) {
    return CategoryModel(
      CategoryId: CategoryId ?? this.CategoryId,
      CategoryTitle: CategoryTitle ?? this.CategoryTitle,
      ImageFile: ImageFile ?? this.ImageFile,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'CategoryId': CategoryId});
    result.addAll({'CategoryTitle': CategoryTitle});
    result.addAll({'ImageFile': ImageFile});

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      CategoryId: map['CategoryId']?.toInt() ?? 0,
      CategoryTitle: map['CategoryTitle'] ?? '',
      ImageFile: map['ImageFile'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'TabsModel(CategoryId: $CategoryId, CategoryTitle: $CategoryTitle, ImageFile: $ImageFile)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.CategoryId == CategoryId &&
        other.CategoryTitle == CategoryTitle &&
        other.ImageFile == ImageFile;
  }

  @override
  int get hashCode =>
      CategoryId.hashCode ^ CategoryTitle.hashCode ^ ImageFile.hashCode;
}
