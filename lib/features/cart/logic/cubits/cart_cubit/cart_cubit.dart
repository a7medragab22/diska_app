import 'package:diska_app/features/cart/data/models/cart_item_model.dart';
import 'package:diska_app/features/cart/logic/cubits/cart_cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartEmpty());

  final List<CartItemModel> _items = [];

  void addItem(CartItemModel item) {
    final index = _items.indexWhere((e) => e.id == item.id);

    if (index != -1) {
      _items[index].quantity += item.quantity;
    } else {
      _items.add(item);
    }

    _emitState();
  }

  void removeItem(int id) {
    _items.removeWhere((e) => e.id == id);
    _emitState();
  }

  void increase(int id) {
    final item = _items.firstWhere((e) => e.id == id);
    item.quantity++;
    _emitState();
  }

  void decrease(int id) {
    final item = _items.firstWhere((e) => e.id == id);

    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }

    _emitState();
  }

  void _emitState() {
    if (_items.isEmpty) {
      emit(CartEmpty());
    } else {
      emit(CartLoaded(List.from(_items)));
    }
  }
}
