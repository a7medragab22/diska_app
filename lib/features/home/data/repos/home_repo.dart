import '../models/home_models.dart';

abstract class HomeRepository {
  Future<List<BannerModel>>   getBanners();
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>>  getLatestProducts();
}