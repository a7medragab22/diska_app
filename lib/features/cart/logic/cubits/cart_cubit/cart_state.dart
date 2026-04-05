import 'package:diska_app/features/cart/data/models/cart_item_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartEmpty extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> items;

  CartLoaded(this.items);

  double get subtotal =>
      items.fold(0, (sum, item) => sum + item.total);

  double get tax => subtotal * 0.14;

  double get total => subtotal + tax;
}