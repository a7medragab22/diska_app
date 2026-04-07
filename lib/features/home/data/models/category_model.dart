class CategoryModel {
  final String id;
  final String title;
  final String image;
  final bool isSpecial;

  CategoryModel({
    required this.id,
    required this.title,
    required this.image,
    this.isSpecial = false,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      isSpecial: json['isSpecial'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "image": image, "isSpecial": isSpecial};
  }
}
