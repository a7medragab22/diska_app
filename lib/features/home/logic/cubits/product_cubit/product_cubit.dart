import 'package:diska_app/features/home/data/models/product_model.dart';
import 'package:diska_app/features/home/logic/cubits/product_cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  List<ProductModel> _products = [];

  void loadProducts() {
    emit(ProductLoading());

    _products = [
      ProductModel(
        id: "1",
        name: "شوكولاتة",
        image: "assets/images/chekolet_product.jpeg",
        price: 350,
        discount: 15,
        category: ProductModel.availableCategories[0],
      ),
      ProductModel(
        id: "2",
        name: "بيبسي",
        image: "assets/images/chekolet_product.jpeg",
        price: 200,
        discount: 10,
        category: ProductModel.availableCategories[1],
      ),
      ProductModel(
        id: "2",
        name: "بيبسي",
        image: "assets/images/chekolet_product.jpeg",
        price: 200,
        category: ProductModel.availableCategories[1],
      ),
    ];

    emit(ProductLoaded(_products));
  }

  void increaseQty(int index) {
    _products[index].quantity++;
    emit(ProductLoaded(List.from(_products)));
  }

  void decreaseQty(int index) {
    if (_products[index].quantity > 1) {
      _products[index].quantity--;
      emit(ProductLoaded(List.from(_products)));
    }
  }

  void toggleFavorite(int index) {
    _products[index].isFavorite = !_products[index].isFavorite;
    emit(ProductLoaded(List.from(_products)));
  }
}
