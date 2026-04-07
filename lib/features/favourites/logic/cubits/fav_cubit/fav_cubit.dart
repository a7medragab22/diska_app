import 'package:diska_app/features/favourites/data/models/fav_model.dart';
import 'package:diska_app/features/favourites/logic/cubits/fav_cubit/fav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavEmpty());

  final List<FavItemModel> _items = [];

  void addToFav(FavItemModel item) {
    final index = _items.indexWhere((e) => e.id == item.id);

    if (index == -1) {
      _items.add(item);
      _emitState();
    }
  }

  void removeFromFav(int id) {
    _items.removeWhere((e) => e.id == id);
    _emitState();
  }

  bool isFav(int id) {
    return _items.any((e) => e.id == id);
  }

  void _emitState() {
    if (_items.isEmpty) {
      emit(FavEmpty());
    } else {
      emit(FavLoaded(List.from(_items)));
    }
  }
}
