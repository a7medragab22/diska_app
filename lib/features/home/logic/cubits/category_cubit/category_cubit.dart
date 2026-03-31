import 'package:diska_app/features/home/data/models/category_model.dart';
import 'package:diska_app/features/home/logic/cubits/category_cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void loadCategories() async {
    emit(CategoryLoading());

    try {
      await Future.delayed(const Duration(milliseconds: 300));

      final data = [
        CategoryModel(
          id: "1",
          title: "منتجات ألبان وعصائر",
          image: "assets/images/fa.jpg",
        ),
        CategoryModel(id: "2", title: "سناكس", image: "assets/images/fa.jpg"),
        CategoryModel(
          id: "3",
          title: "مشروبات غازيه",
          image: "assets/images/fa.jpg",
        ),
        CategoryModel(
          id: "4",
          title: "الشاي والقهوه",
          image: "assets/images/fa.jpg",
        ),
        CategoryModel(
          id: "5",
          title: "شوكولاتة",
          image: "assets/images/fa.jpg",
        ),
        CategoryModel(
          id: "6",
          title: "حلوى وسكاكر",
          image: "assets/images/fa.jpg",
        ),
        CategoryModel(
          id: "7",
          title: "عروض خاصة",
          image: "assets/images/fa.jpg",
          isSpecial: true,
        ),
        CategoryModel(
          id: "8",
          title: "الارز والمكرونه",
          image: "assets/images/fa.jpg",
        ),
        CategoryModel(
          id: "9",
          title: "اجبان وأطعمه للدهن",
          image: "assets/images/fa.jpg",
        ),
      ];

      emit(CategorySuccess(data));
    } catch (_) {
      emit(CategoryError());
    }
  }
}
