class BannerModel {
  final String imageUrl;
  final String title;
  final String badge;

  const BannerModel({
    required this.imageUrl,
    required this.title,
    required this.badge,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        imageUrl: json['imageUrl'] as String,
        title: json['title'] as String,
        badge: json['badge'] as String,
      );

  static List<BannerModel> get mock => const [
        BannerModel(
          imageUrl: 'https://diska.online/images/banners/summer.png',
          title: 'عروض الصيف',
          badge: 'عروض حصرية 🔥',
        ),
        BannerModel(
          imageUrl: 'https://diska.online/images/banners/9fdc4648-dbc2-4159-a212-d55b8ee84188.jpeg',
          title: 'خصم 45% على جميع الأصناف المستورده',
          badge: 'عروض حصرية 🔥',
        ),
      ];
}

class CategoryModel {
  final int id;
  final String name;
  final String imageUrl;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as int,
        name: json['name'] as String,
        imageUrl: json['imageUrl'] as String,
      );

  static List<CategoryModel> get mock => const [
        CategoryModel(id: 1, name: 'مشروبات غازيه',
            imageUrl: 'https://diska.online/images/categories/e47264da-f8c0-4e0c-baa0-046e703fd554.jpeg'),
        CategoryModel(id: 2, name: 'سناكس',
            imageUrl: 'https://diska.online/images/categories/1dc3a57d-498c-4fa6-8acd-913519ab1301.jpeg'),
        CategoryModel(id: 3, name: 'منتجات ألبان وعصائر',
            imageUrl: 'https://diska.online/images/categories/982fb970-b080-4370-bedf-2db04f80186d.jpeg'),
        CategoryModel(id: 4, name: 'حلوى وسكاكر',
            imageUrl: 'https://diska.online/images/categories/3c8d609f-9a62-4bd4-8514-c84cd9a44d05.jpeg'),
        CategoryModel(id: 5, name: 'شوكولاته',
            imageUrl: 'https://diska.online/images/categories/cbd746b5-a7cd-4568-a07c-5c63c9036c5a.jpeg'),
        CategoryModel(id: 6, name: 'الشاى والقهوه',
            imageUrl: 'https://diska.online/images/categories/28d3e246-9b15-4d3a-aa43-0fbdb54e8649.jpeg'),
        CategoryModel(id: 7, name: 'اجبان وأطعمه قابله للدهن',
            imageUrl: 'https://diska.online/images/categories/de6ba88a-8d04-4a26-b9ca-051767dc808c.jpeg'),
        CategoryModel(id: 8, name: 'الارز والمكرونه',
            imageUrl: 'https://diska.online/images/categories/19746db1-296a-46f1-aa90-c66504503560.jpeg'),
      ];
}

class ProductModel {
  final int id;
  final String name;
  final String categoryName;
  final String imageUrl;
  final double price;
  final double? oldPrice;
  final bool isAvailable;
  final bool isBestSeller;
  final int? discountPercent;

  const ProductModel({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.imageUrl,
    required this.price,
    this.oldPrice,
    required this.isAvailable,
    this.isBestSeller = false,
    this.discountPercent,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int,
        name: json['name'] as String,
        categoryName: json['categoryName'] as String,
        imageUrl: json['imageUrl'] as String,
        price: (json['price'] as num).toDouble(),
        oldPrice: json['oldPrice'] != null ? (json['oldPrice'] as num).toDouble() : null,
        isAvailable: json['isAvailable'] as bool,
        isBestSeller: json['isBestSeller'] as bool? ?? false,
        discountPercent: json['discountPercent'] as int?,
      );

  static List<ProductModel> get mock => const [
        ProductModel(id: 10, name: 'شوكولاته', categoryName: 'شوكولاته',
            imageUrl: 'https://diska.online/images/products/3895fc1c-cde1-4f9b-9553-3604cfe9cfe3.jpeg',
            price: 350, isAvailable: true),
        ProductModel(id: 8, name: 'بيبسى', categoryName: 'مشروبات غازيه',
            imageUrl: 'https://diska.online/images/products/96e879c1-8869-4ea1-828b-48c031af0345.jpeg',
            price: 45000, isAvailable: true),
        ProductModel(id: 7, name: 'عصير رمان ٢٥٠', categoryName: 'منتجات ألبان وعصائر',
            imageUrl: 'https://diska.online/images/products/fa0fe567-9873-4a4f-8b04-bcffaa2ec662.jpeg',
            price: 250, oldPrice: 305, isAvailable: true, discountPercent: 18),
        ProductModel(id: 6, name: 'عصير رمان ٢٥٠', categoryName: 'منتجات ألبان وعصائر',
            imageUrl: 'https://diska.online/images/products/664d87a8-289f-4005-bdc8-00a837c6f2ed.jpeg',
            price: 250, oldPrice: 305, isAvailable: true, discountPercent: 18),
        ProductModel(id: 5, name: 'شوكولاته', categoryName: 'حلوى وسكاكر',
            imageUrl: 'https://diska.online/images/products/349502c2-9ddc-4b73-b895-3e06bec66851.jpeg',
            price: 2500, isAvailable: true, isBestSeller: true),
        ProductModel(id: 4, name: 'حليب', categoryName: 'منتجات ألبان وعصائر',
            imageUrl: 'https://diska.online/images/products/tshirt.png',
            price: 350, isAvailable: true),
        ProductModel(id: 3, name: 'أرز 5 كيلو', categoryName: 'الارز والمكرونه',
            imageUrl: 'https://diska.online/images/products/abdda3e5-9341-4793-a038-d5f66006fbe9.jpeg',
            price: 150, isAvailable: true),
        ProductModel(id: 2, name: 'بيبسى', categoryName: 'مشروبات غازيه',
            imageUrl: 'https://diska.online/images/products/6030ac10-4bc2-4660-969b-809b7e1e805a.jpeg',
            price: 35000, isAvailable: true, isBestSeller: true),
        ProductModel(id: 1, name: 'كولا', categoryName: 'مشروبات غازيه',
            imageUrl: 'https://diska.online/images/products/c04146ce-e191-494a-9ecc-5d15daff1793.jpeg',
            price: 45000, isAvailable: true),
      ];
}