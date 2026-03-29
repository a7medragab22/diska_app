import 'package:diska_app/features/home/data/repos/home_repo.dart';

import '../models/home_models.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<BannerModel>> getBanners() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return BannerModel.mock;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return CategoryModel.mock;
  }

  @override
  Future<List<ProductModel>> getLatestProducts() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return ProductModel.mock;
  }
}