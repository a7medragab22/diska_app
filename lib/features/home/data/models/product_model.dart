class ProductModel {
  final String id;
  final String name;
  final String image;
  final double price;
  final int? discount;
  final String category;
  final bool isAvailable;
  int quantity;
  bool isFavorite;

  static const List<String> availableCategories = [
    'حلويات',
    'مشروبات',
    'مخبوزات',
    'سناك',
    'أخرى',
  ];

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.discount,
    this.category = 'أخرى',
    this.isAvailable = true,
    this.quantity = 1,
    this.isFavorite = false,
  });
}
