import 'package:diska_app/features/favourites/data/models/fav_model.dart';

abstract class FavState {}

class FavInitial extends FavState {}

class FavEmpty extends FavState {}

class FavLoaded extends FavState {
  final List<FavItemModel> items;

  FavLoaded(this.items);
}
